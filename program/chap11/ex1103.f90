module MA
  implicit none
  real a,b
contains
  subroutine getx()
    write(*,"('x=',F5.2)") -b/a
	return
  end subroutine
end module

module MB
  use MA
  implicit none
  real c
contains
  subroutine getx2()
    real a2, d, sqrt_d
	a2=2*a
	d=b*b-4*a*c
	if ( d>=0 ) then
	  sqrt_d = sqrt(d)
	  write(*,"('x=',F5.2,',',F5.2)") (-b+sqrt_d)/a2, (-b-sqrt_d)/a2
	else
	  write(*,*) "无实数解"
	end if
  end subroutine
end module

subroutine sub1()
  use MA
  implicit none
  a=2.0
  b=3.0
  call getx()
  return
end subroutine

subroutine sub2()
  use MB
  implicit none
  a=1.0
  b=4.0
  c=4.0
  call getx2()
  return
end subroutine

program main
  implicit none
  call sub1()
  call sub2()
end program

