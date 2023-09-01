program ex0817
implicit none
  integer, parameter :: size = 5
  integer :: s = size
  integer :: a(size) = (/ 1,2,3,4,5 /)
  call UseArray1(a,size) ! �ѳ���size�����������С
  call UseArray1(a,s)    ! ��һ�����s �����������С
  call UseArray2(a)      ! �����������С
  call UseArray3(a)
  stop
end

subroutine UseArray1(num, size)
implicit none
  integer :: size 
  integer :: num(size) ! ����������С���ñ�����ָ��
  write(*,*) num
  return
end

subroutine UseArray2(num)
implicit none
  integer :: num(*) ! ��ָ�������С
  integer :: i
  write(*,*) (num(i), i=1,5) 
  ! �������������С����5, write��ִ��ʱ����ִ���
  return
end

subroutine UseArray3(num)
implicit none
  integer :: num(-2:2) ! �������¶����������귶Χ
  write(*,*) num(0)
  return
end
