program main
  implicit none
  integer year, days
  logical mod_4, mod_100, mod_400

  write(*,*) "���������"
  read(*,*) year

  mod_4   = ( MOD(year,4) == 0 )
  mod_100 = ( MOD(year,100) == 0 )
  mod_400 = ( MOD(year,400) == 0 )

  if ( (mod_4 .NEQV. mod_100) .or. mod_400 ) then
    days = 366
  else
    days = 365
  end if

  write(*,"('��һ����'I3'��')") days

  stop
end program
