program ex0510
implicit none
  real :: a
  real :: b = 4.0
  real, parameter :: e = 0.0001

  a=SQRT(b)**2-b ! 理论上a应该要等于0
  
  if ( abs(a-0.0)<=e ) then
	write(*,*) "a等于0"
  else
    write(*,*) "a不等于0"
  end if

  stop
end