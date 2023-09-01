! ������������
!       By Perng 1997/9/2
program main
  implicit none
  integer, parameter :: Width=3
  integer, parameter :: Row=5     ! Size of Matrix
  real :: A(Row,Width)=(/0,2,3,4,1,&
                         1,3,4,5,2,&
                         2,4,5,1,0/)
  real :: S(Row)=(/3,9,12,10,3/)
  real :: ans(Row)
  integer :: i
! equation:
! a+2b=3 
! 2b+3c+4d=9
! 3c+4d+5e=12
! 4d+5e+f=10
! e+2f=3        
  call Gauss_Jordan(A,S,ANS,Row,Width)
  write(*,*) 'Ans:'
  do i=1,Row
    write(*,"(1x,a1,'=',F8.4)") char(96+i),ANS(i) 
  end do
  stop
end program main
! Gauss-Jordan���ĺ���
subroutine Gauss_Jordan(A,S,ANS,Row,Width)
  implicit none
  integer :: Row
  integer :: Width
  real    :: A(Row,Width)
  real    :: S(Row)
  real    :: ANS(Row)
  real    :: B(Row,Width)
  real    :: i
  
  ! ����ԭ�ȵľ���A,������S
  B=A 
  ANS=S  
  ! ��B���ɶԽǾ���(���˶Խ�����,��Ϊ0)
  call Upper(B,ANS,Row,Width) ! �Ȱ�B���������Ǿ���
  call Lower(B,ANS,Row,Width) ! �ٰ�B���������Ǿ���

  ! �����
  do i=1,Row
    ANS(i)=ANS(i)/B(i,2) 
  end do

  return
end subroutine Gauss_Jordan
! �������Ǿ�����ӳ���
subroutine Upper(M,S,Row,Width)
  implicit none
  integer :: Row
  integer :: Width
  real    :: M(Row,Width)
  real    :: S(Row)
  integer :: I,J
  real :: E
  do I=1,Row-1                    
     J=I+1                        
     E=M(J,1)/M(I,2)
     M(J,1:2)=M(J,1:2)-M(I,2:3)*E
     S(J)=S(J)-S(I)*E
  end do
  return
end subroutine Upper
! �������Ǿ�����ӳ���
subroutine Lower(M,S,Row,Width)
  implicit none
  integer :: Row
  integer :: Width
  real    :: M(Row,Width)
  real    :: S(Row)
  integer :: I,J
  real :: E
  do I=Row,2,-1
     J=I-1                                      
     E=M(J,3)/M(I,2)                     
     M(J,3)=M(J,3)-M(I,2)*E  ! ֻʣһ��Ԫ�������    
     S(J)=S(J)-S(I)*E
  end do
  return
end subroutine Lower
