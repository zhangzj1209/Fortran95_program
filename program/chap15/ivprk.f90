! IMSL IVPRK范例
! 求解Y'(t)=-0.01*Y(t)
! initial condition Y(0)=2
program main
  use IMSL
  implicit none
  integer, parameter :: MXPARM = 50
  integer, parameter :: N = 1
  integer IDO, ISTEP, NOUT
  real PARAM(MXPARM), T, TEND, Y(N)
  real, parameter :: TOL = 1E-3
  external FCN

  PARAM = 0
  WRITE (*,"(' Time', 9X,'Y')")
  Y(1) = 2.0 ! Initial condition
  T = 0.0    ! Y(T)=2.0中的时间T值
  IDO = 1
  do ISTEP=0,100,10
    TEND = ISTEP
	call IVPRK (IDO, N, FCN, T, TEND, TOL, PARAM, Y)
    write (*,'(F5.1,F12.4)') T, Y
  end do
  call IVPRK (3, N, FCN, T, TEND, TOL, PARAM, Y)

  stop
end program
! 计算微分方程式
! YPRIME=Y'=f(t,y)
subroutine FCN (N, T, Y, YPRIME)
  implicit none
  integer N
  real T, Y(N), YPRIME(N)
  real, parameter :: K=-1E-2
  ! Y' = K*Y
  YPRIME(1) = K*Y(1)
  return
end subroutine