module MA
  implicit none
  type ta
    integer a
  end type
  interface operator(+)
    module procedure add
  end interface
contains
  integer function add(a,b)
    type(ta), intent(in) :: a,b
	add=a%a+b%a
  end function
end module

program main
  use MA
  implicit none
  type(ta) :: a,b
  integer  :: c
  a%a=1
  b%a=2
  c=a+b
  write(*,*) c
end program

