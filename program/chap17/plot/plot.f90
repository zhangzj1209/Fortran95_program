! �򵥵Ļ�ͼ����
! By Perng 1997/9/19
program Plot_Demo
! ʹ��Visual Fortran�Ļ�ͼ����ʱ��Ҫmodule dflib
use DFLIB	
implicit none
  type(xycoord) :: t
  integer :: result
  call MoveTo(10,10,t)  ! ��Ŀǰ��ͼ��λ���ƶ�������(10,10)
  result=LineTo(100,50) ! ��(10,10)��(100,50)���һ��ֱ��
  ! ��һ�����Ͻ�Ϊ(110,10), ���½�Ϊ(150,50)��ʵ�ķ���
  result=Rectangle( $GFILLINTERIOR, 110,10, 150, 50 )
  ! ��һ�����Է�����(10,60)--(150,100)���ε��еĿ�����Բ
  result=Ellipse($GBORDER, 10, 60, 150, 100)
end program Plot_Demo
