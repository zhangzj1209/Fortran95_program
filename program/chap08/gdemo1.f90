program gdemo1
  use TextGraphLib
  implicit none
  
  call SetScreen( 10, 10 )      ! �趨�ֱ���Ϊ10x10
  call DrawLine( 1, 1, 10, 10 ) ! ��(1,1)��(10,10)������仭һ����
  call UpdateScreen()           ! ��ʾ��ͼ�Ľ��

  stop
end