! ɢ�в��ҷ�����
! by perng 1997/8/31
program hashing_search_demo
  implicit none
  integer, parameter :: n=10 ! ���͵Ĵ�С
  integer source(n) ! ��������������
  integer a(n)      ! ���hashing �������
  integer key               ! ��¼��Ҫ�ҵ�ֵ
  integer i                 ! ѭ��������
  integer loc
  data source /21,53,71,19,61,81,3,17,44,93/
  integer hash
  hash(key) = key/10+1 ! ����hash����

  write(*,"('source=>',10I3)") source
  
  a=0
  do i=1,n
    loc = hash( source(i) )
    do while(.true.)
	  if ( a(loc)==0 ) then
	    a(loc)=i
		exit
	  else
	    loc=loc+1
		if ( loc>n ) loc=1
	  end if
	end do
  end do

  write(*,*) 'input key:'
  read (*,*) key

  loc = hash(key)
  do i=1,N
	if ( a(loc)==0 ) then
	  write(*,*) "Not found."
	  exit
	else if ( source( a(loc) )==KEY ) then
	  write(*,"('Source(',I2,' )=',I3)") a(loc), key
	  exit
	else
	  loc=loc+1
	  if ( loc>n ) loc=1
	end if
  end do
  if ( i>N ) write(*,*) "Not found."

  stop
end program
