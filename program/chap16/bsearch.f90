!
! 折半查找法范例
! By Perng 1997/8/31
program BINARY_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10      ! 类型的大小
  integer :: A(N)=(/2,5,7,9,10,11,13,17,21,23/)
  integer KEY
  integer LOC 
  integer, external :: BINARY_SEARCH

  write(*,"('Source=>',10I3)") A
  write(*,*) 'Input KEY:'
  read (*,*) KEY
  ! 调用顺序查找的子程序
  LOC=BINARY_SEARCH(A,N,KEY)
  if ( LOC/=0 ) then
    write(*,"('A(',I2,' )='I3)") LOC,KEY
  else
    write(*,*) "Not found"
  end if
  
  stop
end program
!
! 折半查找法的子程序
!
integer function BINARY_SEARCH(A,N,KEY)
  implicit none
  integer N,A(N)
  integer KEY    ! 所要寻找的值
  integer L      ! 记录每一个小组的类型起始位置
  integer R      ! 记录每一个小组的类型结束位置
  integer M      ! 记录每一个小组的类型中间位置

  ! 一开始的小组范围就是整个类型
  L=1                     
  R=N
  M=(L+R)/2
  ! 如果KEY值超出范围, 铁定不存在类型中
  if ( (KEY < A(L)) .OR. (KEY > A(R)) ) then
    BINARY_SEARCH = 0
    return
  end if

  do while( L <= R )
    if ( KEY > A(M) ) then
    ! 如果 key > 中间值，那数据就落在上半部
      L=M+1
      M=(L+R)/2
    else if ( KEY < A(M) ) then
    ! 如果 key < 中间值，那数据就落在下半部
      R=M-1
      M=(L+R)/2
    else if ( KEY .EQ. A(M) ) then
	  BINARY_SEARCH = M
	  return
    end if
  end do

  BINARY_SEARCH = 0
  return
end function
