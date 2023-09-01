program main
  implicit none
  real grades
  write(*,*) "请输入成绩"
  read(*,*) grades
  write(*,"(' 调整后成绩为 'f8.3)") SQRT(grades)*10.0
end program

