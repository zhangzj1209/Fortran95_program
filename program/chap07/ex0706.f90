program ex0706
implicit none
  integer, parameter :: students = 5
  integer :: student(students) = (/ 80, 90, 85, 75, 95 /)
  integer i

  do while( .true. )
    write(*,*) "Query:"
    read(*,*) i
    if ( i<=0 .or. i>students ) exit
    write(*,*) student(i)
  end do

  stop
end
