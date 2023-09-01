!
! 二元树排序范例
!
module typedef
  implicit none
  type :: data
    integer :: n       ! 存放的数据	
    integer :: repeat  ! 数据重覆的次数
    type(data), pointer :: left  ! 左枝
    type(data), pointer :: right ! 右枝
  end type data
end module typedef

module bin_tree
  use typedef
  implicit none
  private
  type(data), pointer :: tree, action  
  integer, save :: numbers = 0
  public add, TraceTree
contains
!
! 新加入一条数据
!
subroutine add( n )
  implicit none
  integer, intent(in) :: n
  integer :: err
  type(data), pointer :: new
  integer :: level
  level=1
  numbers=numbers+1
  write(*, '(1x,a5,i4,a8)' ) "Get :",numbers," numbers"
  ! 配置一块新的空间
  allocate( new, stat=err )
  if ( err/=0 ) then
    write(*,*) "Out of memory!"
    stop
  end if

  write(*,"('root ')", advance="NO")
  ! 设定数据
  new%repeat=1
  new%n=n
  nullify( new%right, new%left )
  ! 如果是第一条数据
  if ( numbers==1 ) then
    action=>new
    tree=>new
    write(*,"(': new')")
    return
  end if
  
  action=>tree

  do while( .true. )
    level=level+1
	! 数据大于目前枝干的数值时
    if ( n>action%n ) then
      if ( associated( action%right ) ) then
        action=>action%right  ! 再向右去寻找立身处
		write(*, "('->R')", advance="NO")
      else
        action%right=>new  ! 建立新的右枝 
        action=>new
		write(*, "('->R: new')")
        exit
      end if
    ! 数据小于目前枝干的数值时
    else if ( n<action%n ) then
      if ( associated( action%left ) ) then
        action=>action%left   ! 再向左去寻找立身处
		write(*, "('->L')", advance="NO")
      else
        action%left=>new  ! 建立新的左枝
        action=>new
		write(*, "('->L: new')")
        exit
      end if
   ! 数据等于目前枝干的数值时
    else if ( n==action%n ) then
      action%repeat=action%repeat+1  ! 把重覆的数目加1
      deallocate(new)  ! 可以不需要这个新的空间
      write(*, "(': Repeat')")
      return
    end if
  end do
  return
end subroutine add
!
! 显示排序的数据
!
subroutine TraceTree()
  implicit none
  call show_tree( tree )
  return
end subroutine TraceTree
!
! 排序数据的子程序
!
recursive subroutine show_tree( show )
  implicit none
  type(data), pointer :: show

  if ( associated( show ) ) then
     call show_tree( show%left )   ! 先取出左枝的数据
     call show_data( show )        ! 再取出目前位置的数据
     call show_tree( show%right )  ! 最后才取右枝的数据
  end if

  return
end subroutine show_tree
!
! 写出这个枝干所储存的数据
!
subroutine show_data( show )
  implicit none
  type(data), pointer :: show
  integer :: i

  do i=1,show%repeat
    write(*,*) show%n
  end do

  return
end subroutine show_data

end module bin_tree
!
! 主程序
!
program main
  use bin_tree
  implicit none
  integer num
  
  do while(.true.)
    write(*,*) "请输入整数, 输入0代表结束"
    read(*,*) num
	if ( num==0 ) exit
    call add(num)
  end do
  call TraceTree()

  stop
end program main
