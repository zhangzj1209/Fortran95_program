program ex0612
implicit none
  integer i
  integer strlen
  integer, parameter :: key = 2
  character(len=20) :: string

  write(*,*) "String:"
  read(*,*) string
  strlen = len_trim(string)

  do i = 1, strlen
    string(i:i) = char( ichar(string(i:i)) + key )
  end do

  write(*,"('encoded:',A20)") string

  stop
end
