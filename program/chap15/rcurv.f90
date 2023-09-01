program main
  use IMSL
  implicit none
  integer, parameter :: NOBS = 10, NDEG = 2
  real XDATA(NOBS), YDATA(NOBS)
  real B(NDEG+1), SSPOLY(NDEG+1)
  real STAT(12)
  real xinc, xp, value
  real F,X,R
  F(X,R) = R + 1 + 2*X + 3*X*X
  integer I

  call random_seed()
  ! 产生数据点  
  do I=1, NOBS
    XDATA(I) = real(I)
	call random_number(R)
    YDATA(I) = F( XDATA(I), R )
  end do

  call RCURV( NOBS, XDATA, YDATA, NDEG, B, SSPOLY, STAT )
  write(*,"(F5.2'+'F5.2'X+'F5.2'X*X')") B

  stop
end program