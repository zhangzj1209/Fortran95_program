program main
  use IMSL
  real :: A(3,3) = (/ 1,2,3,&
                      1,5,6,&
					  2,8,9 /)
  real :: B(3) = (/ 4, 15, 18 /), C(3)
  ! Çó½â x+y+2z=4
  !      2x+5y+8z=15
  !      3x+6y+9z=18
  C = A .ix. B ! invert(A) * B
  write(*,*) C  
  stop
end program

