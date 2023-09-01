program  main
implicit none
  integer, parameter :: size=10
  integer :: a(size) = (/ 5,3,6,4,8,7,1,9,2,10 /)
  integer :: i,j
  integer :: t
  
  do i=1, size-1
    do j=i+1, size
      if ( a(i) < a(j) ) then ! a(i)¸úa(j)½»»»
	    t=a(i)
        a(i)=a(j)
		a(j)=t
	  end if
	end do
  end do

  write(*,"(10I4)") a

  stop
end 