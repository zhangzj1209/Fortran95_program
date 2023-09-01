program main
  use IMSL
  implicit none
  real :: A(3,3) = (/ 1,0,0,&
                      0,2,0,&
					  0,0,3 /)
  real :: eigenvalue(3)
  real :: eigenvector(3,3)
  integer i

  eigenvalue = eig(A, v=eigenvector)
  do i=1,3
    write(*,"('eigenvalue=',F5.2)") eigenvalue(i)
    write(*,"('eigenvector=['3(F5.2' ')']')") eigenvector(:,i)
  end do

  stop
end program

