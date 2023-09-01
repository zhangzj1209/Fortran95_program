module NumLink                          
  implicit none
  integer, parameter :: N=10    
  ! 声明制作链表的类型
  type :: link
    integer :: num                      ! 储存数据组
    type(link), pointer :: next         ! 指向下一个环结的指针
  end type link

  type(link), target  :: linking(N) ! 储存hashing后的数据
  type(link), pointer :: proc      ! 暂时使用的指针

  integer :: Source(N) = (/ 21,53,71,19,61,81,3,17,44,93 /)

contains
  subroutine InitLink()
    integer i
	do i=1,N
	  linking(i)%num = 0
	  nullify(linking(i)%next)
	end do
  end subroutine

! hash函数
  integer function hash(KEY)
    integer KEY
    hash = KEY/10+1
	return
  end function
!
! 把数字经过散列处理后放入链表的子程序
!
  subroutine Insert(KEY, INFO)
    integer :: KEY, INFO ! 所要插入的数字及在Source中的位置
    integer :: L         ! hashing 后的结果

    L=hash(KEY)        
    proc=>linking(L) ! 把proc指向类型linking中hash(L)的位置

    ! 移动到链表中的最后一个位置
    do while( proc%num /= 0 )
      proc=>proc%next
    end do

    proc%num = INFO
    !配置内存空间给proc%next
    allocate(proc%next)
	proc=>proc%next
    proc%num = 0
	nullify(proc%next)
  end subroutine Insert 
!
! 在链表中查找数据的子程序
!
  subroutine Hash_Search( KEY )
    integer :: KEY  ! 要查找的值
    integer :: L    ! 计算hashing后的值

    L=hash(KEY)
    proc=>linking(L)        ! 把proc指向类型linking中hash(L)的位置

    ! 在这一个链表中一直向下顺序查找到找到为止
    do while( .true. )
	  if ( proc%num==0 ) then
	    write(*,*) "Not found."
		return
	  end if
	  if ( Source(proc%num)==KEY ) then
	    write(*,"('Source(',I2,' )=',I3)") proc%num, KEY
		return
	  end if
	  if ( associated(proc%next) ) proc=>proc%next
    end do
    return
  end subroutine Hash_Search
!
! 输出链表中数据的子程序
!
  subroutine OutputLink()
    integer :: i 
    do i=1,N
      proc=>linking(i)
      write(*,"(1X,I2,':')", advance="NO") i
      do while( associated(proc%next) )
        write(*,"('->',I2)", advance="NO" ) Source(proc%num)
        proc=>proc%next
      end do
      write(*,*)
    end do
  end subroutine OutputLink

end module NumLink
!       
!    哈稀查找法范例
!                  
program HASHING_SEARCH_DEMO
use NumLink
implicit none
  integer :: KEY  ! 记录所要找的值
  integer :: I    ! 循环记数器

  call InitLink()
  write(*,"('Source=>',10I3)") Source
  do I=1,N
    call Insert( Source(I), I )
  end do
  write(*,*) 'Link List=>'
  call OutputLink()
! 读入要找的值
  write(*,*) 'Input KEY:'
  read (*,*) KEY
! 调用顺序查找的子程序
  call Hash_Search(KEY)
  stop
end program HASHING_SEARCH_DEMO
