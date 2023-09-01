module global
  implicit none
  integer, save :: a
end module

program ex0835
  use global
  implicit none
  a = 10
  call sub()
  write(*,*) a
  stop
end

subroutine sub()
  use global
  implicit none
  write(*,*) a
  a = 20
  return
end 
