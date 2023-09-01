program ex0702
implicit none
  integer :: student1, student2, student3, student4, student5
  integer :: i

  write(*,*) "Number 1"
  read(*,*) student1
  write(*,*) "Number 2"
  read(*,*) student2
  write(*,*) "Number 3"
  read(*,*) student3
  write(*,*) "Number 4"
  read(*,*) student4
  write(*,*) "Number 5"
  read(*,*) student5

  do while(.true.)
    write(*,*) "Query:"
	read(*,*) i
	select case(i)
	case(1)
	  write(*,*) student1
	case(2)
	  write(*,*) student2
	case(3)
	  write(*,*) student3
	case(4)
	  write(*,*) student4
	case(5)
	  write(*,*) student5
	case default
	  exit
	end select
  end do

  stop
end