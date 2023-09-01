program ex0603
implicit none
  integer i,j

  do i=1, 3
    do j=1, 3
	  write(*, "(I2,I2)") i,j
	end do
	write(*,*) "another circle"
  end do

  stop
end