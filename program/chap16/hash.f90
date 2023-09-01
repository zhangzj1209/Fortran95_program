! ɢ�в��ҷ�����
! By Perng 1997/8/31
program HASH_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10 ! ���͵Ĵ�С
  integer Source(N) ! ��������������
  integer A(100)    ! ���Hashing �������
  integer KEY       ! ��¼��Ҫ�ҵ�ֵ
  integer I         ! ѭ��������
  data Source /21,53,71,19,61,81,3,17,44,93/

  write(*,"('Source=>',10I3)") Source
  write(*,*) 'Input KEY:'
  read (*,*) KEY
  if ( KEY<0 .or. KEY>100 ) then
    write(*,*) "Not found."
	stop
  end if

  ! ����Hash�����, ����зŵ�����ֵ�������е�λ��
  A = 0
  do I=1,N
    A( Source(I) ) = I
  end do

  ! ��Hash�����Ѱ������
  if ( A(KEY)/=0 ) then
    write(*,"('Source(',I2,' )=',I3)") A(KEY), KEY
  else  
    write(*,*) "Not found"
  end if

  stop
end program
