program ex0823
  implicit none
  integer :: a=4
  integer b
  call div(a,b)
  write(*,*) a,b
  stop
end program

subroutine div(a,b)
  implicit none
  integer, intent(in) :: a  ! 指定a是只读
  integer, intent(out) :: b ! 指定b在子程式中应该要重设数值
  integer c
  c=b
  b=a/2
end subroutine

