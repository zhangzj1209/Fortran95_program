!
! �Ի�����ʾ��֮��
! By Perng 1997/09/26
program main
use DFLIB
implicit none
  integer :: i,ix,iy

  call ClearScreen($GCLEARSCREEN)
  do while(.true.)
    i = waitonmouseevent(MOUSE$LBUTTONDOWN, i, ix, iy)
  end do
end program
!
! ��¼ȫ�ֱ���
!
module Global
implicit none
  integer, save :: red=0
  integer, save :: green=0
  integer, save :: blue=0
end module
!
! �Զ���˵�
!
logical(kind=4) function InitialSettings()
use DFLIB
implicit none
  logical(kind=4) result
  external FileOpen,FileSave
  external SetColorDialog

  result=AppendMenuQQ(1,$MENUENABLED,'File'C,NUL)
  result=AppendMenuQQ(1,$MENUENABLED,'&Open'C,FileOpen)
  result=AppendMenuQQ(1,$MENUENABLED,'&Save'C,FileSave)
  result=AppendMenuQQ(1,$MENUENABLED,'&Exit'C,WINEXIT)

  result=AppendMenuQQ(2,$MENUENABLED,'&SetColor',SetColorDialog)
  
  InitialSettings=result
  return
end function
!
! ����Open
!
subroutine FileOpen(check)
use Global
implicit none
  logical :: check
  check=.true.
  ! ��һ���հ��ַ����ļ�, �����һ���ļ�ѡ��ĶԻ�������ʹ����ѡ���ļ�
  open(unit=10, file=' ')
  read(10,*) red
  read(10,*) green
  read(10,*) blue
  close(10)
  call DrawObject()
  return
end subroutine
!
! ����Save
!
subroutine FileSave(check)
use Global
implicit none
  logical :: check
  check=.true.
  ! ʹ���ļ�ѡ��ĶԻ���
  open(unit=20, file=' ')
  write(20,*) red
  write(20,*) green
  write(20,*) blue
  close(20)
  return
end subroutine
!
! ����SetColorʱ��ִ���������
!
subroutine SetColorDialog(check)
use Global
use DFLIB
use dialogm
implicit none
  logical :: check
  integer :: result
  include 'resource.fd'
  type(dialog) :: dlg
  external ShowColor
  character(len=10) output

  check=.true.
  result=DlgInit(IDD_SETCOLOR, dlg) ! ��ʼ�Ի���
  ! �趨���������Թ����ķ�Χ
  result=DlgSet( dlg, IDC_SCROLLBAR1, 256, dlg_range ) 
  result=DlgSet( dlg, IDC_SCROLLBAR2, 256, dlg_range )
  result=DlgSet( dlg, IDC_SCROLLBAR3, 256, dlg_range )
  ! �趨������Ŀǰ��λ��
  result=DlgSet( dlg, IDC_SCROLLBAR1, red, dlg_position )
  result=DlgSet( dlg, IDC_SCROLLBAR2, green, dlg_position )
  result=DlgSet( dlg, IDC_SCROLLBAR3, blue, dlg_position )
! �����бȽ���ֵ��÷�, dlg_range����������Ҫ�趨�������ؼ��ķ�Χֵ
! dlg_position������Ҫ�趨�������ؼ���λ��. ���߿�����������Ϊdialog
! ��dlg������ʱ, ���������Զ�������������dlg_range, dlg_position�ȵ�
! �ı������趨�����ǵ���ֵ.

  ! д����,��,����ɫ���ǿ����ֵ
  write(output,"(I3)") red
  result=DlgSet( dlg, IDC_VALUE_RED, output )
  write(output,"(I3)") green
  result=DlgSet( dlg, IDC_VALUE_GREEN, output )
  write(output,"(I3)") blue
  result=DlgSet( dlg, IDC_VALUE_BLUE, output )
  ! �趨����������ʱ��ִ�еĺ���
  result=DlgSetSub( dlg, IDC_SCROLLBAR1, ShowColor )
  result=DlgSetSub( dlg, IDC_SCROLLBAR2, ShowColor )
  result=DlgSetSub( dlg, IDC_SCROLLBAR3, ShowColor )
  ! �����Ի���
  result=DlgModal(dlg)

  return
end subroutine
!
! ȡ����ɫ����趨�����һ��ʵ�ķ���
!
subroutine ShowColor(dlg,id,callbacktype)
use Global
use DFLIB
use dialogm
implicit none
  type(dialog) :: dlg
  integer :: id, callbacktype
  integer :: result
  character(len=10) :: output
  include 'resource.fd'
  ! ȡ����������λ��
  result=DlgGet( dlg, IDC_SCROLLBAR1, red, dlg_position )
  result=DlgGet( dlg, IDC_SCROLLBAR2, green, dlg_position )
  result=DlgGet( dlg, IDC_SCROLLBAR3, blue, dlg_position )
  ! ��Ϊ��ɫ�ı仯��Χ��0-255, ���������ķ�Χ��1-256, ����Ҫ��1
  red=red-1
  green=green-1
  blue=blue-1

  select case(id)
  case(IDC_SCROLLBAR1)	! ��һ���������趨��ɫ��ǿ��
    write(output,"(I3)") red
    result=DlgSet( dlg, IDC_VALUE_RED, output )
  case(IDC_SCROLLBAR2)  ! �ڶ����������趨��ɫ��ǿ��
    write(output,"(I3)") green
    result=DlgSet( dlg, IDC_VALUE_GREEN, output )
  case(IDC_SCROLLBAR3)  ! �������������趨��ɫ��ǿ��
    write(output,"(I3)") blue
    result=DlgSet( dlg, IDC_VALUE_BLUE, output )
  end select

  call DrawObject()

  return
end subroutine
!
! ���趨����ɫ����ʵ�ķ���
!
subroutine DrawObject()
use Global
use DFLIB
implicit none
  integer :: result
  integer :: color

  color=RGBToInteger(red,green,blue)
  result=SetColorRGB(color)
  result=Rectangle($GFILLINTERIOR,10,10,50,50)
  
  return
end subroutine 