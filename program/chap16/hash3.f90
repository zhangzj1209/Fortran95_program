module NumLink                          
  implicit none
  integer, parameter :: N=10    
  ! �����������������
  type :: link
    integer :: num                      ! ����������
    type(link), pointer :: next         ! ָ����һ�������ָ��
  end type link

  type(link), target  :: linking(N) ! ����hashing�������
  type(link), pointer :: proc      ! ��ʱʹ�õ�ָ��

  integer :: Source(N) = (/ 21,53,71,19,61,81,3,17,44,93 /)

contains
  subroutine InitLink()
    integer i
	do i=1,N
	  linking(i)%num = 0
	  nullify(linking(i)%next)
	end do
  end subroutine

! hash����
  integer function hash(KEY)
    integer KEY
    hash = KEY/10+1
	return
  end function
!
! �����־���ɢ�д�������������ӳ���
!
  subroutine Insert(KEY, INFO)
    integer :: KEY, INFO ! ��Ҫ��������ּ���Source�е�λ��
    integer :: L         ! hashing ��Ľ��

    L=hash(KEY)        
    proc=>linking(L) ! ��procָ������linking��hash(L)��λ��

    ! �ƶ��������е����һ��λ��
    do while( proc%num /= 0 )
      proc=>proc%next
    end do

    proc%num = INFO
    !�����ڴ�ռ��proc%next
    allocate(proc%next)
	proc=>proc%next
    proc%num = 0
	nullify(proc%next)
  end subroutine Insert 
!
! �������в������ݵ��ӳ���
!
  subroutine Hash_Search( KEY )
    integer :: KEY  ! Ҫ���ҵ�ֵ
    integer :: L    ! ����hashing���ֵ

    L=hash(KEY)
    proc=>linking(L)        ! ��procָ������linking��hash(L)��λ��

    ! ����һ��������һֱ����˳����ҵ��ҵ�Ϊֹ
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
! ������������ݵ��ӳ���
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
!    ��ϡ���ҷ�����
!                  
program HASHING_SEARCH_DEMO
use NumLink
implicit none
  integer :: KEY  ! ��¼��Ҫ�ҵ�ֵ
  integer :: I    ! ѭ��������

  call InitLink()
  write(*,"('Source=>',10I3)") Source
  do I=1,N
    call Insert( Source(I), I )
  end do
  write(*,*) 'Link List=>'
  call OutputLink()
! ����Ҫ�ҵ�ֵ
  write(*,*) 'Input KEY:'
  read (*,*) KEY
! ����˳����ҵ��ӳ���
  call Hash_Search(KEY)
  stop
end program HASHING_SEARCH_DEMO
