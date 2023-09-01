program ex0809
implicit none
  integer, parameter :: players = 5
  real :: angle(players) = (/ 30.0, 45.0, 35.0, 50.0, 40.0 /)
  real :: speed(players) = (/ 25.0, 20.0, 21.0, 27.0, 22.0 /)
  real :: distance(players)
  real, external :: Get_Distance ! ����Get_Distance�Ǹ�����
  integer :: I

  do I=1, players
     distance(i) = Get_Distance( angle(i), speed(i) )
	 write(*,"('Player ',I1,' =',F8.2)") I, distance(i)
  end do

  stop
end
! ��0��360�ĽǶ�ת����0��2PI�Ļ���
real function Angle_TO_Rad( angle )
  implicit none
  real angle
  real, parameter :: pi=3.14159

  Angle_TO_Rad = angle*pi/180.0
  
  return
end
! �ɽǶȡ������ٶ�������Ͷ�����
real function Get_Distance( angle, speed )
implicit none
  real angle, speed  ! ����Ĳ���
  real rad, Vx, time ! �ڲ�ʹ��
  real, external  :: Angle_TO_Rad ! ����Angle_TO_Rad�Ǹ�����
  real, parameter :: G=9.81

  rad  = Angle_TO_Rad( angle )    ! ��λת��
  Vx   = speed*cos(rad)           ! ˮƽ�����ٶ�
  time = 2.0*speed*sin(rad) / G   ! �ڿ��з���ʱ��
  Get_Distance = Vx * time        ! ���� = ˮƽ�����ٶ� * ����ʱ��

  return
end
