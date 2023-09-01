program ex1004
  implicit none
  integer, pointer :: a(:)
  integer, target  :: b(5)=(/ 1,2,3,4,5 /)
  ! 把指针数组a指向数组b
  a=>b  
  ! a(1～5)=>b(1～5)
  write(*,*) a
  a=>b(1:3)
  ! a(1)=>b(1), a(2)=>b(2), a(3)=>b(3)
  write(*,*) a 
  a=>b(1:5:2)
  ! a(1)=>b(1), a(2)=>b(3), a(3)=>b(5)
  write(*,*) a 
  a=>b(5:1:-1)
  ! a(1)=>b(5), a(2)=>b(4), a(3)=>b(3), a(4)=>b(2), a(5)=>b(1)
  write(*,*) a 
  stop
end
