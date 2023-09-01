! ˳����ҷ�����
! By Perng 1997/8/31
program SEQUENTIAL_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! ��������������
  integer KEY             ! ��¼��Ҫ�ҵ�ֵ
  integer LOC
  integer, external :: SEQUENTIAL_SEARCH

  write(*,"('Source=>',10I3)") A
  write(*,*) 'Input KEY:'
  read (*,*) KEY                    ! �����Ѱ����
  ! ����˳����ҵĺ���
  LOC = SEQUENTIAL_SEARCH(A,N,KEY)
  if ( LOC/=0 ) then
    write(*,"('A(',I2,' )='I3)") LOC,KEY
  else
    write(*,*) "Not found"
  end if
  stop
end program
!
! ˳����ҷ����ӳ���
!
integer function SEQUENTIAL_SEARCH(A,N,KEY)
  implicit none
  integer N, A(N)
  integer KEY             ! ��ҪѰ�ҵ�ֵ
  integer I               ! ѭ���ļ�����

  do I=1,N  ! ��ʼ��ɨ��, �����N��.
    if ( KEY==A(I) ) then
      ! �ҵ���, ���������������е�λ��
	  SEQUENTIAL_SEARCH=I
	  return
	end if
  end do
  ! û�ҵ�ʱ����-1
  SEQUENTIAL_SEARCH=0
  return
end function
