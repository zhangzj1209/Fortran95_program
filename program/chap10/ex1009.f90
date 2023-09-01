module func
! person类型最少占用18 bytes
! 因为它有10个字元及两个浮点数
type person
  character(len=10) :: name
  real :: height, weight
end type
! pperson类型通常占用4 bytes
! 因为它里面只有一个指针, 指针在PC中固定使用4 bytes
type pperson
  type(person), pointer :: p
end type

contains 
subroutine sort(p)
  implicit none
  type(pperson) :: p(:)
  type(pperson) :: temp
  integer i,j,s

  s = size(p,1)
  do i=1,s-1
    do j=i+1, s
	  if ( p(j)%p%height < p(i)%p%height ) then
	    temp = p(i)
		p(i) = p(j)
		p(j) = temp
	  end if
	end do
  end do

  return
end subroutine

end module

program ex1009
  use func
  implicit none
  type(person), target :: p(5) = (/ person("陈同学", 180.0, 75.0), &
                                    person("黄同学", 170.0, 65.0), &
							        person("刘同学", 175.0, 80.0), &
							        person("蔡同学", 182.0, 78.0), &
							        person("许同学", 178.0, 70.0)  &
						         /) 
  type(pperson) :: pt(5)
  integer i
  ! 把pt数组中的指针全部指向数组p
  forall(i=1:5)
    pt(i)%p => p(i)
  end forall
  ! 依照身高从小到大排序
  call sort(pt)
  ! 输出排序的结果
  write(*,"(5(A8,F6.1,F5.1/))") (pt(i)%p, i=1,5)

  stop
end
