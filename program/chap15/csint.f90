program main
  use IMSL
  implicit none
  integer, parameter :: NDATA = 25, N = 30
  real XDATA(NDATA), FDATA(NDATA)
  real BREAK(NDATA), CSCOEF(4,NDATA), X
  real, parameter :: xmin = -5.0, xmax = 5.0
  real xinc, xp, value
  integer I
  
  xinc = (xmax-xmin)/(NDATA-1)
  xp = xmin
  do I=1, NDATA
    XDATA(I) = xp
    FDATA(I) = sin( XDATA(I) )
	xp = xp + xinc
  end do

  call CSINT (NDATA, XDATA, FDATA, BREAK, CSCOEF)
  xinc = (xmax-xmin)/(N-1)
  xp = xmin
  do I=1, N
    ! 由xp值来求插值
    value = CSVAL(xp, NDATA-1, BREAK, CSCOEF)
    write(*,"('(',F5.2,',',F5.2,') error:'F6.3)" ) &
	xp, value, sin(xp)-value
	xp = xp + xinc
  end do

  stop
end program