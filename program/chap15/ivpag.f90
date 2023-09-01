! IMSL IVPAG范例
! 求解Y'(t)=-0.01*Y(t)
! initial value Y(0)=2
program main
  use IMSL
  implicit none
  integer, parameter :: MXPARM = 50
  integer, parameter :: N = 1
  integer IDO, ISTEP, NOUT
  real A(1,1)
  real PARAM(MXPARM), T, TEND, Y(N)
  real, parameter :: TOL = 1E-3
  external FCN, FCNJ

  PARAM = 0  ! 令IVPAG计算过程的设定完全使用内定值
  WRITE (*,"(' Time', 9X,'Y')")
  Y(1) = 2.0 ! Initial value Y(T)=2.0
  T = 0.0    ! Initial value Y(T)=2.0中的时间T值
  IDO = 1
  do ISTEP=10,100,10
    TEND = ISTEP
	call IVPAG(IDO, N, FCN, FCNJ, A, T, TEND, TOL, PARAM, Y)
    write (*,'(F5.1,F12.4)') T, Y
  end do
  call IVPAG(3, N, FCN, FCNJ, A, T, TEND, TOL, PARAM, Y) ! 释放内存

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
! 在这边不计算Jacobian值
! 所以函数FCNJ完全不做事
! 实际使用时, 要在DYPDY中返回计算结果
subroutine FCNJ(N, T, Y, DYPDY)
  implicit none
  integer N
  real T, Y(N), DYPDY(N)
  return
end subroutine