module sgl_util
  use sgl
  implicit none
contains
  subroutine Display()
    write(*,*) "Update"
    call sglClearBuffer() ! �������
	call sglColor3f(1.0,0,0) ! ʹ�ú�ɫ
	call sglRect(100,100,300,300) ! ��(100,100)��(300,300)Ϊ�˻�����
    call sglColor3i(0,255,0) ! ʹ����ɫ
    call sglCircle(200,200,200) ! ��(200,200)ΪԲ��, ���뾶Ϊ200��Բ
	call sglColor3i(0,0,255) ! ʹ����ɫ
	call sglLine(200,0, 200,400) ! ��(200,0)��(200,400)����仭��
	call sglLine(0,200, 400,200) ! ��(0,200)��(400,200)����仭��
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(Display) ! �趨���ڸ���ʱ����Display
  ! �򿪻�ͼ����, ���Ͻ�Ϊ(100,100), ���ͬΪ400
  call sglCreateWindow(100,100,400,400,0)
  ! ����ȴ���Ϣ��ѭ��
  call sglMainLoop()
  stop
end program