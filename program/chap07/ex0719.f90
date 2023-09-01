program  ex0719
implicit none
  integer, parameter :: L=3, M=4, N=2
  real :: A(L,M) = (/ 1,2,3,4,5,6,7,8,9,10,11,12 /)
  real :: B(M,N) = (/ 1,2,3,4,5,6,7,8 /)
  real :: C(L,N)
  integer :: i,j,k
  
  do i=1,L
    do j=1,N
	  C(i,j) = 0.0
	  do k=1,M 
	    C(i,j) = C(i,j)+A(i,k)*B(k,j)   
      end do
	end do
  end do
  
  do i=1,L
    write(*,*) C(i,:)
  end do

  stop
end 

