! 散列查找法范例
! By Perng 1997/8/31
program HASH_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10 ! 类型的大小
  integer Source(N) ! 存放数据组的类型
  integer A(100)    ! 存放Hashing 后的类型
  integer KEY       ! 记录所要找的值
  integer I         ! 循环记数器
  data Source /21,53,71,19,61,81,3,17,44,93/

  write(*,"('Source=>',10I3)") Source
  write(*,*) 'Input KEY:'
  read (*,*) KEY
  if ( KEY<0 .or. KEY>100 ) then
    write(*,*) "Not found."
	stop
  end if

  ! 建立Hash表格中, 表格中放的是数值在类型中的位置
  A = 0
  do I=1,N
    A( Source(I) ) = I
  end do

  ! 在Hash表格中寻找数据
  if ( A(KEY)/=0 ) then
    write(*,"('Source(',I2,' )=',I3)") A(KEY), KEY
  else  
    write(*,*) "Not found"
  end if

  stop
end program
