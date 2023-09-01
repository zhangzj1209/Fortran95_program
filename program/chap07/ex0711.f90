program ex0711
implicit none
  integer :: i
  integer :: a(5)=(/ (i,i=1,5) /)
  integer :: b(5)=0
  
  where( a<3 )
    b = 1
  elsewhere
    b = 2
  end where
     
  write(*,"(5(I3,1X))") b
  stop
end

