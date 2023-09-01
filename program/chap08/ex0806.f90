program ex0806
implicit none
  integer, parameter :: players = 5
  real :: angle(players) = (/ 30.0, 45.0, 35.0, 50.0, 40.0 /)
  real :: speed(players) = (/ 25.0, 20.0, 21.0, 27.0, 22.0 /)
  real :: distance(players)
  integer :: I

  do I=1, players
     call Get_Distance( angle(i), speed(i), distance(i) )
	 write(*,"('Player ',I1,' =',F8.2)") I, distance(i)
  end do

  stop
end
! ��0��360�ĽǶ�ת����0��2PI�Ļ���
subroutine Angle_TO_Rad( angle, rad )
  implicit none
  real angle, rad
  real, parameter :: pi=3.14159

  rad = angle*pi/180.0
  
  return
end
! �ɽǶȡ������ٶ�������Ͷ�����
subroutine Get_Distance( angle, speed, distance )
implicit none
  real angle, speed  ! ����Ĳ���
  real distance      ! ׼������ȥ�Ľ��
  real rad, Vx, time ! �ڲ�ʹ��
  real, parameter :: G=9.81

  call Angle_TO_Rad( angle, rad ) ! ��λת��
  Vx   = speed*cos(rad)           ! ˮƽ�����ٶ�
  time = 2.0*speed*sin(rad) / G   ! �ڿ��з���ʱ��
  distance = Vx * time            ! ���� = ˮƽ�����ٶ� * ����ʱ��

  return
end
