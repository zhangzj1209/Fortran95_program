program  ex0832
  implicit none
  integer, external :: func
  write(*,*) func(2,3)
end program

pure integer function func(a,b)
  implicit none
  integer, intent(in) :: a,b
  func = a+b
  return
end function