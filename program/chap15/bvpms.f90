! IMSL BVPMS范例
! 求解y'''-y''+y'-y=0
! 经过y'=y, y2=y', y3=y''代换后会变成First order ODE
! y1'=y2
! y2'=y3
! y3'=y3-y2+y1
! 答案为y1=cos(t), y2=-sin(t), y3=-cos(t)
program main
  use IMSL
  implicit none
  integer, parameter :: NEQNS=3, NMAX=21, LDY=NEQNS
  integer, parameter :: MAXIT=19, NINIT=NMAX
  integer I, J, NFINAL
  real, parameter :: PI=3.14159
  real, parameter :: TOL=1E-4, XLEFT=0.0, XRIGHT=2*PI
  real X(NMAX), Y(LDY,NMAX)
  external FCNEQN, FCNJAC, FCNBC
  ! 猜值
  Y = 0.0
  ! shooting points
  do I=1, NINIT
    X(I) = XLEFT + REAL(I-1)/REAL(NINIT-1)*(XRIGHT-XLEFT)
  end do
  ! Solve problem
  call BVPMS (FCNEQN, FCNJAC, FCNBC, NEQNS, XLEFT, XRIGHT, TOL,& 
              TOL, MAXIT, NINIT, X, Y, LDY, NMAX, NFINAL, X, Y, LDY)
  ! Print results
  write(*,"(4X'X',4(5XA5))") "Y1(X)","Y2(X)","Y3(X)"
  do I=1,NFINAL
    write(*,"(F5.3,3F10.5)") X(I),Y(:,I)
  end do
  stop
end program
!
! 计算偏微分方程
!
subroutine FCNEQN(NEQNS, T, Y, P, DYDX)
  implicit none
  integer NEQNS
  real T, P, Y(NEQNS), DYDX(NEQNS)
  ! y1' = y2
  DYDX(1) = Y(2)
  ! y2' = y3
  DYDX(2) = Y(3)
  ! y3' = y3 - y2 + y1
  DYDX(3) = Y(3) - Y(2) + Y(1)
  return
end subroutine
!
! DYPDY(i,j) = dFi/dYj
!
subroutine FCNJAC(NEQNS, T, Y, P, DYPDY)
  implicit none
  integer NEQNS
  real T, P, Y(NEQNS), DYPDY(NEQNS,NEQNS)
  ! y1' = 0*y1 + 1*y2 + 0*y3
  DYPDY(1,1) = 0.0
  DYPDY(1,2) = 1.0
  DYPDY(1,3) = 0.0
  ! y2' = 0*y1 + 0*y2 + 1*y3
  DYPDY(2,1) = 0.0
  DYPDY(2,2) = 0.0
  DYPDY(2,3) = 1.0
  ! y3' = 1*y1 - 1*y2 + 1*y3
  DYPDY(3,1) = 1.0
  DYPDY(3,2) =-1.0
  DYPDY(3,3) = 1.0
  return
end subroutine
! 定义边界条件
! F(1), F(2)....F(n)的值都应该等于0
! 
subroutine FCNBC(NEQNS, YLEFT, YRIGHT, P, F)
  implicit none
  integer NEQNS
  real P, YLEFT(NEQNS), YRIGHT(NEQNS), F(NEQNS)
  ! Define boundary conditions
  F(1) = YLEFT(1) - 1.0  ! y1(0)=y1(2PI)=1 => y1(0)-1 = 0
  F(2) = YLEFT(2) - YRIGHT(2) ! y2(0)=y2(2*PI)=0 => y2(0)-y2(2*PI)=0
  F(3) = YRIGHT(2)       ! y2(2*PI)=0
  return
end subroutine