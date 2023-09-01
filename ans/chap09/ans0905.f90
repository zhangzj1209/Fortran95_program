module typedef
  type student
    integer :: num
	integer :: Chinese, English, Math, Natural, Social
	integer :: total
	integer :: rank
  end type
end module

program main
  use typedef
  implicit none
  integer, parameter :: fileid=10
  integer, parameter :: students=20
  character(len=80)  :: tempstr
  type(student) :: s(students) ! 储存学生成绩
  type(student) :: total       ! 计算平均分数用
  integer i, num, error

  open(fileid, file="grades.txt",status="old", iostat=error)
  if ( error/=0 ) then
    write(*,*) "Open grades.txt fail."
	stop
  end if

  read(fileid, "(A80)") tempstr ! 读入第一行文字
  total=student(0,0,0,0,0,0,0,0)
  ! 用循环读入每位学生的成绩
  do i=1,students
    read(fileid,*) s(i)%num, s(i)%Chinese, s(i)%English, &
	               s(i)%Math, s(i)%Natural, s(i)%Social      
	! 计算总分
	s(i)%Total = s(i)%Chinese + s(i)%English + &
	             s(i)%Math + s(i)%Natural + s(i)%Social             
	! 累加上各科的分数, 计算各科平均时使用
	total%Chinese = total%Chinese + s(i)%Chinese
	total%English = total%English + s(i)%English
	total%Math    = total%Math + s(i)%Math
	total%Natural = total%Natural + s(i)%Natural
	total%Social  = total%Social + s(i)%Social
	total%Total   = total%Total + s(i)%Total
  end do
  call sort(s,students)
  ! 重新输出每位学生成绩
  write(*,"(8A7)") "座号","中文","英文","数学","自然","社会","总分","名次"
  do i=1,students
    write(*,"(8I7)") s(i)
  end do
  ! 计算并输出平圴分数
  write(*,"(A7,6F7.1)") "平均", &
	real(total%Chinese)/real(students),&
	real(total%English)/real(students),&
	real(total%Math)   /real(students),&
	real(total%Natural)/real(students),&
	real(total%Social) /real(students),&
	real(total%Total)  /real(students)

  stop
end program

subroutine sort(s,n)
  use typedef
  implicit none
  integer n
  type(student) :: s(n), t
  integer i,j

  do i=1,n-1
    do j=i+1,n
	  if ( s(i)%total < s(j)%total ) then
	    t = s(i)
	    s(i)=s(j)
		s(j) = t
	  end if
	end do
  end do

  forall(i=1:n)
    s(i)%rank = i
  end forall
    
end subroutine
