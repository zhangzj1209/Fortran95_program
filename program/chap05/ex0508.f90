program ex0508
implicit none
  real x,y
  integer ans
  
  write(*,*) "Input (x,y)"
  read(*,*) x,y

  if ( x>0 ) then
    if ( y>0 ) then ! x>0,y>0
	  ans=1
	else if ( y<0 ) then ! x>0, y<0
	  ans=4
	else ! x>0, y=0
      ans=0
	end if
  else if ( x<0 ) then
    if ( y>0 ) then ! x<0, y>0
	  ans=2
	else if ( y<0 ) then ! x<0, y<0
      ans=3
	else ! x<0, y=0
	  ans=0
	end if
  else ! x=0, y=任意数
    ans=0
  end if

  if ( ans/=0 ) then ! ans不为0时, 代表有解
	write(*,"('第',I1,'象限')") ans
  else
    write(*,*) "落在轴上"
  end if 

  stop
end
