module STACK_UTILITY
  implicit none
  private
  integer, parameter :: TOP=50
  integer, save :: current = 0
  integer, save :: stack(TOP)
  public push, pop
contains
  ! 把数据放入堆栈中  
  subroutine push(value)
    integer value
	if ( current>TOP ) then ! 超过容量
	  write(*,*) "Stack full."
	  return
	end if
	current = current+1
	stack(current)=value
  end subroutine
  ! 从堆栈中取出数据
  integer function pop(value)
    integer value
    if ( current<=0 ) then ! 已经没有东西可以拿了
	  pop=1
	  return
	end if
	value = stack(current)
	current = current-1
	pop = 0
  end function

end module
!
! 骑士走棋盘的范例
! By Perng 1997/9/1
program knight
  use STACK_UTILITY
  implicit none
  integer, parameter :: n=5 ! 定义棋盘有多大
  integer board(n,n)      ! 记录棋盘的状态
  integer, parameter :: total = n*n ! 棋盘有几个格子要走
  integer x_move(8)       ! 骑士有8 种移动的步法
  integer y_move(8)       !
  integer x_pos,y_pos     ! 骑士目前在棋盘上的位置
  integer x_new,y_new     ! 暂时算出的下一落脚处
  integer move            ! 所要使用的步法
  integer step            ! 完成了多少步
  integer sol             ! 计算总共有几种走法可以走完
  integer error
  data x_move /1,2, 2, 1,-1,-2,-2,-1/
  data y_move /2,1,-1,-2,-2,-1, 1, 2/
  data board / total*0 /  ! 全设为0 ,代表都还没走过
  data sol /0/            ! 解的数目先设为0
        
! 假设从棋盘的正中央开始走
  x_pos=(n+1)/2           
  y_pos=(n+1)/2           
  step=1
  board(x_pos,y_pos)=step ! 第一步在此

  move=1        ! 先试第一种走法
  do while(.true.)
    do while( move <= 8 )     ! 因为只有8种走法
      ! 算出下一步
      x_new=x_pos+x_move(move)
      y_new=y_pos+y_move(move)
      ! 不能超出棋盘
      if ( x_new < 1  .or.  x_new > n ) then
        move=move+1
        cycle
      end if
      if ( y_new < 1  .or.  y_new > n ) then
        move=move+1
        cycle
      end if
      ! 当这个下一步的位置是空位时, 才可让骑士进入
      if ( board(x_new,y_new) == 0 ) then
        x_pos=x_new
        y_pos=y_new
        step=step+1 
        board(x_pos,y_pos)=step ! 成功的踏出下一步
        call push(move)   ! 把目前的步法送入堆栈
        move=1            ! 下一步再从第一种步法开始试
      else
        move=move+1             ! 地点早已来过, 换个新的步法
      end if
    end do
    ! setp=total=n*n 时代表全部都踏遍了
    if ( step == total ) then
      sol=sol+1
      write(*,"('第',I3,'个解')") sol
      call show_board(board,n)
    end if
    ! 往回退一步再向下试
    step=step-1
    ! step<=0 代表无路可退了, 跳出循环
    if ( step <= 0 ) exit 
    board(x_pos,y_pos)=0  ! 向回退, 所以这个地方要设成没来过
    error = pop(move)      ! 从堆栈中取出上一个步法
	if ( error/=0 ) then
	  write(*,*) "Stack empry"
	  stop
	end if
    ! 向回退一步
    x_pos=x_pos-x_move(move)
    y_pos=y_pos-y_move(move)
    ! 换一个新的步法来试试
    move=move+1
  end do
  write(*,"('编共有',I3,'种解法')") sol
  stop
end program
!
! 显示棋盘状态的子程序
!
subroutine show_board(board,n)
  implicit none
  integer n
  integer board(n,n)
  integer i,j
  character*(20) :: for = '(??(1x,i3))'
! 用字符串来设定输出格式
  write( for(2:3), '(i2)' ) n
  do i=n,1,-1
    write( *, fmt=for ) board(:,i)
  end do
  return
end
