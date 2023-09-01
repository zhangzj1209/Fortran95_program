program ex0915
  implicit none
  integer :: a
  character(len=20) :: string="123"
  
  read( string, * ) a
  write(*,*) a

  stop
end program
