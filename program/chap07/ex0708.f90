program ex0708
implicit none
  integer, parameter :: row = 2
  integer, parameter :: col = 2
  integer :: ma(row, col) = 1
  integer :: mb(row, col) = 4
  integer :: mc(row, col)
  integer :: i,j

  mc = ma + mb ! 一行程序码就可以做矩阵相加
  write(*,"(I3,I3,/,I3,I3)") ((mc(i,j), i=1,2),j=1,2)

  stop
end
