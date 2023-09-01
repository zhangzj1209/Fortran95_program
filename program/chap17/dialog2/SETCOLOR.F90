!
! 对话窗的示范之二
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
! 记录全局变量
!
module Global
implicit none
  integer, save :: red=0
  integer, save :: green=0
  integer, save :: blue=0
end module
!
! 自定义菜单
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
! 处理Open
!
subroutine FileOpen(check)
use Global
implicit none
  logical :: check
  check=.true.
  ! 打开一个空白字符的文件, 会出现一个文件选择的对话窗来给使用者选择文件
  open(unit=10, file=' ')
  read(10,*) red
  read(10,*) green
  read(10,*) blue
  close(10)
  call DrawObject()
  return
end subroutine
!
! 处理Save
!
subroutine FileSave(check)
use Global
implicit none
  logical :: check
  check=.true.
  ! 使用文件选择的对话窗
  open(unit=20, file=' ')
  write(20,*) red
  write(20,*) green
  write(20,*) blue
  close(20)
  return
end subroutine
!
! 按下SetColor时会执行这个函数
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
  result=DlgInit(IDD_SETCOLOR, dlg) ! 初始对话窗
  ! 设定滚动条可以滚动的范围
  result=DlgSet( dlg, IDC_SCROLLBAR1, 256, dlg_range ) 
  result=DlgSet( dlg, IDC_SCROLLBAR2, 256, dlg_range )
  result=DlgSet( dlg, IDC_SCROLLBAR3, 256, dlg_range )
  ! 设定滚动条目前的位置
  result=DlgSet( dlg, IDC_SCROLLBAR1, red, dlg_position )
  result=DlgSet( dlg, IDC_SCROLLBAR2, green, dlg_position )
  result=DlgSet( dlg, IDC_SCROLLBAR3, blue, dlg_position )
! 上面有比较奇怪的用法, dlg_range代表现在是要设定滚动条控件的范围值
! dlg_position代表是要设定滚动条控件的位置. 读者可以想像当类型为dialog
! 的dlg被声明时, 编译器会自动帮我们声明出dlg_range, dlg_position等等
! 的变量并设定好它们的数值.

  ! 写出红,绿,蓝三色光的强度数值
  write(output,"(I3)") red
  result=DlgSet( dlg, IDC_VALUE_RED, output )
  write(output,"(I3)") green
  result=DlgSet( dlg, IDC_VALUE_GREEN, output )
  write(output,"(I3)") blue
  result=DlgSet( dlg, IDC_VALUE_BLUE, output )
  ! 设定拉动滚动条时会执行的函数
  result=DlgSetSub( dlg, IDC_SCROLLBAR1, ShowColor )
  result=DlgSetSub( dlg, IDC_SCROLLBAR2, ShowColor )
  result=DlgSetSub( dlg, IDC_SCROLLBAR3, ShowColor )
  ! 弹出对话窗
  result=DlgModal(dlg)

  return
end subroutine
!
! 取出三色光的设定并绘出一个实心方形
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
  ! 取出滚动条的位置
  result=DlgGet( dlg, IDC_SCROLLBAR1, red, dlg_position )
  result=DlgGet( dlg, IDC_SCROLLBAR2, green, dlg_position )
  result=DlgGet( dlg, IDC_SCROLLBAR3, blue, dlg_position )
  ! 因为颜色的变化范围是0-255, 而滚动条的范围是1-256, 所以要减1
  red=red-1
  green=green-1
  blue=blue-1

  select case(id)
  case(IDC_SCROLLBAR1)	! 第一个滚动条设定红色光强度
    write(output,"(I3)") red
    result=DlgSet( dlg, IDC_VALUE_RED, output )
  case(IDC_SCROLLBAR2)  ! 第二个滚动条设定绿色光强度
    write(output,"(I3)") green
    result=DlgSet( dlg, IDC_VALUE_GREEN, output )
  case(IDC_SCROLLBAR3)  ! 第三个滚动条设定蓝色光强度
    write(output,"(I3)") blue
    result=DlgSet( dlg, IDC_VALUE_BLUE, output )
  end select

  call DrawObject()

  return
end subroutine
!
! 以设定的颜色画出实心方形
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
