program ex0902
  implicit none
  character(len=20) :: string

  open(unit=10, file="test.txt")
  write(10,"(A20)") "Good morning." ! д���ļ���
  rewind(10)
  read(10,"(A20)") string ! ���ļ��ж�����
  write(*,"(A20)") string ! д����Ļ��

  stop
end 
