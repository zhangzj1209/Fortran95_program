program ex0920
  implicit none
  integer :: a(3)
  namelist /na/ a

  open(10, file="ex0920.txt")
  read (10,nml=na) 
  write(*,"(3I2)") a

  stop
end program