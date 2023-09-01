program ex0504
implicit none
  integer rain, windspeed
  logical r,w

  write(*,*) "Rain:"
  read(*,*) rain
  write(*,*) "Wind:"
  read(*,*) windspeed

  r = (rain>=500)     ! 如果rain>=150, r=.true, 不然r=.false.
  w = (windspeed>=10) ! 如果windspeed>=10, w=.true, 不然w=.false.

  if ( r .or. w ) then ! 只要r或w有一个值是true就成立
    write(*,*) "停止上班上课"
  else
    write(*,*) "照常上班上课"
  end if

stop
end