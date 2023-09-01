module func
! person��������ռ��18 bytes
! ��Ϊ����10����Ԫ������������
type person
  character(len=10) :: name
  real :: height, weight
end type
! pperson����ͨ��ռ��4 bytes
! ��Ϊ������ֻ��һ��ָ��, ָ����PC�й̶�ʹ��4 bytes
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
  type(person), target :: p(5) = (/ person("��ͬѧ", 180.0, 75.0), &
                                    person("��ͬѧ", 170.0, 65.0), &
							        person("��ͬѧ", 175.0, 80.0), &
							        person("��ͬѧ", 182.0, 78.0), &
							        person("��ͬѧ", 178.0, 70.0)  &
						         /) 
  type(pperson) :: pt(5)
  integer i
  ! ��pt�����е�ָ��ȫ��ָ������p
  forall(i=1:5)
    pt(i)%p => p(i)
  end forall
  ! ������ߴ�С��������
  call sort(pt)
  ! �������Ľ��
  write(*,"(5(A8,F6.1,F5.1/))") (pt(i)%p, i=1,5)

  stop
end
