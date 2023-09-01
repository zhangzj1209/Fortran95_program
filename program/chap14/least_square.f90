module datas
  implicit none
  integer, parameter :: N=5
  real :: temperature(N) = (/5.0,10.0,15.0,20.0,25.0/)  ! ��¼�¶�
  real :: length(N) = (/1.047,1.112,1.1152,1.191,1.252/)! ��¼��ͬ�¶��µĳ���
  real, save :: A,B  ! ����L=At+B��ϵ��
end module

module sgl_util
  use datas
  use sgl
  implicit none
  real, parameter :: xmin = 0.0, xmax = 30.0
  real, parameter :: ymin = 0.5, ymax = 1.5
contains
  subroutine display()
    real, parameter :: xsize = 0.3, ysize=0.01
	real xs, ys, xe, ye
	real l,x
	l(x) = A*x+B
    integer i
	call sglClearBuffer()
	xs = xmin
	ys = l(xs)
	xe = xmax
	ye = l(xe)
	call sglColor3i(255,255,255)
    call sglLineV(xs,ys, xe,ye)
	call sglColor3i(255,0,0)
	do i=1,N
	  call sglLineV( temperature(i)-xsize, length(i)-ysize, &
	                 temperature(i)+xsize, length(i)+ysize  )
	  call sglLineV( temperature(i)+xsize, length(i)-ysize, &
	                 temperature(i)-xsize, length(i)+ysize  )
	end do
	call sglUpdateBuffer()
  end subroutine
end module

! ��С�������
program main
  use sgl_util
  implicit none
  ! ������С������ӳ���������ϵ��A,B
  call least_square(temperature, length, N, A, B)
  write(*,"('A=',F6.4,' B=',F6.4)") A,B

  call sglSetVirtual(xmin, ymax, xmax, ymin)
  call sglDisplaySub(display)
  call sglCreateWindow(100,100,400,400,1)
  call sglMainLoop()

  stop
END

subroutine least_square(x, y, n, s, t)
  implicit none
  integer n
  real x(n)   ! x�ϵ����ݵ�
  real y(n)   ! y�ϵ����ݵ�
  real s,t    ! ��Ҫ�����ϵ��
  real A,B,C,D,E,F  ! ��������ʽ�е�ϵ��
  integer I         ! ѭ��������
  ! �� As+Bt=E �е�δ֪��s,t
  !      Cs+Dt=F  
  ! ���趨��A,B,C,D,E,F��ϵ��ֵ
  A = 0; B = 0; E = 0; F = 0
  do I=1,N
    A=A+X(I)*X(I) 
    B=B+X(I)              
    E=E+X(I)*Y(I) 
    F=F+Y(I)              
  END DO
  C=B
  D=N
  ! ��Ԫһ�η���ʽ�й�ʽ�ɽ�
  S=(B*F-E*D)/(B*C-A*D)
  T=(E*C-A*F)/(B*C-A*D)
  return
end subroutine
