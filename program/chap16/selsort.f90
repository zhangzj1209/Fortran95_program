! ѡ�����򷨷���
! By Perng 1997/8/29
program SELECTION_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! ���������

  write(*,"('Source=>',10I3)") A
  call SELECTION_SORT(A,N)      ! ����������ӳ���
  write(*,"('Sort=>',10I3)") A
  
  stop
end program
!
! ѡ�����򷨵��ӳ���
!
subroutine SELECTION_SORT(A,N)
  implicit none
  integer :: N,A(N)
  integer I,J  ! ѭ��������
  integer MIN  ! �ҳ�ÿһ���е���Сֵ
  integer TEMP ! ��������ʱʹ��

  do I=1,N
    MIN=A(I)     ! ��ʱ��A(I)����Сֵ
    do J=I+1,N
      if ( MIN > A(J) ) then   ! ����A(I)������С
        TEMP=A(J)        ! ��A(I)��A(J)����
        A(J)=A(I)
        A(I)=TEMP
        MIN=A(I)
      end if
	end do
  end do
                              
  return
end subroutine                
        
