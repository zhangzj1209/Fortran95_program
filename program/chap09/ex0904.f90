program ex0904
  implicit none
  integer, parameter :: fileid = 10
  logical alive
  character(len=20)  :: filename;

  write(*,*) "filename:"
  read(*,"(A20)") filename
  
  inquire(file=filename, exist=alive)
  if( alive ) then
    open( unit=fileid, file=filename )
    close(fileid, status="DELETE")
  else
    write(*,*) TRIM(filename)," doesn't exist."
  end if

  stop
end 
