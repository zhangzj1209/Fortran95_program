program ex0513
implicit none
  real a,b,ans
  character operator
  
  read(*,*) a
  read(*,"(A1)") operator ! ��ʹ�ø�ʽ��Щ���������������"/" 
  read(*,*) b

  select case(operator)
  case('+')
    ans = a+b
  case('-')
    ans = a-b
  case('*')
    ans = a*b
  case('/')
    ans = a/b
  case default ! �����������Ų�����
    write(*,"('Unknown operator ',A1)") operator
	stop ! ��������
  end select

  write(*,"(F6.2,A1,F6.2,'=',F6.2)") a,operator,b,ans

  stop
end