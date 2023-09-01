program ex0513
implicit none
  real a,b,ans
  character operator
  
  read(*,*) a
  read(*,"(A1)") operator ! 不使用格式有些机器会读不到除号"/" 
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
  case default ! 输入其它符号不处理
    write(*,"('Unknown operator ',A1)") operator
	stop ! 结束程序
  end select

  write(*,"(F6.2,A1,F6.2,'=',F6.2)") a,operator,b,ans

  stop
end