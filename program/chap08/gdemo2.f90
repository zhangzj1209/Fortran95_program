program gdemo2
  use TextGraphLib
  implicit none
  
  call SetScreen( 20, 20 )
  call SetCurrentChar('o')       ! ����o����Ϊ����ַ�
  call DrawCircle( 8, 4 , 3, 4)  ! ��Բ
  call SetCurrentChar('#')       ! ����#����Ϊ����ַ�
  call DrawFilledRect( 4, 8, 13, 18 )  ! ������
  call UpdateScreen()            ! ��ʾ��ͼ���

  stop
end