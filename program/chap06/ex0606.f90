program ex0606
implicit none
  integer :: dest = 9
  integer floor

  do floor=1, dest
    if ( floor==4 ) cycle
	write(*,*) floor
  end do

  stop
end
