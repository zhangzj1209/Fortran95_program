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
  
  if ( n < 0 ) then ! �����������
	ans = -1        ! ����趨һ��ֵ
	return          ! n������, ֱ��return 
  else if ( n <= 1 ) then
    ans = 1          
    return          ! ���������µݹ���, return 
  end if
  ! ��ִ�е���, ����n>1, ��n*(n-1)!������n!
  ans = n * fact(n-1) 
  return
end
