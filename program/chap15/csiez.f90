program main
  use IMSL
  implicit none
  integer, parameter :: NDATA = 10, N = 20
  real XDATA(NDATA), FDATA(NDATA)
  real XVEC(N), VALUE(N)
  real, parameter :: xmin = -5.0, xmax = 5.0
  real xinc, xp
  integer i

  xinc = (xmax-xmin)/(NDATA-1)
  xp = xmin
  do i=1, NDATA
    XDATA(I) = xp
    FDATA(I) = SIN( XDATA(I) )
	xp = xp+xinc
  end do

  xinc = (xmax-xmin)/(N-1)
  xp = xmin
  do i=1, N
    XVEC(I) = xp
	xp = xp+xinc
  end do
  ! ����ֵ
  call CSIEZ (NDATA, XDATA, FDATA, N, XVEC, VALUE)
  ! �����ֵ���
  do i=1, N
    write(*,"('(',F5.2,',',F5.2,') error:'F6.3)") &
	XVEC(i), VALUE(i), VALUE(i)-sin( XVEC(i) )
  end do
  stop
end program