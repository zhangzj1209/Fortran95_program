program gdemo3
  use TextGraphLib
  implicit none
  integer i
  
  call SetScreen(70,24)
  call ClearScreen()
  ! ����
  call DrawCircle( 35, 12, 20, 10 )
  ! �������۾�
  call SetCurrentChar('0')
  call DrawCircle( 42, 10, 4, 2 )
  call DrawCircle( 28, 10, 4, 2 )
  ! ������
  call SetCurrentChar('#')
  call DrawLine( 35, 10, 30, 15 )
  call DrawLine( 30, 15, 38, 15 )
  ! �����
  call SetCurrentChar('-')
  call DrawLine( 30, 18, 38, 18 )
  ! �ѻ�ͼ�Ľ����ʾ����Ļ��
  call UpdateScreen()
  
  stop
end