program ex0823
  implicit none
  integer :: a=4
  integer b
  call div(a,b)
  write(*,*) a,b
  stop
end program

subroutine div(a,b)
  implicit none
  integer, intent(in) :: a  ! ָ��a��ֻ��
  integer, intent(out) :: b ! ָ��b���ӳ�ʽ��Ӧ��Ҫ������ֵ
  integer c
  c=b
  b=a/2
end subroutine

