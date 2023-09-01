program ex0701
implicit none
  integer, parameter :: students = 5
  integer :: student(students)
  integer i

  do i=1, students
    write(*,"('Number ',I2)") i
    read(*,*) student(i)
  end do

  do while( .true. )
    write(*,*) "Query:"
    read(*,*) i
    if ( i<=0 .or. i>students ) exit
    write(*,*) student(i)
  end do

  stop
end
