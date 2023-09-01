module LinearAlgebra
  implicit none
contains
! 求逆矩阵
subroutine inverse(A,IA)
  implicit none
  real    :: A(:,:), IA(:,:)
  real, allocatable :: B(:,:)
  integer :: i,j,N
  N = size(A,1)  
  allocate(B(N,N))
  ! 先把IA设定成单位矩阵
  forall(i=1:N,j=1:N,i==j) IA(i,j)=1.0
  forall(i=1:N,j=1:N,i/=j) IA(i,j)=0.0
  ! 保存原先的矩阵A, 使用B来计算
  B=A 
  ! 把B化成对角线矩阵(除了对角线外,都为0)
  call Upper(B,IA,N) ! 先把B化成上三角矩阵
  call Lower(B,IA,N) ! 再把B化成下三角矩阵
  ! 求解
  forall(i=1:N) IA(i,:)=IA(i,:)/B(i,i) 
  return
end subroutine
! 输出矩阵的子程序
subroutine output(matrix)
  implicit none
  real    :: matrix(:,:)
  integer :: m,n,i
  character(len=20) :: for='(??(1x,f6.3))'
  m = size(matrix,1)
  n = size(matrix,2)
  ! 用字符串来设定输出格式
  write( FOR(2:3), '(I2)' ) N
  do i=1,N
	write( *, FMT=FOR ) matrix(i,:)
  end do
  return
end subroutine output
! 求上三角矩阵的子程序
subroutine Upper(M,S,N)
  implicit none
  integer :: N
  real    :: M(N,N)
  real    :: S(N,N)
  integer :: I,J
  real :: E
  do I=1,N-1
    do J=I+1,N              
      E=M(J,I)/M(I,I)
      M(J,I:N)=M(J,I:N)-M(I,I:N)*E
      S(J,:)=S(J,:)-S(I,:)*E
    end do
  end do
  return
end subroutine Upper
! 求下三角矩阵的子程序
subroutine Lower(M,S,N)
  implicit none
  integer :: N
  real    :: M(N,N)
  real    :: S(N,N)
  integer :: I,J
  real :: E
  do I=N,2,-1
    do J=I-1,1,-1           
      E=M(J,I)/M(I,I)
      M(J,1:N)=M(J,1:N)-M(I,1:N)*E
      S(J,:)=S(J,:)-S(I,:)*E
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
  real :: A(N,N) = (/ 1,2,3,4,5,6,7,8,8 /)
  real :: IA(N,N)
  integer :: i
  write(*,*) "原矩阵"
  call output(A)
  call inverse(A,IA)
  write(*,*) "逆矩阵"
  call output(IA)
  stop
end program
