! ð�����򷨷���
! By Perng 1997/8/29
program BUBBLE_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! �����������
  write(*,"('Source=>',10I3)") A
  call BUBBLE_SORT(A,N)  ! ����������ӳ���
  write(*,"('Sort=>',10I3)") A
  stop
end program

subroutine BUBBLE_SORT(A,N)
  implicit none
  integer :: N,A(N)
  integer I,J, TEMP
  do I=N-1,1,-1   ! ��ʼ��N-1�ε�ɨ��
    do J=1,I      ! һ��һ�Ե����Ƚϣ�I֮������ֲ��ñȽ�
    ! ���A(J) > A(J+1) �Ͱ���������ֵ����
      if ( A(J) > A(J+1) ) then
        TEMP=A(J)
        A(J)=A(J+1)
        A(J+1)=TEMP
      end if
    end do
  end do
  return
end subroutine
