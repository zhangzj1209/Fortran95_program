! ѡ�����򷨷���
! By Perng 1997/8/29
program SHELL_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! ���������

  write(*,"('Source=>',10I3)") A
  call SHELL_SORT(A,N)
  write(*,"('Sort=>',10I3)") A

  stop
end program
!
! ѡ�����򷨵��ӳ���
!
subroutine SHELL_SORT(A,N)
  implicit none
  integer :: N,A(N) ! ���������
  integer I,J       ! ѭ��������
  integer TEMP      ! ������ֵ��
  integer K         ! K ֵ

  K=N/2             ! K �ĳ�ֵ

  do while( K>0 )
    do I=K+1,N
      J=I-K
      do while( J>0 )
      ! ���A(J)>A(J+K),Ҫ�������ǵ���ֵ,������ȡ��
      ! A(J-K)��A(J)Ϊ�µ�һ�����Ƚϡ�
        if ( A(J) .GT. A(J+K) ) then
          TEMP=A(J)
          A(J)=A(J+K)
          A(J+K)=TEMP
          J=J-K
        else
          exit ! A(J)<A(J+K)ʱ������ѭ��
        end if
	  end do
	end do
    K=K/2 ! �趨�µ�Kֵ
  end do

  return
end subroutine
                
        
