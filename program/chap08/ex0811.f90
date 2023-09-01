program ex0811
implicit none
  integer :: a,b
  common /group1/ a
  common /group2/ b
  a=1
  b=2
  call ShowGroup1()
  call ShowGroup2()
  stop
end

subroutine ShowGroup1()
implicit none
  integer :: num1
  common /group1/ num1
  write(*,*) num1
  return
end

subroutine ShowGroup2()
implicit none
  integer :: num1
  common /group2/ num1
  write(*,*) num1
  return
end
