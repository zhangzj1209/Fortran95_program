program  ex0610
implicit none
  integer counter
  integer :: ans = 0

  do counter = 1, 100
    ans = ans + counter
  end do

  write(*,*) ans

  stop
end
