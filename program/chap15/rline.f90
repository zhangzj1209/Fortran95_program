program main
  use IMSL
  implicit none
  integer, parameter :: NOBS = 5
  real XDATA(NOBS), YDATA(NOBS)
  real B0, B1
  real STAT(12)
  real xinc, xp, value
  real F,X
  F(X) = 2*X + 3
  integer I

  ! 产生数据点  
  do I=1, NOBS
    XDATA(I) = real(I)
    YDATA(I) = F( XDATA(I) )
  end do

  call RLINE( NOBS, XDATA, YDATA, B0, B1, STAT )
  ! 结果一定为y=2X+3, 因为数据点是根据这个函数来产生的.
  write(*,"('Y=',F5.2,'X+'F5.2)") B1,B0

  stop
end program