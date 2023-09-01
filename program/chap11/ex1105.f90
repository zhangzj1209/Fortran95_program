module MA
  implicit none
  interface getx
    module procedure getx1
	module procedure getx2
  end interface
contains
  subroutine getx1(a,b)
    real a,b
    write(*,"('x=',F5.2)") -b/a
	return
  end subroutine

  subroutine getx2(a,b,c)
    real a,b,c
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

program main
  use MA
  implicit none
  call getx(1.0,2.0)     ! 实际会调用getx1
  call getx(1.0,3.0,2.0) ! 实际会调用getx2
end program

