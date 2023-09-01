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

  write(*,*) "�����ж���ѧ��?"
  read (*,*) students
  allocate( s(students), stat=i )
  if ( i/=0 ) then
    write(*,*) "Allocate buffer fail."
	stop
  end if
  
  open(fileid, file=filename)
  do i=1,students
    write(*,"('������'I2'��ͬѧ�����ġ�Ӣ�ļ���ѧ�ɼ�')") i
    read(*,*) s(i)%Chinese, s(i)%English, s(i)%Math
	write(fileid,"('����:'I2/'����:'I3' Ӣ��:'I3' ��ѧ:'I3)") i,s(i)
  end do
  close(fileid)

  stop
end
