program ex0504
implicit none
  integer rain, windspeed
  logical r,w

  write(*,*) "Rain:"
  read(*,*) rain
  write(*,*) "Wind:"
  read(*,*) windspeed

  r = (rain>=500)     ! ���rain>=150, r=.true, ��Ȼr=.false.
  w = (windspeed>=10) ! ���windspeed>=10, w=.true, ��Ȼw=.false.

  if ( r .or. w ) then ! ֻҪr��w��һ��ֵ��true�ͳ���
    write(*,*) "ֹͣ�ϰ��Ͽ�"
  else
    write(*,*) "�ճ��ϰ��Ͽ�"
  end if

stop
end