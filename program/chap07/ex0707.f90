program ex0707
implicit none
  integer, parameter :: row = 2
  integer, parameter :: col = 2
  integer :: m(row, col)
  integer r ! ����ָ��row
  integer c ! ����ָ��column
  data ((m(r,c), r=1, 2), c=1,2) /1,2,3,4/

  ! �������m(1,1), m(2,1), m(1,2), m(2,2)��4������,  
  write(*,"(I3,I3,/,I3,I3)") (( m(r,c), c=1,2 ), r=1,2)

  stop
end
