program main
  use IMSL
  implicit none
  integer, parameter :: INTCEP = 1
  integer, parameter :: NBASIS = 2
  integer, parameter :: NDATA = 90
  integer, parameter :: IWT = 0
  real, external :: F
  real A(NBASIS+INTCEP), WEIGHT(NDATA), XDATA(NDATA), FDATA(NDATA)
  real SSE
  real G,X
  integer I
  G(X) = 1.0 + 2.0*SIN(X) + 3.0*COS(X) 
  
  do I=1, NDATA
    XDATA(I) = 6.0*(FLOAT(I-1)/FLOAT(NDATA-1))
    FDATA(I) = G(XDATA(I))
  end do
  
  call FNLSQ(F, INTCEP, NBASIS, NDATA, XDATA, FDATA, IWT, WEIGHT, A, SSE)
  ! 应该会计算出f(X)=2*sin(X)+3*cos(X)
  write(*,"('F(X)='F5.2'+'F5.2'SIN(X)+'F5.2'COS(X)')") A

  stop
end program
! F(X) = a*SIN(X) + b*COS(X)
real function F(K, X)
  implicit none
  integer K
  real X
  select case(K)
  case(1) ! 第1种基本函数
    F = SIN(X) 
  case(2) ! 第2种基本函数
    F = COS(X) 
  case default ! 错误的值
    write(*,*) "unknown"
  end select
  return
end function
