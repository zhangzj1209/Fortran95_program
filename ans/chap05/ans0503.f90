program main
  implicit none
  integer age, money
  real tax

  write(*,*) "请输入年龄"
  read(*,*) age
  write(*,*) "请输入月收入"
  read(*,*) money

  if ( age<50 ) then
    if ( money<1000 ) then
	  tax = 0.03
	else if ( money<5000 )then
	  tax = 0.10
	else
	  tax = 0.15
	end if
  else
    if ( money<1000 ) then
	  tax = 0.5
	else if ( money<5000 )then
	  tax = 0.7
	else
	  tax = 0.10
	end if
  end if
  
  write(*,"(' 税金为 'I8)") nint(money*tax)

end program