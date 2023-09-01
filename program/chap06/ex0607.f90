program  ex0607
implicit none
  real, parameter :: weight=45.0
  real, parameter :: error=0.0001
  real :: guess = 0.0

  do while( .true. )
    write(*,*) "weight:"
    read(*,*) guess
    if ( abs(guess-weight)<error ) exit
  end do

  write(*,*) "You are right!"

  stop
end
