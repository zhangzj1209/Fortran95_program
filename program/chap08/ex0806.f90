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
! 把0～360的角度转换成0～2PI的弧度
subroutine Angle_TO_Rad( angle, rad )
  implicit none
  real angle, rad
  real, parameter :: pi=3.14159

  rad = angle*pi/180.0
  
  return
end
! 由角度、切线速度来计算投射距离
subroutine Get_Distance( angle, speed, distance )
implicit none
  real angle, speed  ! 传入的参数
  real distance      ! 准备传回去的结果
  real rad, Vx, time ! 内部使用
  real, parameter :: G=9.81

  call Angle_TO_Rad( angle, rad ) ! 单位转换
  Vx   = speed*cos(rad)           ! 水平方向速度
  time = 2.0*speed*sin(rad) / G   ! 在空中飞行时间
  distance = Vx * time            ! 距离 = 水平方向速度 * 飞行时间

  return
end
