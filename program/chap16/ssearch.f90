! 顺序查找法范例
! By Perng 1997/8/31
program SEQUENTIAL_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! 存放数据组的类型
  integer KEY             ! 记录所要找的值
  integer LOC
  integer, external :: SEQUENTIAL_SEARCH

  write(*,"('Source=>',10I3)") A
  write(*,*) 'Input KEY:'
  read (*,*) KEY                    ! 键入待寻数据
  ! 调用顺序查找的函数
  LOC = SEQUENTIAL_SEARCH(A,N,KEY)
  if ( LOC/=0 ) then
    write(*,"('A(',I2,' )='I3)") LOC,KEY
  else
    write(*,*) "Not found"
  end if
  stop
end program
!
! 顺序查找法的子程序
!
integer function SEQUENTIAL_SEARCH(A,N,KEY)
  implicit none
  integer N, A(N)
  integer KEY             ! 所要寻找的值
  integer I               ! 循环的计数器

  do I=1,N  ! 开始做扫瞄, 最多做N次.
    if ( KEY==A(I) ) then
      ! 找到了, 返回数字在类型中的位置
	  SEQUENTIAL_SEARCH=I
	  return
	end if
  end do
  ! 没找到时返回-1
  SEQUENTIAL_SEARCH=0
  return
end function
