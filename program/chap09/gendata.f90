program gendata
  implicit none
  integer students
  integer i
  real    r(5)

  write(*,"(6A5)")  "座号","中文","英文","数学","自然","社会"
  call random_seed()
  write(*,*) "How many students?"
  read(*,*) students
  do i=1,students
    call random_number(r)  
	write(*,"(6I5)") i,int(r*50+50)
  end do

  stop
end program