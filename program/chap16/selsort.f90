! 选择排序法范例
! By Perng 1997/8/29
program SELECTION_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! 排序的数据

  write(*,"('Source=>',10I3)") A
  call SELECTION_SORT(A,N)      ! 调用排序的子程序
  write(*,"('Sort=>',10I3)") A
  
  stop
end program
!
! 选择排序法的子程序
!
subroutine SELECTION_SORT(A,N)
  implicit none
  integer :: N,A(N)
  integer I,J  ! 循环计数器
  integer MIN  ! 找出每一轮中的最小值
  integer TEMP ! 交换数据时使用

  do I=1,N
    MIN=A(I)     ! 暂时令A(I)是最小值
    do J=I+1,N
      if ( MIN > A(J) ) then   ! 发现A(I)不是最小
        TEMP=A(J)        ! 把A(I)、A(J)交换
        A(J)=A(I)
        A(I)=TEMP
        MIN=A(I)
      end if
	end do
  end do
                              
  return
end subroutine                
        
