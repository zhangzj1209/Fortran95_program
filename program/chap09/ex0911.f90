program ex0911
  implicit none
  integer, parameter :: fileid = 10
  character(len=20)  :: filename = "ex0911dat.txt"
  integer player
  real    hit
  integer error
  
  open(unit=fileid, file=filename, access="direct",&
       form="formatted", recl=6, status="replace")
  do while(.true.)
    write(*,"('第几棒?')")
	read (*,*) player
	if ( player<1 .or. player>9 ) exit
	write(*,"('打击率?')")
	read (*,*) hit
	write(fileid, fmt="(F5.2)", rec=player, IOSTAT=error) hit
	if ( error/=0 ) exit
  end do
  close(fileid)

  stop
end program