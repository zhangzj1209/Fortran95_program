program ex0812
implicit none
  integer :: a,b
  common a,b          ! a,b���ڲ�������ȫ�ֱ����ռ���
  integer :: c,d
  common /group1/ c,d ! c,d����group1��ȫ�ֱ����ռ���
  integer :: e,f
  common /group2/ e,f ! e,f����group2��ȫ�ֱ����ռ���

  write(*,"(6I4)") a,b,c,d,e,f

  stop
end

block data
implicit none
  integer a,b
  common  a,b          ! a,b���ڲ�������ȫ�ֱ����ռ���
  data    a,b /1,2/    ! �趨a,b�ĳ�ֵ
  integer c,d
  common  /group1/ c,d ! c,d����group1��ȫ�ֱ����ռ���
  data    c,d /3,4/    ! �趨c,d�ĳ�ֵ
  integer e,f
  common  /group2/ e,f ! e,f����group2��ȫ�ֱ����ռ���
  data    e,f /5,6/    ! �趨e,f�ĳ�ֵ
end block data
