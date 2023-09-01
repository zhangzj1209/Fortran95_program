module typedef
  implicit none
  type :: datalink
    integer :: i
    type(datalink), pointer :: next
  end type datalink
end module typedef

program ex1012
  use typedef
  implicit none
  type(datalink) , pointer :: p, head
  integer :: i,n,err

  write(*,*) 'Input N:'
  read(*,*) n

  allocate( head )
  head%i=1
  nullify(head%next)

  p=>head
  do i=2,n
    allocate( p%next, stat=err )
    if ( err /= 0 ) then
      write(*,*) 'Out of memory!'
      stop
    end if
    p=>p%next
    p%i=i
  end do
  nullify(p%next)

  p=>head
  do while(.true.)
    write(*, "(i5)" ) p%i
	if ( .not. associated(p%next) ) exit
    p=>p%next
  end do

  stop
end program
