module utility
  implicit none

  interface area
    module procedure CircleArea
	module procedure RectArea
  end interface

contains
  
  real function CircleArea(r)
    real, parameter :: PI=3.14159
    real r
	CircleArea = r*r*PI
	return
  end function

  real function RectArea(a,b)
    real a,b
	RectArea = a*b
	return
  end function

end module

program main
  use UTILITY
  implicit none

  write(*,*) area(1.0)
  write(*,*) area(2.0,3.0)

  stop
end program