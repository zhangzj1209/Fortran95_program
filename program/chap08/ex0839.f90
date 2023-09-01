program ex0839
  implicit none
  integer :: a

  read(*,*) a
  call sub( a, *100, *200 ) 
  ! 特别另外指定两个返回点, 分别是行代码100及200这两个地方
  write(*,*) "Default"
  stop
  100 write(*,*) "Return 1"
  stop
  200 write(*,*) "Return 2"
  stop 

end 

subroutine sub( a, *, * )
  implicit none
  integer :: a
  if ( a<=0 ) then
    return    ! 返回内定的返回点
  else if ( a==1 ) then
    return 1  ! 返回特别指定的第1个返回点
  else
    return 2  ! 返回特别指定的第2个返回点
  end if
end subroutine