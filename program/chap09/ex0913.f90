program ex0913
  implicit none
  integer, parameter :: fileid = 10
  character(len=20)  :: filename = "list.bin"
  real    hit
  integer player
  logical alive
  integer error

  inquire(file=filename, exist=alive)
  if ( .not. alive ) then
    write(*,*) trim(filename)," doesn't exist."
	stop
  end if

  open(unit=fileid, file=filename, form="unformatted",&
       access="direct", recl=4, status="old")

  do while(.true.)
    write(*,"('第几棒?')")
	read (*,*) player
	read(fileid, rec=player, iostat=error) hit
    if ( error/=0 ) exit
	write(*,"('打击率:',F5.2)") hit
  end do

  close(fileid)

  stop
end program