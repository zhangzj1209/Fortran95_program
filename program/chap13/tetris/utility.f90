module UTILITY
  implicit none
contains
  ! ��value���Ƶ�min��max֮��
  subroutine Bound(min,max,value)
    integer min,max,value
	if ( value<min ) value=min
	if ( value>max ) value=max
  end subroutine
end module