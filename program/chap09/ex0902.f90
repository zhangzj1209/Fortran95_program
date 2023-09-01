program ex0902
  implicit none
  character(len=20) :: string

  open(unit=10, file="test.txt")
  write(10,"(A20)") "Good morning." ! 写到文件中
  rewind(10)
  read(10,"(A20)") string ! 从文件中读出来
  write(*,"(A20)") string ! 写到屏幕上

  stop
end 
