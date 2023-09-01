program main
  implicit none
  real, parameter :: PI=3.14159
  real radius
  write(*,*) "请输入半径长"
  read(*,*) radius
  write(*,"(' 面积='f8.3)") radius*radius*PI
end program

