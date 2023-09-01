real function circle_area(radius)
!DEC$ ATTRIBUTES DLLEXPORT :: CIRCLE_AREA
!DEC$ ATTRIBUTES ALIAS : "Circle_Area" :: CIRCLE_AREA
  implicit none
  real radius
  real, parameter :: PI = 3.14159
  circle_area = radius*radius*PI
  return
end function

integer function sum(a)
!DEC$ ATTRIBUTES DLLEXPORT :: SUM
  implicit none
  integer :: a(10)
  integer i
  sum=0
  do i=1,10
    sum=sum+a(i)
  end do

  return
end function

subroutine MakeLower(string)
!DEC$ ATTRIBUTES DLLEXPORT :: MAKELOWER
  implicit none
  character(len=*) :: string
  integer :: len, i, code
  len = len_trim(string)
  do i=1,len
    code = ichar(string(i:i))
    if ( code >= ichar('a') .and. code <= ichar('z') ) then
	  string(i:i) = char(code-32)
    end if
  end do
  return
end subroutine