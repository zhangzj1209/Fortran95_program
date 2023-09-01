program main
  implicit none
  type student
    integer chinese, english, math, science, social, total
  end type
  type(student) :: s, total
  integer, parameter :: students=20, subjects=5
  integer i

  open(10,file="grades.bin",access="direct",recl=1)
  write(*,"(7A10)") "座号","中文","英文","数学","自然","社会","总分"
  total = student(0,0,0,0,0,0)
  do i=1, students
    read(10,rec=(i-1)*subjects+1) s%chinese
    read(10,rec=(i-1)*subjects+2) s%english
    read(10,rec=(i-1)*subjects+3) s%math
    read(10,rec=(i-1)*subjects+4) s%science
    read(10,rec=(i-1)*subjects+5) s%social
	s%total = s%chinese+s%english+s%math+s%science+s%social
	total%chinese = total%chinese+s%chinese
	total%english = total%english+s%english
	total%math = total%math+s%math
	total%science = total%science+s%science
	total%social = total%social+s%social
	total%total = total%total+s%total
    write(*,"(7I10)") i, s
  end do
  
  write(*,"(A10,6F10.3)") "平均", &
						  real(total%chinese)/real(students),&
						  real(total%english)/real(students),&
						  real(total%math)/real(students),&
						  real(total%science)/real(students),&
						  real(total%social)/real(students),&
						  real(total%total)/real(students)

  stop
end
