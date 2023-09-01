module constant
  implicit none
  real, parameter :: PI = 3.14159
  real, parameter :: G  = 9.81
end module

module typedef
  implicit none
  type player
    real :: angle
    real :: speed
    real :: distance
  end type
end module

module shoot
  use constant
  use typedef
  implicit none
contains
	! �ɽǶȡ������ٶ�������Ͷ�����
	subroutine Get_Distance( person )
	  implicit none
	  type(player) :: person
	  real rad, Vx, time

	  rad  = Angle_TO_Rad( person%angle )      ! ��λת��
	  Vx   = person%speed * cos(rad)           ! ˮƽ�����ٶ�
	  time = 2.0 * person%speed * sin(rad) / G ! �ڿ��з���ʱ��
	  person%distance = Vx * time              ! ���� = ˮƽ�����ٶ� * ����ʱ��

	  return
	end subroutine

	! ��0��360�ĽǶ�ת����0��2PI�Ļ���
	real function Angle_TO_Rad( angle )
	  implicit none
	  real angle
	  Angle_TO_Rad = angle*pi/180.0
	  return
	end function

end module

program ex0837
  use shoot
  implicit none
  integer, parameter :: players = 5
  type(player) :: people(players) = (/ player(30.0, 25.0, 0.0),&
                                       player(45.0, 20.0, 0.0),& 
									   player(35.0, 21.0, 0.0),&
									   player(50.0, 27.0, 0.0),&
									   player(40.0, 22.0, 0.0) &
									 /)
  integer :: I

  do I=1, players
     call Get_Distance( people(I) )
	 write(*,"('Player ',I1,' =',F8.2)") I, people(I)%distance
  end do

  stop
end
