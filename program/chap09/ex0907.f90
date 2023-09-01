module typedef
  type student
    integer Chinese,English,Math
  end type
end module

program ex0907
  use typedef
  implicit none
  type(student) :: s
  character(len=80) :: filename = "data.txt"
  integer, parameter :: fileid = 10
  logical alive
  integer :: error
  integer :: no

  inquire(file=filename, exist=alive)
  if ( .not. alive ) then
    write(*,*) trim(filename)," doesn't exist."
	stop
  end if

  open(fileid, file=filename)
  do while(.true.)
	read(fileid,"(5X,I2,/,5XI3,6XI3,6XI3)",iostat=error) no,s
	if ( error/=0 ) exit
	write(*,"(I2'号 中文:'I3' 英文:'I3' 数学:'I3)") no,s
  end do
  close(fileid)

  stop
end
