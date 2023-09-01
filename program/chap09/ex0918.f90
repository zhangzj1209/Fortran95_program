program ex0918
  implicit none
  integer :: a = 1, b = 2, c = 3
  namelist /na/ a,b,c
  write(*,nml=na)
  stop
end program