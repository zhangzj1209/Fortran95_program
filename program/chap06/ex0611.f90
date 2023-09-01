program  ex0611
implicit none
  integer counter
  integer :: fn_1 = 1
  integer :: fn_2 = 0
  integer :: fn = 0

  write(*,*) fn_2
  write(*,*) fn_1

  do counter = 3, 10
    fn = fn_2 + fn_1
	write(*,*) fn
	fn_2 = fn_1  
	fn_1 = fn
  end do

  stop
end
