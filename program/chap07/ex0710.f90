program ex0710
implicit none
  integer :: i
  integer :: a(5)=(/ (i,i=1,5) /)
  integer :: b(5)=0
  
  ! ��a(1��5)��С��3��Ԫ��ֵ��ֵ��b
  where( a<3 )
    b = a
  end where
     
  write(*,"(5(I3,1X))") b
  stop
end

