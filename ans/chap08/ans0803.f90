program main
  implicit none
  
  call bar(3)
  call bar(10)

  stop
end program

subroutine bar(length)
  implicit none
  integer, intent(in) :: length
  integer i
  character(len=79) :: string

  string=" "
  do i=1,length
    string(i:i)='*'
  end do
  write(*,"(A79)") string

  return
end subroutine