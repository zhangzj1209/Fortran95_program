program main
  implicit none
  character(len=79)  :: filename
  character(len=79)  :: buffer
  integer, parameter :: fileid = 10
  integer count
  integer :: status = 0
  logical alive

  write(*,*) "Filename:"
  read (*,"(A79)") filename
  inquire( file=filename, exist=alive)

  if ( alive ) then
    open(unit=fileid, file=filename, &
	     access="sequential", status="old")
	count = 0
    do while(.true.)
      read(unit=fileid, fmt="(A79)", iostat=status ) buffer
      if ( status/=0 ) exit  ! 没有资料就跳出循环
      write(*,"(A79)") buffer
	  count = count+1
	  if ( count==24 ) then
	    pause
		count = 0
	  end if
    end do
  else
    write(*,*) TRIM(filename)," doesn't exist."
  end if

  stop
end
