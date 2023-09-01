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

program main
  use STACK_UTILITY
  implicit none
  integer, parameter :: N=5
  integer :: A(N)=(/ 1,2,3,4,5 /)
  integer i, stat, value

  write(*,"('Source=>',5I3)") A
  do i=1,N
    call push(A(i))
  end do

  do i=1,N
    stat = pop(value)
	write(*,"(I3)",advance="no") value
  end do
  write(*,*)
  
  stop
end program
