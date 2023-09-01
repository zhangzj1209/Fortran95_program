program main
  implicit none
  integer day
  character(len=20) :: tv

  write(*,*) "请输入星期几"
  read(*,*) day

  select case(day)
  case(1,4)
    tv = "新闻"
  case(2,5)
    tv = "电视剧"
  case(3,6)
    tv = "卡通"
  case(7)
    tv = "电影"
  case default
    write(*,*) "错误的输入"
	stop
  end select 
  write(*,*) tv

end program