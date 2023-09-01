program main
  implicit none
  integer, external :: add
  write(*,*) add(100)
end program

recursive integer function add(n) result(sum)
  implicit none
  integer, intent(in) :: n

  if ( n<0 ) then
    sum=0
	return
  else if ( n<=1 ) then
    sum=n
	return
  end if

  sum = n + add(n-1)

  return
end function
