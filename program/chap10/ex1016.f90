module linklist
  type student
    integer :: num
	integer :: Chinese, English, Math, Science, Social
  end type
  
  type datalink
    type(student) :: item
    type(datalink), pointer :: next
  end type

contains

  function SearchList(num, head)
    implicit none
	integer :: num
	type(datalink), pointer :: head, p
	type(datalink), pointer :: SearchList

	p=>head
	nullify(SearchList)
	do while( associated(p) )
	  if ( p%item%num==num ) then
	    SearchList => p
		return
	  end if
	  p=>p%next
	end do
	return
  end function

end module linklist

program ex1016
  use linklist
  implicit none
  character(len=20) :: filename
  character(len=80) :: tempstr
  type(datalink), pointer :: head
  type(datalink), pointer :: p
  integer i,error,size

  write(*,*) "filename:"
  read(*,*) filename
  open(10, file=filename, status="old", iostat=error)
  if ( error/=0 ) then
    write(*,*) "Open file fail!"
	stop
  end if
  
  allocate(head)
  nullify(head%next)
  p=>head
  size=0
  read(10, "(A80)") tempstr ! �����һ���ַ���, ����Ҫ������
  ! ����ÿһλѧ���ĳɼ�
  do while(.true.)
    read(10,fmt=*, iostat=error) p%item
	if ( error/=0 ) exit
	size=size+1
	allocate(p%next, stat=error) ! ������һ������
	if ( error/=0 ) then
	  write(*,*) "Out of memory!"
	  stop
	end if
	p=>p%next ! �ƶ����������һ������
	nullify(p%next)
  end do
  write(*,"('�ܹ���',I3,'λѧ��')") size

  do while(.true.)
    write(*,*) "Ҫ��ѯ����ͬѧ�ĳɼ�?"
	read (*,*) i
	if ( i<1 .or. i>size ) exit ! ���벻���������
	p=>SearchList(i,head)
	if ( associated(p) ) then
      write(*,"(5(A6,I3))") "����",p%item%Chinese,&
	                        "Ӣ��",p%item%English,&
				            "��ѧ",p%item%Math,&
				            "��Ȼ",p%item%Science,&
				            "���",p%item%Social
	else
	  exit ! �Ҳ�������, �뿪ѭ��
	end if
  end do
  write(*,"('����',I3,'������, �������.')") i
  
  stop
end program