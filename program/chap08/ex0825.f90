program ex0825
implicit none
  interface ! ���庯��func�Ľӿ�
    function random10(lbound, ubound)
	implicit none
	real :: lbound, ubound
	real :: random10(10) ! ����ֵ�Ǹ�����
	end function
  end interface
  real :: a(10)
  CALL RANDOM_SEED()     ! �⺯���ӳ�ʽ, ʹ�������ǰ����
  a = random10(1.0, 10.0)! ����10��1.0��1.0֮��������
  write(*,"(10F6.2)") a  ! �������a������
end

! random10�᷵��10����Χ��lbound��ubound֮��������
function random10(lbound, ubound)
implicit none
  real :: lbound, ubound
  real :: len
  real :: random10(10)
  real    t
  integer i
  len = ubound - lbound  ! ���㷶Χ��С
  do i=1,10
    call random_number(t) ! t����0��1֮��������
    random10(i) = lbound + len * t ! ��tת����lbound��ubound��������
  end do
  return
end