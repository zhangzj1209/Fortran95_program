module STACK_UTILITY
  implicit none
  private
  integer, parameter :: TOP=50
  integer, save :: current = 0
  integer, save :: stack(TOP)
  public push, pop
contains
  ! �����ݷ����ջ��  
  subroutine push(value)
    integer value
	if ( current>TOP ) then ! ��������
	  write(*,*) "Stack full."
	  return
	end if
	current = current+1
	stack(current)=value
  end subroutine
  ! �Ӷ�ջ��ȡ������
  integer function pop(value)
    integer value
    if ( current<=0 ) then ! �Ѿ�û�ж�����������
	  pop=1
	  return
	end if
	value = stack(current)
	current = current-1
	pop = 0
  end function

end module
!
! ��ʿ�����̵ķ���
! By Perng 1997/9/1
program knight
  use STACK_UTILITY
  implicit none
  integer, parameter :: n=5 ! ���������ж��
  integer board(n,n)      ! ��¼���̵�״̬
  integer, parameter :: total = n*n ! �����м�������Ҫ��
  integer x_move(8)       ! ��ʿ��8 ���ƶ��Ĳ���
  integer y_move(8)       !
  integer x_pos,y_pos     ! ��ʿĿǰ�������ϵ�λ��
  integer x_new,y_new     ! ��ʱ�������һ��Ŵ�
  integer move            ! ��Ҫʹ�õĲ���
  integer step            ! ����˶��ٲ�
  integer sol             ! �����ܹ��м����߷���������
  integer error
  data x_move /1,2, 2, 1,-1,-2,-2,-1/
  data y_move /2,1,-1,-2,-2,-1, 1, 2/
  data board / total*0 /  ! ȫ��Ϊ0 ,������û�߹�
  data sol /0/            ! �����Ŀ����Ϊ0
        
! ��������̵������뿪ʼ��
  x_pos=(n+1)/2           
  y_pos=(n+1)/2           
  step=1
  board(x_pos,y_pos)=step ! ��һ���ڴ�

  move=1        ! ���Ե�һ���߷�
  do while(.true.)
    do while( move <= 8 )     ! ��Ϊֻ��8���߷�
      ! �����һ��
      x_new=x_pos+x_move(move)
      y_new=y_pos+y_move(move)
      ! ���ܳ�������
      if ( x_new < 1  .or.  x_new > n ) then
        move=move+1
        cycle
      end if
      if ( y_new < 1  .or.  y_new > n ) then
        move=move+1
        cycle
      end if
      ! �������һ����λ���ǿ�λʱ, �ſ�����ʿ����
      if ( board(x_new,y_new) == 0 ) then
        x_pos=x_new
        y_pos=y_new
        step=step+1 
        board(x_pos,y_pos)=step ! �ɹ���̤����һ��
        call push(move)   ! ��Ŀǰ�Ĳ��������ջ
        move=1            ! ��һ���ٴӵ�һ�ֲ�����ʼ��
      else
        move=move+1             ! �ص���������, �����µĲ���
      end if
    end do
    ! setp=total=n*n ʱ����ȫ����̤����
    if ( step == total ) then
      sol=sol+1
      write(*,"('��',I3,'����')") sol
      call show_board(board,n)
    end if
    ! ������һ����������
    step=step-1
    ! step<=0 ������·������, ����ѭ��
    if ( step <= 0 ) exit 
    board(x_pos,y_pos)=0  ! �����, ��������ط�Ҫ���û����
    error = pop(move)      ! �Ӷ�ջ��ȡ����һ������
	if ( error/=0 ) then
	  write(*,*) "Stack empry"
	  stop
	end if
    ! �����һ��
    x_pos=x_pos-x_move(move)
    y_pos=y_pos-y_move(move)
    ! ��һ���µĲ���������
    move=move+1
  end do
  write(*,"('�๲��',I3,'�ֽⷨ')") sol
  stop
end program
!
! ��ʾ����״̬���ӳ���
!
subroutine show_board(board,n)
  implicit none
  integer n
  integer board(n,n)
  integer i,j
  character*(20) :: for = '(??(1x,i3))'
! ���ַ������趨�����ʽ
  write( for(2:3), '(i2)' ) n
  do i=n,1,-1
    write( *, fmt=for ) board(:,i)
  end do
  return
end
