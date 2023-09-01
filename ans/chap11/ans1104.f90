module vector_utility
  implicit none
  type vector
    real x,y
  end type

  interface operator(+)
    module procedure vector_add_vector
  end interface

  interface operator(-)
    module procedure vector_sub_vector
  end interface

  interface operator(*)
    module procedure real_mul_vector
	module procedure vector_mul_real
	module procedure vector_dot_vector
  end interface

  interface operator(.dot.)
    module procedure vector_dot_vector
  end interface
contains
  
  type(vector) function vector_add_vector(a,b)
    type(vector), intent(in) :: a,b
	vector_add_vector = vector(a%x+b%x, a%y+b%y)
  end function

  type(vector) function vector_sub_vector(a,b)
    type(vector), intent(in) :: a,b
	vector_sub_vector = vector(a%x-b%x, a%y-b%y)
  end function

  type(vector) function real_mul_vector(a,b)
    real, intent(in) :: a
	type(vector), intent(in) :: b
	real_mul_vector = vector( a*b%x, a*b%y )
  end function
  
  type(vector) function vector_mul_real(a,b)
    type(vector), intent(in) :: a
    real, intent(in) :: b
    vector_mul_real = real_mul_vector(b,a) 
  end function

  real function vector_dot_vector(a,b)
    type(vector), intent(in) :: a,b
	vector_dot_vector = a%x*b%x + a%y*b%y
  end function

  subroutine output(vec)
    type(vector) :: vec
	write(*,"('('F6.2','F6.2')')") vec
  end subroutine

end module

program main
  use vector_utility
  implicit none
  type(vector) a,b,c
  a=vector(1.0, 2.0)
  b=vector(2.0, 1.0)
  c=a+b 
  call output(c)
  c=a-b
  call output(c)
  write(*,*) a*b

end program main