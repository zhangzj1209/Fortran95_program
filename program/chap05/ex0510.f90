program ex0510
implicit none
  real :: a
  real :: b = 4.0
  real, parameter :: e = 0.0001

  a=SQRT(b)**2-b ! ������aӦ��Ҫ����0
  
  if ( abs(a-0.0)<=e ) then
	write(*,*) "a����0"
  else
    write(*,*) "a������0"
  end if

  stop
end