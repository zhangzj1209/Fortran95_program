program ex0912
  implicit none
  integer, parameter :: fileid = 10
  character(len=20)  :: filename = "list.bin"
  integer player
  real  :: hit(9) = (/ 3.2, 2.8, 3.3, 3.2, 2.9, 2.7, 2.2, 2.3, 1.9 /)
  
  open(unit=fileid, file=filename, access="direct",&
       recl=4, status="replace")

  do player=1,9 
	write(fileid, rec=player) hit(player)
  end do

  close(fileid)

  stop
end program