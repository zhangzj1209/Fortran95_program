program ex0509
implicit none
  real :: a
  real :: b = 3.0

  a=SQRT(b)**2-b ! ������aӦ��Ҫ����0

  if ( a==0.0 ) then
	write(*,*) "a����0"
  else
    write(*,*) "a������0"
  end if

stop
end