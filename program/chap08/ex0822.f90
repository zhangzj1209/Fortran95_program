program ex0822
  implicit none
  external sub1, sub2 ! ����sub1��sub2���ӳ�������
  call sub(sub1)      ! ���ӳ���sub1����������ȥ
  call sub(sub2)      ! ���ӳ���sub1����������ȥ
  stop
end program

subroutine sub(sub_name)
  implicit none
  external sub_name ! ����sub_name�Ǹ��ӳ���
  call sub_name()   ! ���ô�����ӳ���sub_name
  return
end subroutine

subroutine sub1()
  implicit none
  write(*,*) "sub1"
end subroutine

subroutine sub2()
  implicit none
  write(*,*) "sub2"
end subroutine
