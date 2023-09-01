program main
  implicit none
  integer, external :: gcd
  write(*,*) gcd(18,12)
end program

integer function gcd(A,B)
  implicit none
  integer A,B,BIG,SMALL,TEMP

  BIG=max(A,B)
  SMALL=min(A,B)

  do while( SMALL /= 1 )
    TEMP=mod(BIG,SMALL)
    if ( TEMP==0 ) exit
    BIG=SMALL
    SMALL=TEMP
  end do

  gcd=SMALL

  return
end function
