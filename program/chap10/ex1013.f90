module typedef
  implicit none
  type :: datalink
    integer :: i
    type(datalink), pointer :: prev ! 指向上一条数据
    type(datalink), pointer :: next ! 指向下一条数据
  end type datalink
end module typedef

program ex1013
  use typedef
  implicit none
  type(datalink), target  :: node1,node2,node3
  type(datalink), pointer :: p
  integer :: i

  node1 = datalink(1, null(), node2)
  node2 = datalink(2, node1 , node3)
  node3 = datalink(3, node2 , null())
  
  write(*,*) "照顺序输出"
  p=>node1
  do while(.true.)
    write(*,*) p%i
	if ( .not. associated(p%next) ) exit
	p=>p%next
  end do  

  write(*,*) "反过来输出"
  p=>node3
  do while(.true.)
    write(*,*) p%i
	if ( .not. associated(p%prev) ) exit
	p=>p%prev
  end do  

stop
end program
