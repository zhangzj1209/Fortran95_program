program ex0420
  integer a
  a=100
  write(*,100) a  ! 使用行代码100地方设定的格式来输出变数a
  100 format(I4)  ! 最前面的100是行代码, 把这一行程序代码给一个编号
end
