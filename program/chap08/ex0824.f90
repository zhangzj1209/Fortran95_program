program ex0824
implicit none
  integer, parameter :: players = 5
  real :: angle(players) = (/ 30.0, 45.0, 35.0, 50.0, 40.0 /)
  real :: speed(players) = (/ 25.0, 20.0, 21.0, 27.0, 22.0 /)
  real :: distance(players)
  real, external :: Get_Distance ! 声明Get_Distance是个函数
  integer :: I

  do I=1, players
     distance(i) = Get_Distance( angle(i), speed(i) )
	 write(*,"('Player ',I1,' =',F8.2)") I, distance(i)
  end do

  stop
end
! 把0～360的角度转换成0～2PI的弧度
real function Angle_TO_Rad( angle )
  implicit none
  real, intent(in) :: angle
  real, parameter  :: pi=3.14159

  Angle_TO_Rad = angle*pi/180.0
  
  return
end
! 由角度、切线速度来计算投射距离
real function Get_Distance( angle, speed )
implicit none
  real, intent(in) :: angle, speed  ! 传入的参数
  real rad, Vx, time ! 内部使用
  real, external  :: Angle_TO_Rad ! 声明Angle_TO_Rad是个函数
  real, parameter :: G=9.81

  rad  = Angle_TO_Rad( angle )    ! 单位转换
  Vx   = speed*cos(rad)           ! 水平方向速度
  time = 2.0*speed*sin(rad) / G   ! 在空中飞行时间
  Get_Distance = Vx * time        ! 距离 = 水平方向速度 * 飞行时间

  return
end
