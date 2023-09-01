module typedef
  implicit none
  type :: datalink
    integer :: i
    type(datalink), pointer :: next
  end type datalink
end module typedef

program ex1011
  use typedef
  implicit none
  type(datalink), target  :: node1,node2,node3
  type(datalink), pointer :: p
  integer :: i
  
  p=>node1
  node1%i=1
  node1%next=>node2
  node2%i=2
  node2%next=>node3
  node3%i=3
  nullify( node3%next )

  do while(.true.) 
    write(*,*) p%i
	if ( .not. associated(p%next) ) exit
	p=>p%next ! 把p向后移动, 从node(n)移到node(n+1)
  end do

stop
end program
