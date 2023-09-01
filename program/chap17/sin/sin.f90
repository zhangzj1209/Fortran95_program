! sin�����Ļ�ͼ����
program Plot_Sine
 use DFLIB
implicit none
  integer, parameter :: lines=500	! �ö����߶�������������
  real(kind=8), parameter :: X_Start=-5.0	! x����С��Χ
  real(kind=8), parameter :: X_End=5.0		! x�����Χ	
  real(kind=8), parameter :: Y_Top=2.0		! y�����Χ 
  real(kind=8), parameter :: Y_Bottom=-2.0	! y����С��Χ
  integer :: result			! ȡ�ػ�ͼ��������״̬
  integer(kind=2) :: color	! �趨��ɫ��
  real(kind=8) :: step		! ѭ��������
  real(kind=8) :: x,y		! ��ͼʱʹ��,ÿ��С�߶ζ�����
  real(kind=8) :: NewX,NewY	! (x,y)��(NewX,NewY)
  real(kind=8), external :: f ! ����ͼ�ĺ���
  type(wxycoord) :: wt		! ������һ�ε��߼�����λ��
  type(xycoord)  :: t		! ������һ�ε�ʵ������λ��

  ! �趨�߼����귶Χ��С	
  result=SetWindow( .true. , X_Start, Y_Top, X_End, Y_Bottom )
  ! ������ֵ�ķ������趨��ɫ
  result=SetColor(2)   ! Ĭ�ϵ�2����Ӧ������ɫ
  call MoveTo(10,20,t) ! �ƶ����ʵ����ڵ�(10,20)
  call OutGText("f(x)=sin(x)")  ! д������
  ! ʹ��ȫ��RGB 0-255��256��ɫ�����趨��ɫ
  color=RGBToInteger(255,0,0)		! �ѿ���RGB������ֵת����color��
  result=SetColorRGB(color)			! ����color���趨��ɫ

  call MoveTo_W(X_Start,0.0_8,wt)	! ��X��
  result=LineTo_W(X_End,0.0_8)		! 
  call MoveTo_W(0.0_8,Y_Top,wt)		! ��Y��
  result=LineTo_W(0.0_8,Y_Bottom)	! 	

  step=(X_End-X_Start)/lines		! ����С�߶μ��X���
  ! ����#FF0000��ʹ��16���Ƶķ�������ʾһ������
  result=SetColorRGB(#FF0000)		 
  ! ��ʼ����С�߶���
  do x=X_Start,X_End-step,step
    y=f(x)			! �߶ε���˵�
	NewX=x+step		
	NewY=f(NewX)	! �߶ε��Ҷ˵�
	call MoveTo_W(x,y,wt)
	result=LineTo_W(NewX,NewY)
  end do
  ! �趨���������,���ڻ��������
  result=SetExitQQ(QWIN$EXITPERSIST)
end
! ��Ҫ��ͼ�ĺ���
real(kind=8) function f(x)
implicit none
  real(kind=8) :: x
  f=sin(x)
  return
end function f