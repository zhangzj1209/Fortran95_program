! ��������¼��ĺ���
module MouseEvent
use DFLIB
implicit none
Contains
  ! ����ڴ�����ÿ�ƶ�һ��,�ͻ�����������
  subroutine ShowLocation(iunit, ievent, ikeystate, ixpos, iypos)
  implicit none
    integer :: iunit		! ������ڵĴ��ڵ�unitֵ
	integer :: ievent		! ��귢������Ϣ��
	integer :: ikeystate	! �����������ʱ,�������Ƽ���״̬
	integer :: ixpos,iypos	! ����ڴ����е�λ��
    type(xycoord) :: t		 
	integer :: result		 
	character(len=15) :: output	! �趨������ִ�

	result=SetActiveQQ(iunit)		! �ѻ�ͼ����ָ���������
    write(output,100) ixpos,iypos	! ���������λ�õ���Ϣд��output
100 format("(X:",I4," Y:",I4,")")	!
    result=SetColorRGB(#1010FF)		 
    result=Rectangle($GFILLINTERIOR,0,0,120,18) ! ��һ��ʵ�ķ���
    result=SetColorRGB(#FFFFFF) 
	call MoveTo( 4,2,t)	
	call OutGText(output)	! ��ʾ��Ϣ
	! ���������ƶ�����, ���ͬʱ������, ��˳�㻭��һ����.
	if ( ikeystate==MOUSE$KS_LBUTTON ) then
	  result=SetColorRGB(#0000FF)
	  result=SetPixel(ixpos,iypos)
	end if
	return
  end subroutine
  ! ����Ҽ�����ʱ, ��ִ���������
  subroutine MouseClearScreen(iunit, ievent, ikeystate, ixpos, iypos )
  implicit none
    integer :: iunit		! ������ڵĴ��ڵ�unitֵ
	integer :: ievent		! ��귢������Ϣ��
	integer :: ikeystate	! �����������ʱ,�������Ƽ���״̬
	integer :: ixpos,iypos	! ����ڴ����е�λ��
    type(xycoord) :: t		 
	integer :: result		 

	result=SetActiveQQ(iunit)		! �ѻ�ͼ�����趨��������ڴ�����
    call ClearScreen($GCLEARSCREEN)	! ���������Ļ
    
	return
  end subroutine    
end module

program Mouse_Demo
use DFLIB
use MouseEvent
implicit none
  integer :: result
  integer :: event
  integer :: state,x,y

  result=AboutBoxQQ("Mouse Draw Demo\r By Perng 1997/09"C)
  ! �򿪴���
  open( unit=10, file='user', title='Mouse Demo', iofocus=.true. )
  ! ʹ������ǰ, һ��Ҫ����InitializeFonts
  result=InitializeFonts()
  ! ѡ��Courier New�������ڴ����������			
  result=setfont('t''Courier New''h14w8')
  call ClearScreen($GCLEARSCREEN)	! �����һ����Ļ
  ! �趨����ƶ��������ʱ, �����ShowLocation
  event=ior(MOUSE$MOVE,MOUSE$LBUTTONDOWN)
  result=RegisterMouseEvent(10, event, ShowLocation)
  ! �趨����Ҽ�����ʱ, �����MouseClearScreen
  event=MOUSE$RBUTTONDOWN
  result=RegisterMouseEvent(10, event, MouseClearScreen )
  ! �ѳ������ȴ���������״̬
  do while(.true.)
    result=WaitOnMouseEvent( MOUSE$MOVE .or. MOUSE$LBUTTONDOWN .or.&
  	MOUSE$RBUTTONDOWN, state, x, y )
  end do
end program
