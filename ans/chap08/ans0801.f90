program main
  implicit none
  real radius, area

  write(*,*) "������뾶��"
  read(*,*) radius
  call CircleArea(radius, area)
  write(*,"(' ��� = 'F8.3)") area

  stop
end program

subroutine CircleArea(radius, area)
  implicit none
  real, parameter :: PI=3.14159
  real radius, area
  area = radius*radius*PI
  return
end subroutine
