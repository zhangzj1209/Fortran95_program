program ex0807
implicit none
  real :: a=1
  real :: b=2
  real, external :: add

  write(*,*) add(a,b)
  stop
end

function add(a,b)
implicit none
  real :: a,b ! ����Ĳ���
  real :: add 
  ! add����������һ������߲�����������������
  ! ��������������᷵�ص���ֵ����
  add = a+b
  return
end