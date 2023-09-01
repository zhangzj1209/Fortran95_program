module sgl_util
  use sgl
  implicit none
contains
  subroutine Display()
    call sglClearBuffer() ! �������
	call sglColor3f(1.0,0,0) ! ʹ�ú�ɫ
	call sglRectV(0.2, 0.2, 0.8, 0.8) ! ��(0.2,0.2)��(0.8,0.8)Ϊ�˻�����
    call sglColor3i(0,255,0) ! ʹ����ɫ
    call sglCircleV(0.5,0.5,0.5) ! ��(0.5,0.5)ΪԲ��, ���뾶Ϊ0.5��Բ
	call sglColor3i(0,0,255) ! ʹ����ɫ
	call sglLineV(0.5,0, 0.5, 1.0) ! ��(250,0)��(250,500)����仭��
	call sglLineV(0.0,0.5, 1.0,0.5) ! ��(0,250)��(500,250)����仭��
	call sglUpdateBuffer();
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(Display)
  ! �趨�������Ͻǵ���������Ϊ(0,0)���½�Ϊ(1.0,1.0)
  call sglSetVirtual(0.0, 0.0, 1.0, 1.0)
  call sglCreateWindow(100,100,500,500,1)
  call sglMainLoop()
  stop
end program