module LinearAlgebra
  implicit none
contains
! Gauss_Jordan法
subroutine Gauss_Jordan(A,S,ANS)
  implicit none
  real    :: A(:,:)
  real    :: S(:)
  real    :: ANS(:)
  real, allocatable :: B(:,:)
  integer :: i, N
  N = size(A,1)  
  allocate(B(N,N))
  ! 保存原先的矩阵A,及数组S
  B=A 
  ANS=S  
  ! 把B化成对角线矩阵(除了对角线外,都为0)
  call Upper(B,ANS,N) ! 先把B化成上三角矩阵
  call Lower(B,ANS,N) ! 再把B化成下三角矩阵
  ! 求解
  forall(i=1:N)
    ANS(i)=ANS(i)/B(i,i) 
  end forall
  return
end subroutine Gauss_Jordan
! 输出等式
subroutine output(M,S)
  implicit none
  real    :: M(:,:), S(:)
  integer :: N,i,j
  N = size(M,1)
  ! write中加上advance="no",可以中止断行发生,使下一次的
  ! write接续在同一行当中.
  do i=1,N
    write(*,"(1x,f5.2,a1)", advance="NO") M(i,1),'A'
    do j=2,N
      if ( M(i,j) < 0 ) then
        write(*,"('-',f5.2,a1)",advance="NO") -M(i,j),char(64+j)
      else
        write(*,"('+',f5.2,a1)",advance="NO") M(i,j),char(64+j)
      end if
    end do
    write(*,"('=',f8.4)") S(i)
  end do
  return
end subroutine output
! 求上三角矩阵的子程序
subroutine Upper(M,S,N)
  implicit none
  integer :: N
  real    :: M(N,N)
  real    :: S(N)
  integer :: I,J
  real :: E
  do I=1,N-1
    do J=I+1,N              
      E=M(J,I)/M(I,I)
      M(J,I:N)=M(J,I:N)-M(I,I:N)*E
      S(J)=S(J)-S(I)*E
    end do
  end do
  return
end subroutine Upper
! 求下三角矩阵的子程序
subroutine Lower(M,S,N)
  implicit none
  integer :: N
  real    :: M(N,N)
  real    :: S(N)
  integer :: I,J
  real :: E
  do I=N,2,-1
    do J=I-1,1,-1           
      E=M(J,I)/M(I,I)
      M(J,1:N)=M(J,1:N)-M(I,1:N)*E
      S(J)=S(J)-S(I)*E
    end do
  end do
  return
end subroutine Lower
end module
! 求解联立式
program main
  use LinearAlgebra
  implicit none
  integer, parameter :: N=3 ! Size of Matrix
  real :: A(N,N)=reshape( (/1,2,3,4,5,6,7,8,8/),(/N,N/) )
  real :: S(N)=(/12,15,17/)
  real :: ans(N)
  integer :: i
  write(*,*) 'Equation:'
  call output(A,S)
  call Gauss_Jordan(A,S,ANS)
  write(*,*) 'Ans:'
  do i=1,N
    write(*,"(1x,a1,'=',F8.4)") char(64+i),ANS(i) 
  end do
  stop
end program
