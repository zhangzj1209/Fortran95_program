program ex0432
implicit none
  integer :: a=1
  integer :: b=2
  real    :: c
  c=real(a)/real(b) ! ���ɿ⺯��real������ת���ɸ����� 
  write(*,"(F5.2)") c 
end
