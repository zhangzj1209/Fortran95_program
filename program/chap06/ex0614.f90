program ex0614
implicit none
  real a,b,ans
  character :: key = 'y' ! 为了至少进入循环1次

  do while( key=='y' .or. key=='Y' )
    read(*,*) a
	read(*,"(A1)") key
	read(*,*) b

	select case(key)
	case('+')
	  ans = a+b
	case('-')
	  ans = a-b
	case('*')
	  ans = a*b	  
	case('/')
	  ans = a/b
	case default
	  write(*,"('Unknown operator ',A1)") key 
	  stop
	end select

    write(*,"(F6.2,A1,F6.2,'=',F6.2)") a,key,b,ans
	write(*,*) "(Y/y) to do again. (Other) to exit."
	read(*,"(A1)") key
  end do
  stop
end
