program main
  implicit none
  integer day
  character(len=20) :: tv

  write(*,*) "���������ڼ�"
  read(*,*) day

  select case(day)
  case(1,4)
    tv = "����"
  case(2,5)
    tv = "���Ӿ�"
  case(3,6)
    tv = "��ͨ"
  case(7)
    tv = "��Ӱ"
  case default
    write(*,*) "���������"
	stop
  end select 
  write(*,*) tv

end program