! Interactive�Ļ�ͼ����
! By Perng 1997/9/20
program Plot_Sine
use DFLIB
implicit none
  logical :: result
  integer :: input		
  type(WindowConfig) :: wc
  real(kind=8), external :: f1,f2,f3	! ��Ҫ��ĺ���
  ! �������õĴ���
  open(unit=5,file='user',iofocus=.true.)
  ! -1 �����ɳ�������ȥ������
  wc.numxpixels=300 ! ���ڵĿ�
  wc.numypixels=300 ! ���ڵĸ�
  wc.numtextcols=-1 ! ÿ�п����ɵ�����
  wc.numtextrows=-1 ! �����м�������
  wc.numcolors=-1	! ����ʹ�õ���ɫ
  wc.title="Input Area"C ! ���ڵı�������
  wc.fontsize=-1	! ��ʹ�õ����ִ�С
  ! ����wc��������������������趨���ڴ�С
  result=SetWindowConfig(wc) 
  result=DisplayCursor($GCURSORON) ! ���ֳ��α�
  ! �򿪻�ͼ��Ҫʹ�õĴ���
  open(unit=10,file='user',iofocus=.true.)
  wc.numxpixels=300 ! ���ڵĿ�
  wc.numypixels=300 ! ���ڵĸ�
  ! -1�����ó�������ȥ������
  wc.numtextcols=-1	! ÿ������������
  wc.numtextrows=-1	! �����м�������
  wc.numcolors=-1	! ʹ�ö�����ɫ
  wc.title="Plot Area"C ! ���ڵı���
  wc.fontsize=-1
  ! ����wc��������������������趨���ڴ�С
  result=SetWindowConfig(wc)
  ! �������Ұ��²˵���Windows��Tile����, ʹ��������֮��
  ! ���ụ���ص�
  result=ClickMenuQQ(QWIN$TILE) 
  input=1 ! ����һ�������ֵ, ��Ȼ���ܽ��������ѭ��
  ! ������ʹ�õĴ�����Ϊ���Ա������״̬, 5���ǵ�һ�δ�
  ! userʱ���õ�unitֵ
  result=FocusQQ(5) 
  do while( input>0 .and. input<4 )
    write(5,*) '(1) Plot f(x)=sin(x)'
	write(5,*) '(2) Plot f(x)=cos(x)'
	write(5,*) '(3) Plot f(x)=(x+2)*(x-2)'
	write(5,*) 'Other to EXIT'
	read(5,*) input
	result=SetActiveQQ(10) ! �ѻ�ͼ����ָ������ͼ���ڵĴ�����
	! ����input������Ҫ������һ������
	select case(input)
	case (1)
	  call Draw_Func(f1)
	case (2)
	  call Draw_Func(f2)
	case (3)
	  call Draw_Func(f3)
	end select
  end do
  ! �趨��������������,���ڻ��Զ��ر�
  result=SetExitQQ(QWIN$EXITNOPERSIST)
end program Plot_Sine

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

  call ClearScreen($GCLEARSCREEN) ! ���өĻ
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
! ��Ҫ��ͼ�ĺ���
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
real(kind=8) function f3(x)
implicit none
  real(kind=8) :: x
  f3=(x+2)*(x-2)
  return
end function f3