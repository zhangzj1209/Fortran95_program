program main
  implicit none
  integer, parameter :: answer = 45
  integer, parameter :: max = 5
  integer weight, i
  
  do i=1,max
    write(*,*) "请输入体重"
	read(*,*) weight
	if ( weight==answer ) exit
  end do

  if ( i<=max ) then
    write(*,*) "猜对了"
  else
    write(*,*) "猜错了"
  end if

  stop
end program
