program  ex0829
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
  integer, save :: count = 1
  integer :: localcount, temp  ! �ֲ�����
    
  localcount = count
  count = count+1
  write(6,"(I2,'th enter, n=',I2)") localcount, n

  if ( n < 0 ) then ! �����������
	ans = -1        ! ����趨һ��ֵ
    write(6,"(I2,'th exit, n=',I2,' ans=',I8)") localcount, n, ans
	return          ! n������, ֱ��return 
  else if ( n <= 1 ) then
    ans = 1          
    write(6,"(I2,'th exit, n=',I2,' ans=',I8)") localcount, n, ans
    return          ! ���������µݹ���, return 
  end if
  ! ��ִ�е���, ����n>1, ��n*(n-1)!������n!
  temp = n-1
  ans = n * fact(temp) 
  write(6,"(I2,'th exit, n=',I2,' ans=',I8)") localcount, n, ans
  return
end
