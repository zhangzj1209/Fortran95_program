program ex0905
  implicit none
  character(len=79)  :: filename
  character(len=79)  :: buffer
  integer, parameter :: fileid = 10
  integer :: status = 0
  logical alive

  write(*,*) "Filename:"
  read (*,"(A79)") filename
  inquire( file=filename, exist=alive)

  if ( alive ) then
    open(unit=fileid, file=filename, &
	     access="sequential", status="old")
    do while(.true.)
      read(unit=fileid, fmt="(A79)", iostat=status ) buffer
      if ( status/=0 ) exit  ! 没有数据就跳出循环
      write(*,"(A79)") buffer
    end do
  else
    write(*,*) TRIM(filename)," doesn't exist."
  end if

  stop
end
