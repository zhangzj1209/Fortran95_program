module LinearAlgebra
  implicit none
contains
! 输出矩阵的子程序
subroutine output(matrix)
  implicit none
  integer :: m,n
  real    :: matrix(:,:)
  integer :: i
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
subroutine Upper(matrix)
  implicit none
  real    :: matrix(:,:)
  integer :: M,N
  integer :: I,J
  real :: E
  M=size(matrix,1)
  N=size(matrix,2)
  do I=1,N-1
	do J=I+1,M		
	  E=matrix(J,I)/matrix(I,I)
      ! 用90的功能可以少一层循环
	  matrix(J,I:M)=matrix(J,I:M)-matrix(I,I:M)*E
	end do
  end do
  return
end subroutine Upper
! 求下三角矩阵的子程序
subroutine Lower(matrix)
  implicit none
  real    :: matrix(:,:)
  integer :: M,N
  real :: I,J,E
  M = size(matrix,1)
  N = size(matrix,2)
  do I=N,2,-1
    do J=I-1,1,-1           
      E=matrix(J,I)/matrix(I,I)
	  ! 用90的功能可以少一层循环
      matrix(J,1:I)=matrix(J,1:I)-matrix(I,1:I)*E 
    end do
  end do
  return
end subroutine Lower
end module

program main
  use LinearAlgebra
  implicit none
  integer, parameter :: N = 3	! Size of Matrix
  real :: A(N,N) = reshape( (/1,2,1,3,2,3,2,3,4/),(/N,N/) )
  real :: B(N,N)

  write(*,*) "Matrix A:"
  call output(A)
  B=A
  write(*,*) "Upper:"
  call Upper(B)
  call output(B)
  B=A
  write(*,*) "Lower:"
  call Lower(B)
  call output(B)
  stop
end program
