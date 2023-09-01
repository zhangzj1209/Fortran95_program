program ex0818
implicit none
  character(len=20) :: str="Hello, Fortran 95."
  call ShowString( str )
  call ShowString( str(8:) )
  stop
end

subroutine ShowString( str )
  implicit none
  character(len=*) :: str
  write(*,*) len_trim(str)
  write(*,*) str
  return
end subroutine