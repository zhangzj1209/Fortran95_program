module typedef
  implicit none
  type :: datalink
    integer :: i
    type(datalink), pointer :: next
  end type datalink
end module typedef

program ex1010
  use typedef
  implicit none
  type(datalink) , target  :: node1,node2,node3
  integer :: i

  node1%i=1
  node1%next=>node2
  node2%i=2
  node2%next=>node3
  node3%i=3
  nullify( node3%next )

  write(*,*) node1%i
  write(*,*) node1%next%i      
  write(*,*) node1%next%next%i 

stop
end program
