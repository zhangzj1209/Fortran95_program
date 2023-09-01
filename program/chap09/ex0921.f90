module typedef
  type student
	integer :: Chinese, English, Math, Natural, Social
	integer :: total
  end type
end module

program ex0921
  use typedef
  implicit none
  integer, parameter :: fileid=10
  integer, parameter :: students=20
  character(len=80)  :: tempstr
  type(student) :: s(students) ! ����ѧ���ɼ�
  type(student) :: total       ! ����ƽ��������
  integer i, num, error

  open(fileid, file="grades.txt",status="old", iostat=error)
  if ( error/=0 ) then
    write(*,*) "Open grades.txt fail."
	stop
  end if

  read(fileid, "(A80)") tempstr ! �����һ������
  total=student(0,0,0,0,0,0)
  ! ��ѭ������ÿλѧ���ĳɼ�
  do i=1,students
    read(fileid,*) num, s(i)%Chinese, s(i)%English, &
	               s(i)%Math, s(i)%Natural, s(i)%Social      
	! �����ܷ�
	s(i)%Total = s(i)%Chinese + s(i)%English + &
	             s(i)%Math + s(i)%Natural + s(i)%Social             
	! �ۼ��ϸ��Ƶķ���, �������ƽ��ʱʹ��
	total%Chinese = total%Chinese + s(i)%Chinese
	total%English = total%English + s(i)%English
	total%Math    = total%Math + s(i)%Math
	total%Natural = total%Natural + s(i)%Natural
	total%Social  = total%Social + s(i)%Social
	total%Total   = total%Total + s(i)%Total
  end do
  ! �������ÿλѧ���ɼ�
  write(*,"(7A7)") "����","����","Ӣ��","��ѧ","��Ȼ","���","�ܷ�"
  do i=1,students
    write(*,"(7I7)") i, s(i)
  end do
  ! ���㲢���ƽ�V����
  write(*,"(A7,6F7.1)") "ƽ��", &
	real(total%Chinese)/real(students),&
	real(total%English)/real(students),&
	real(total%Math)   /real(students),&
	real(total%Natural)/real(students),&
	real(total%Social) /real(students),&
	real(total%Total)  /real(students)

  stop
end program