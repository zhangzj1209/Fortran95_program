program ex0709
implicit none
  integer, parameter :: row = 2
  integer, parameter :: col = 2
  integer :: a(2,2)=(/ 1,2,3,4 /)
  ! a(1,1)=1, a(2,1)=2, a(1,2)=3, a(2,2)=4
  integer :: b(4)=(/ 5,6,7,8 /)
  integer :: c(2)

  write(*,*) a ! 写出a(1,1), a(2,1), a(1,2), a(2,2)
  write(*,*) a(:,1) ! 写出a(1,1), a(1,2)
    
  c = a(:,1)   ! c(1)=a(1,1), c(2)=a(2,1)
  write(*,*) c ! 写出c(1), c(2)
  
  c = a(2,:)   ! c(1)=a(2,1), c(2)=a(2,2)
  write(*,*) c ! 写出c(1), c(2)
  write(*,*) c(2:1:-1) ! 写出c(2), c(1)
  
  c = b(1:4:2) ! c(1)=b(1), c(2)=b(3)
  write(*,*) c ! 写出c(1), c(2)

  stop
end
