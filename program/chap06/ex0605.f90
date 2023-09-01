program ex0605
implicit none
  real, parameter :: weight=45.0
  real, parameter :: e = 0.001
  real :: guess = 0.0

  do while( abs(guess-weight) > e )
    write(*,*) "Weight:"
    read(*,*) guess
  end do
  
  write(*,*) "You're right"

  stop
end
