program main
  use sgl
  implicit none
  external display ! ����display�Ǹ�����
  ! �趨��������Ҫ�ػ�ʱ,������ӳ���display
  call sglDisplaySub(display)  
  ! �򿪴���, �������Ͻ�Ϊ(100,100), ����ͬΪ500
  call sglCreateWindow(100,100,500,500,0)
  write(*,*) "Waiting message."
  ! �ȴ�ʹ���߸��������Ϣ
  call sglMainLoop()
  write(*,*) "The End."
  stop
end
! ÿ��������Ҫ���»���ʱ, �����display
subroutine display()
  use sgl
  implicit none
  call sglClearBuffer()          ! ������Ļ
  call sglColor3f(1.0,0.0,0.0)   ! �趨ĿǰҪʹ�ú�ɫ����ͼ
  call sglDrawLine(0,0, 500,500) ! ��(0,0)��(500,500)����֮�仭��
  return
end subroutine