program ex0509
implicit none
  real :: a
  real :: b = 3.0

  a=SQRT(b)**2-b ! 理论上a应该要等于0

  if ( a==0.0 ) then
	write(*,*) "a等于0"
  else
    write(*,*) "a不等于0"
  end if

stop
end