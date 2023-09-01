program main
  implicit none
  integer, parameter :: length = 79
  character(len=length) :: input, output
  integer i,j
  
  write(*,*) "ÇëÊäÈëÒ»¸ö×Ö´®"
  read(*,"(A79)") input
  j=1
  do i=1, len_trim(input)
    if ( input(i:i) /= ' ' ) then
	  output(j:j)=input(i:i)
	  j=j+1
	end if
  end do
  
  write(*,"(A79)") output
  
  stop
end program
