! ʹ�ò˵�����
! By Perng 1997/9/22
program Menu_Demo
use DFLIB
implicit none
  type(windowconfig) :: wc
  integer :: result  
  integer :: i,ix,iy
  wc.numxpixels=200 ! ���ڵĿ�
  wc.numypixels=200 ! ���ڵĸ�
  ! -1�����ó�������ȥ������
  wc.numtextcols=-1	! ÿ������������
  wc.numtextrows=-1	! �����м�������
  wc.numcolors=-1	! ʹ�ö�����ɫ
  wc.title="Plot Area"C ! ���ڵı���
  wc.fontsize=-1
  ! ����wc��������������������趨���ڴ�С
  result=SetWindowConfig(wc)
  ! �ѳ������ȴ������Ϣ��״̬
  do while (.TRUE.)
    i = waitonmouseevent(MOUSE$RBUTTONDOWN, i, ix, iy)
  end do
end program
!
! ������Զ�ִ���������, �����趨���ڵĳ���
!
logical(kind=4) function InitialSettings()
use DFLIB
implicit none
  logical(kind=4) :: result
  type(qwinfo) :: qw
  external PlotSin,PlotCos  
  
  ! �趨�������ڳ���һ��ʼ���ֵ�λ�ü���С
  qw.type=QWIN$SET
  qw.x=0
  qw.y=0
  qw.h=400
  qw.w=400
  result=SetWSizeQQ(QWIN$FRAMEWINDOW,qw) 
  ! ��֯��һ��˵�
  result=AppendMenuQQ(1,$MENUENABLED,'&File'C,NUL)		 
  result=AppendMenuQQ(1,$MENUENABLED,'&Save'C,WINSAVE)   
  result=AppendMenuQQ(1,$MENUENABLED,'&Print'C,WINPRINT) 
  result=AppendMenuQQ(1,$MENUENABLED,'&Exit'C,WINEXIT)  
  ! ��֯�ڶ���˵�
  result=AppendMenuQQ(2,$MENUENABLED,'&Plot'C,NUL)
  result=AppendMenuQQ(2,$MENUENABLED,'&sin(x)'C,PlotSin)
  result=AppendMenuQQ(2,$MENUENABLED,'&cos(x)'C,PlotCos)
  ! ��֯������˵�
  result=AppendMenuQQ(3,$MENUENABLED,'&Exit'C,WINEXIT)

  InitialSettings=.true.
  return
end function InitialSettings
!
! ��sin���ӳ���
!
subroutine PlotSin(check)
use DFLIB
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f1
  integer :: result
  ! �ڵڶ���˵��ĵ�һ��ѡ��,Ҳ����sin��ǰ������
  result=ModifyMenuFlagsQQ(2,1,$MENUCHECKED)
  ! ��ѡ��cosǰ�Ĺ�ȡ��
  result=ModifyMenuFlagsQQ(2,2,$MENUUNCHECKED)
  call Draw_Func(f1)
  return
end subroutine
!
! ��cos���ӳ���
!
subroutine PlotCos(check)
use DFLIB
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f2
  integer :: result
  check=.true.
  ! ��ѡ��sinǰ�Ĺ�ȡ��
  result=ModifyMenuFlagsQQ(2,1,$MENUUNCHECKED)
  ! ��ѡ��cosǰ�����
  result=ModifyMenuFlagsQQ(2,2,$MENUCHECKED)
  call Draw_Func(f2)
  return
end subroutine
!
! ����������ĺ���ͼ����
!
subroutine Draw_Func(func)
use DFLIB
implicit none
  integer, parameter :: lines=500	! �ö����߶�������������
  real(kind=8), parameter :: X_Start=-5.0	! x����С��Χ
  real(kind=8), parameter :: X_End=5.0		! x�����Χ	
  real(kind=8), parameter :: Y_Top=5.0		! y�����Χ 
  real(kind=8), parameter :: Y_Bottom=-5.0	! y����С��Χ
  integer :: result			! ȡ�ػ�ͼ��������״̬
  integer(kind=2) :: color	! �趨��ɫ��
  real(kind=8) :: step		! ѭ��������
  real(kind=8) :: x,y		! ��ͼʱʹ��,ÿ��С�߶ζ�����
  real(kind=8) :: NewX,NewY	! (x,y)��(NewX,NewY)
  real(kind=8), external :: func ! ����ͼ�ĺ���
  type(wxycoord) :: wt		! ������һ�ε��߼�����λ��
  type(xycoord)  :: t		! ������һ�ε�ʵ������λ��

  call ClearScreen($GCLEARSCREEN) ! �����Ļ
  ! �趨�߼����귶Χ��С	
  result=SetWindow( .true. , X_Start, Y_Top, X_End, Y_Bottom )
  ! ������ֵ�ķ������趨��ɫ
  result=SetColor(2)   ! Ĭ�ϵ�2����Ӧ������ɫ
  call MoveTo(10,20,t) ! �ƶ����ʵ����ڵ�(10,20)
  
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
    y=func(x)		! �߶ε���˵�
	NewX=x+step		
	NewY=func(NewX)	! �߶ε��Ҷ˵�
	call MoveTo_W(x,y,wt)
	result=LineTo_W(NewX,NewY)
  end do
  
  ! �趨���������,���ڻ��������
  result=SetExitQQ(QWIN$EXITPERSIST)
end subroutine Draw_Func
!
! ��Ҫ��ͼ�ĺ���
!
real(kind=8) function f1(x)
implicit none
  real(kind=8) :: x
  f1=sin(x)
  return
end function f1

real(kind=8) function f2(x)
implicit none
  real(kind=8) :: x
  f2=cos(x)
  return
end function f2
