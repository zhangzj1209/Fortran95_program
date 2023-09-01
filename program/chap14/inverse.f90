module LinearAlgebra
  implicit none
contains
! �������
subroutine inverse(A,IA)
  implicit none
  real    :: A(:,:), IA(:,:)
  real, allocatable :: B(:,:)
  integer :: i,j,N
  N = size(A,1)  
  allocate(B(N,N))
  ! �Ȱ�IA�趨�ɵ�λ����
  forall(i=1:N,j=1:N,i==j) IA(i,j)=1.0
  forall(i=1:N,j=1:N,i/=j) IA(i,j)=0.0
  ! ����ԭ�ȵľ���A, ʹ��B������
  B=A 
  ! ��B���ɶԽ��߾���(���˶Խ�����,��Ϊ0)
  call Upper(B,IA,N) ! �Ȱ�B���������Ǿ���
  call Lower(B,IA,N) ! �ٰ�B���������Ǿ���
  ! ���
  forall(i=1:N) IA(i,:)=IA(i,:)/B(i,i) 
  return
end subroutine
! ���������ӳ���
subroutine output(matrix)
  implicit none
  real    :: matrix(:,:)
  integer :: m,n,i
  character(len=20) :: for='(??(1x,f6.3))'
  m = size(matrix,1)
  n = size(matrix,2)
  ! ���ַ������趨�����ʽ
  write( FOR(2:3), '(I2)' ) N
  do i=1,N
	write( *, FMT=FOR ) matrix(i,:)
  end do
  return
end subroutine output
! �������Ǿ�����ӳ���
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
! �������Ǿ�����ӳ���
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
! �������ʽ
program main
  use LinearAlgebra
  implicit none
  integer, parameter :: N=3 ! Size of Matrix
  real :: A(N,N) = (/ 1,2,3,4,5,6,7,8,8 /)
  real :: IA(N,N)
  integer :: i
  write(*,*) "ԭ����"
  call output(A)
  call inverse(A,IA)
  write(*,*) "�����"
  call output(IA)
  stop
end program
