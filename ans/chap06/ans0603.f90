program main
  implicit none
  integer, parameter :: answer = 45
  integer, parameter :: max = 5
  integer weight, i
  
  do i=1,max
    write(*,*) "����������"
	read(*,*) weight
	if ( weight==answer ) exit
  end do

  if ( i<=max ) then
    write(*,*) "�¶���"
  else
    write(*,*) "�´���"
  end if

  stop
end program
