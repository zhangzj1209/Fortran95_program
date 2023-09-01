module LinearAlgebra
  implicit none
contains
! ������Determinantֵ
real function Determinant(matrix)
  real    :: matrix(:,:)
  real, allocatable :: ma(:,:)
  integer :: i,N
  N = size(matrix,1)
  allocate(ma(N,N))
  ma = matrix
  call Upper(ma)  
  Determinant = 1.0
  do i=1,N
    Determinant = Determinant*ma(i,i)
  end do
end function
! �������Ǿ�����ӳ���
subroutine Upper(matrix)
  real    :: matrix(:,:)
  integer :: M,N
  integer :: I,J
  real :: E
  M=size(matrix,1)
  N=size(matrix,2)
  do I=1,N-1
	do J=I+1,M		
	  E=matrix(J,I)/matrix(I,I)
      ! ��90�Ĺ��ܿ�����һ��ѭ��
	  matrix(J,I:M)=matrix(J,I:M)-matrix(I,I:M)*E
	end do
  end do
  return
end subroutine Upper
end module

program main
  use LinearAlgebra
  implicit none
  integer, parameter :: N = 3	! Size of Matrix
  real :: A(N,N) = reshape( (/1,2,1,3,2,3,2,3,4/),(/N,N/) )
  write(*,"('det(A)=',F6.2)") Determinant(A)
  stop
end program
