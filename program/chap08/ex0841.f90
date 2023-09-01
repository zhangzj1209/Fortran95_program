program ex0841
  implicit none
  include 'ex0841.inc'  ! 插入ex0841.inc的内容
  a=1
  b=2
  call sub()
  stop
end 

subroutine sub()
  implicit none
  include 'ex0841.inc'  ! 插入ex0841.inc的内容
  write(*,*) a,b
  return
end
