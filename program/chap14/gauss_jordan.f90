module LinearAlgebra
  implicit none
contains
! Gauss_Jordan��
subroutine Gauss_Jordan(A,S,ANS)
  implicit none
  real    :: A(:,:)
  real    :: S(:)
  real    :: ANS(:)
  real, allocatable :: B(:,:)
  integer :: i, N
  N = size(A,1)  
  allocate(B(N,N))
  ! ����ԭ�ȵľ���A,������S
  B=A 
  ANS=S  
  ! ��B���ɶԽ��߾���(���˶Խ�����,��Ϊ0)
  call Upper(B,ANS,N) ! �Ȱ�B���������Ǿ���
  call Lower(B,ANS,N) ! �ٰ�B���������Ǿ���
  ! ���
  forall(i=1:N)
    ANS(i)=ANS(i)/B(i,i) 
  end forall
  return
end subroutine Gauss_Jordan
! �����ʽ
subroutine output(M,S)
  implicit none
  real    :: M(:,:), S(:)
  integer :: N,i,j
  N = size(M,1)
  ! write�м���advance="no",������ֹ���з���,ʹ��һ�ε�
  ! write������ͬһ�е���.
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
! �������Ǿ�����ӳ���
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
! �������Ǿ�����ӳ���
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
! �������ʽ
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
