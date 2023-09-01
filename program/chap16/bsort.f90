! 冒泡排序法范例
! By Perng 1997/8/29
program BUBBLE_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! 待排序的数据
  write(*,"('Source=>',10I3)") A
  call BUBBLE_SORT(A,N)  ! 调用排序的子程序
  write(*,"('Sort=>',10I3)") A
  stop
end program

subroutine BUBBLE_SORT(A,N)
  implicit none
  integer :: N,A(N)
  integer I,J, TEMP
  do I=N-1,1,-1   ! 开始做N-1次的扫瞄
    do J=1,I      ! 一对一对的来比较，I之后的数字不用比较
    ! 如果A(J) > A(J+1) 就把这两个数值交换
      if ( A(J) > A(J+1) ) then
        TEMP=A(J)
        A(J)=A(J+1)
        A(J+1)=TEMP
      end if
    end do
  end do
  return
end subroutine
