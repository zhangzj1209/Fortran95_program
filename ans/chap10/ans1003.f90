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
  type(student), allocatable :: s(:)
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
  read(10, "(A80)") tempstr ! 读入第一行字符串, 不需要处理它
  ! 读入每一位学生的成绩
  do while(.true.)
    read(10,fmt=*, iostat=error) p%item
	if ( error/=0 ) exit
	size=size+1
	allocate(p%next, stat=error) ! 新增下一个数据
	if ( error/=0 ) then
	  write(*,*) "Out of memory!"
	  stop
	end if
	p=>p%next ! 移动到链表的下一个数据
	nullify(p%next)
  end do
  
  write(*,"('总共有',I3,'位学生')") size
  allocate( s(size) )
  p=>head
  do i=1,size
    s(i)=p%item
	p=>p%next  
  end do
  
  do while(.true.)
    write(*,*) "要查询几号同学的成绩?"
	read (*,*) i
	if ( i<1 .or. i>size ) exit ! 输入不合理的座号
    write(*,"(5(A6,I3))") "中文",s(i)%Chinese,&
	                      "英文",s(i)%English,&
				          "数学",s(i)%Math,&
				          "自然",s(i)%Science,&
				          "社会",s(i)%Social
  end do
  write(*,"('座号',I3,'不存在, 程序结束.')") i
  
  stop
end program