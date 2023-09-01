module typedef
  implicit none
  type :: datalink
    integer :: i
    type(datalink), pointer :: prev ! ָ����һ������
    type(datalink), pointer :: next ! ָ����һ������
  end type datalink
end module typedef

program ex1014
  use typedef
  implicit none
  type(datalink), target  :: node1,node2,node3
  type(datalink), pointer :: p
  integer, parameter :: s=6
  integer :: i

  node1 = datalink(1, node3, node2)
  node2 = datalink(2, node1, node3)
  node3 = datalink(3, node2, node1)
  
  write(*,*) "��ǰ������"
  p=>node1
  do i=1,s
    write(*,*) p%i
	if ( .not. associated(p%next) ) exit
	p=>p%next
  end do  

  write(*,*) "�Ӻ���ǰ���"
  p=>node3
  do i=1,s
    write(*,*) p%i
	if ( .not. associated(p%prev) ) exit
	p=>p%prev
  end do  

stop
end program
