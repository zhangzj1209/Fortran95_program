program ex0919
  implicit none
  integer :: a, b, c
  namelist /na/ a,b,c
  read (*,nml=na) 
  write(*,nml=na) 
  stop
end program
