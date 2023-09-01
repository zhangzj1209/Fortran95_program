! IMSL IVMRK范例
! 求解Y1'(t)=-5*Y1(t) + 2*Y2(t)
!     Y2'(t)=13*Y1(t) - 0.5*Y2(t)
! initial condition Y1(0)=1, Y2(0)=1
program main
  use IMSL
  implicit none
  integer, parameter :: MXPARM = 50
  integer, parameter :: N = 2
  integer IDO, ISTEP, NOUT
  real T, TEND, Y(N), YPRIME(N)
  real, parameter :: TOL = 1E-3
  external FCN

  WRITE (*,"(' Time',4(9X,A3))") "Y1","Y2","Y1'","Y2'"
  Y = 1.0 ! Initial condition
  T = 0.0 ! Y(T)=1.0中的时间T值
  IDO = 1
  do ISTEP=1,10
    TEND = ISTEP/10.0
	call IVMRK (IDO, N, FCN, T, TEND, Y, YPRIME)
    write (*,'(F5.1,4F12.4)') T, Y, YPRIME
  end do
  call IVMRK (3, N, FCN, T, TEND, Y, YPRIME) ! 释放内存

  stop
end program
! 计算微分方程式
! Y1'(t)=-5*Y1(t) + 2*Y2(t)
! Y2'(t)=13*Y1(t) - 0.5*Y2(t) 
subroutine FCN (N, T, Y, YPRIME)
  implicit none
  integer N
  real T, Y(N), YPRIME(N)
  real, parameter :: K=-1E-2
  ! Y1'(t)=-5*Y1(t) + 2*Y2(t)
  YPRIME(1) = -5*Y(1) + 2*Y(2)
  ! Y2'(t)=13*Y1(t) - 0.5*Y2(t) 
  YPRIME(2) = 13*Y(1) + 0.5*Y(2)
  return
end subroutine