program ex0909
  implicit none
  integer, parameter :: inputfileid = 10, outputfileid = 11
  integer, parameter :: maxbuffer = 200
  character(len=80)  :: inputfile, outputfile
  character(len=maxbuffer) buffer
  integer count
  integer error
  logical alive
  
  write(*,*) "Input Filename:"
  read(*,"(A80)") inputfile
  write(*,*) "Output Filename:"
  read(*,"(A80)") outputfile

  inquire(file=inputfile, exist=alive)
  if ( .not. alive ) then
    write(*,*) trim(inputfile)," doesn't exist."
	stop
  end if
  
  open(unit=inputfileid, file=inputfile, status="old")
  open(unit=outputfileid, file=outputfile, status="replace")
  count = 1
  do while(.true.)
    ! 读入一整行的数据
    read(inputfileid,"(A200)",iostat=error) buffer
	if ( error/=0 ) exit ! 没有数据了,离开循环
	! 再最前面加上行号再输出到另一个文件中
    write(outputfileid, "(I3,'.',A)") count,trim(buffer)
	count=count+1        ! 计算行数
  end do
  close(inputfileid)
  close(outputfileid)

  stop
end program