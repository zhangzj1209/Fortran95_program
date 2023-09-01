module linklist
  implicit none
  type :: datalink
    integer :: i
    type(datalink), pointer :: prev ! ָ����һ������
    type(datalink), pointer :: next ! ָ����һ������
  end type datalink

contains

subroutine outputlist( list )
  implicit none
  type(datalink), pointer :: list, p
  p=>list
  do while( associated(p) )
    write(*,*) p%i
    p=>p%next
  end do
  return   
end subroutine
! �ѹ����ָ��������λ���ͷ�
subroutine delitem( item )
  implicit none
  type(datalink), pointer :: item
  type(datalink), pointer :: prev, next

  prev=>item%prev  ! ��¼��item��һ�����ݵ�λ��
  next=>item%next  ! ��¼��item��һ�����ݵ�λ��
  deallocate(item) ! �ͷ�item��ռ���ڴ�
  ! �����趨prev%next, ԭ��prev%next=>item, ����item�Ѿ�ɾ����
  if ( associated(prev) ) prev%next=>next
  ! �����趨next%prev, ԭ��next%prev=>item, ����item�Ѿ�ɾ����
  if ( associated(next) ) next%prev=>prev ! 
  item=>next

  return
end subroutine
! ��posָ����ָ��������λ���в���item
! after=.true.ʱ, item����pos֮��
! after=.false.ʱ, item����pos֮ǰ
subroutine insitem( pos, item, after )
  implicit none
  type(datalink), pointer :: pos, item
  logical :: after
  if ( after ) then
  ! item����pos�ĺ���
    item%next=>pos%next
	item%prev=>pos
	if ( associated(pos%next) ) then
      pos%next%prev=>item
    end if
    pos%next=>item
  else
  ! item����pos��ǰ��
    item%next=>pos
	item%prev=>pos%prev
	if ( associated(pos%prev) ) then
	  pos%prev%next=>item
	end if
    pos%prev=>item
  end if
  return
end subroutine

end module

program ex1015
  use linklist
  implicit none
  type(datalink), pointer :: head
  type(datalink), pointer :: item, p
  integer, parameter :: s=5
  integer :: i,n,error
  
  allocate(head)
  head = datalink(1, null(), null() )
  ! ��������
  p=>head
  do i=2,s
    allocate( p%next, stat=error )
	if ( error/=0 ) then
	  write(*,*) "Out of memory!"
	  stop
	end if
	p%next=datalink(i, p, null())
	p=>p%next
  end do
  
  write(*,*) "�õ���3������"
  call delitem(head%next%next)
  call outputlist(head)

  write(*,*) "�����µĵ�3������"
  allocate(item)
  item%i=30
  call insitem(head%next,item,.true.)
  call outputlist(head)

stop
end program

