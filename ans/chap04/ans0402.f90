program main
  implicit none
  real, parameter :: PI=3.14159
  real radius
  write(*,*) "������뾶��"
  read(*,*) radius
  write(*,"(' ���='f8.3)") radius*radius*PI
end program

