program  ex0828
  implicit none
  integer :: n
  integer, external :: fact
  write(*,*) 'N='
  read(*,*) n
  write(*, "(I2,'! = ',I8)" ) n, fact(n)
  stop
end

recursive integer function fact(n) result(ans)
  implicit none
  integer , intent(in) :: n
  
  if ( n < 0 ) then ! 不合理的输入
	ans = -1        ! 随便设定一个值
	return          ! n不合理, 直接return 
  else if ( n <= 1 ) then
    ans = 1          
    return          ! 不用再向下递归了, return 
  end if
  ! 会执行到这, 代表n>1, 从n*(n-1)!来计算n!
  ans = n * fact(n-1) 
  return
end
