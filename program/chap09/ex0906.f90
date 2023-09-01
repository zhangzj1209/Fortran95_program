module typedef
  type student
    integer Chinese,English,Math
  end type
end module

program ex0906
  use typedef
  implicit none
  integer :: students
  type(student), allocatable :: s(:)
  character(len=80) :: filename = "data.txt"
  integer, parameter :: fileid = 10
  integer :: i

  write(*,*) "班上有多少学生?"
  read (*,*) students
  allocate( s(students), stat=i )
  if ( i/=0 ) then
    write(*,*) "Allocate buffer fail."
	stop
  end if
  
  open(fileid, file=filename)
  do i=1,students
    write(*,"('请输入'I2'号同学的中文、英文及数学成绩')") i
    read(*,*) s(i)%Chinese, s(i)%English, s(i)%Math
	write(fileid,"('座号:'I2/'中文:'I3' 英文:'I3' 数学:'I3)") i,s(i)
  end do
  close(fileid)

  stop
end
