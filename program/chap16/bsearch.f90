!
! �۰���ҷ�����
! By Perng 1997/8/31
program BINARY_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10      ! ���͵Ĵ�С
  integer :: A(N)=(/2,5,7,9,10,11,13,17,21,23/)
  integer KEY
  integer LOC 
  integer, external :: BINARY_SEARCH

  write(*,"('Source=>',10I3)") A
  write(*,*) 'Input KEY:'
  read (*,*) KEY
  ! ����˳����ҵ��ӳ���
  LOC=BINARY_SEARCH(A,N,KEY)
  if ( LOC/=0 ) then
    write(*,"('A(',I2,' )='I3)") LOC,KEY
  else
    write(*,*) "Not found"
  end if
  
  stop
end program
!
! �۰���ҷ����ӳ���
!
integer function BINARY_SEARCH(A,N,KEY)
  implicit none
  integer N,A(N)
  integer KEY    ! ��ҪѰ�ҵ�ֵ
  integer L      ! ��¼ÿһ��С���������ʼλ��
  integer R      ! ��¼ÿһ��С������ͽ���λ��
  integer M      ! ��¼ÿһ��С��������м�λ��

  ! һ��ʼ��С�鷶Χ������������
  L=1                     
  R=N
  M=(L+R)/2
  ! ���KEYֵ������Χ, ����������������
  if ( (KEY < A(L)) .OR. (KEY > A(R)) ) then
    BINARY_SEARCH = 0
    return
  end if

  do while( L <= R )
    if ( KEY > A(M) ) then
    ! ��� key > �м�ֵ�������ݾ������ϰ벿
      L=M+1
      M=(L+R)/2
    else if ( KEY < A(M) ) then
    ! ��� key < �м�ֵ�������ݾ������°벿
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
