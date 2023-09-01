program ex0815
implicit none
  real :: a=1.0
  call ShowInteger(a)
  call ShowReal(a)
  stop
end

subroutine ShowInteger(num)
implicit none
  integer :: num
  write(*,*) num
  return
end

subroutine ShowReal(num)
implicit none
  real :: num
  write(*,*) num
  return
end