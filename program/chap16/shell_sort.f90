! 选择排序法范例
! By Perng 1997/8/29
program SHELL_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! 排序的数据

  write(*,"('Source=>',10I3)") A
  call SHELL_SORT(A,N)
  write(*,"('Sort=>',10I3)") A

  stop
end program
!
! 选择排序法的子程序
!
subroutine SHELL_SORT(A,N)
  implicit none
  integer :: N,A(N) ! 传入的数据
  integer I,J       ! 循环计数器
  integer TEMP      ! 交换数值用
  integer K         ! K 值

  K=N/2             ! K 的初值

  do while( K>0 )
    do I=K+1,N
      J=I-K
      do while( J>0 )
      ! 如果A(J)>A(J+K),要交换它们的数值,并往回取出
      ! A(J-K)、A(J)为新的一组来比较。
        if ( A(J) .GT. A(J+K) ) then
          TEMP=A(J)
          A(J)=A(J+K)
          A(J+K)=TEMP
          J=J-K
        else
          exit ! A(J)<A(J+K)时可跳出循环
        end if
	  end do
	end do
    K=K/2 ! 设定新的K值
  end do

  return
end subroutine
                
        
