program ex0808
  implicit none
  real :: a = 1
  real :: b
  real add
  add(a,b) = a+b  ! ֱ�ӰѺ���д������
  write(*,*) add(a,3.0)
  stop
end
