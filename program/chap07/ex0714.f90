program ex0714
implicit none
  integer I,J
  integer, parameter :: size = 5
  integer :: a(size,size)

  forall ( I=1:size, J=1:size, I>J )  a(I,J)=1 ! �ϰ벿��
  forall ( I=1:size, J=1:size, I==J ) a(I,J)=2 ! �Խ��߲���
  forall ( I=1:size, J=1:size, I<J )  a(I,J)=3 ! �°벿��

  write(*,"(5(5I5,/))") a

  stop
end

