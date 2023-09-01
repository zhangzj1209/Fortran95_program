module UTILITY
  implicit none
contains
  ! 把value限制到min到max之间
  subroutine Bound(min,max,value)
    integer min,max,value
	if ( value<min ) value=min
	if ( value>max ) value=max
  end subroutine
end module