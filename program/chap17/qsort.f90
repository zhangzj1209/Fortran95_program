program main
  use DFPORT
  implicit none
  integer :: a(5) = (/ 5,3,1,2,4 /)
  integer(2), external :: compareINT
  call QSORT( a, 5, 4, compareINT )
  write(*,*) a
  stop
end program

integer(2) function compareINT(a,b)
  implicit none
  integer a,b
  if ( a<b ) then
    compareINT=-1
  else if ( a==b) then
    compareINT=0
  else 
    compareINT=1
  end if
  return
end function
