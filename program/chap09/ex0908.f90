module typedef
  type player
    character(len=80) :: name
    real weight, height
	real score
  end type
end module

program ex0908
  use typedef
  implicit none
  character(len=20)  :: filename = "ex0908dat.txt"
  integer, parameter :: fileid = 20
  logical :: alive   ! ����ļ��Ƿ����
  type(player) :: p  ! ��ȡѡ������
  character(len=10)  :: title ! ��ȡ������Ŀ
  real tempnum       ! ��ȡ����
  logical, external :: GetNextPlayer ! �ҳ���һλ��Ա���ݵĺ���
  integer i          ! ѭ��������
  integer error      ! ����ļ���ȡ�Ƿ�����

  inquire(file=filename, exist=alive)
  if ( .not. alive ) then ! �ļ������ھͽ�������
    write(*,*) trim(filename)," doesn't exist."
	stop
  end if
  
  open(unit=fileid, file=filename)
  do while(.true.)
    if ( GetNextPlayer(fileid, p%name) ) then
	  do i=1,3
   	    read(fileid, "(A4,1X,F)", iostat=error ) title, tempnum
		if ( error/=0 ) then
		  write(*,*) "�ļ���ȡ����"
		  stop
		end if
	    ! Ҫ����ÿһ����ǰ���������������ж϶������ʲô����
	    select case(title)
	    case("���")
	      p%height = tempnum
	    case("����")
	      p%weight = tempnum
	    case("�÷�")
	      p%score = tempnum
		case default
		  write(*,*) "���ֲ���ȷ������"
		  stop
        end select
	  end do
	else
	  exit  
	end if

	if ( p%score > 20.0 ) then ! ӡ���÷ָ���20�ֵ�ѡ������
	  write(*,"('����:',A8/,'���:',F5.1,' ����:',F5.1,' �÷�:',F4.1)") p
	end if
  end do

  stop
end
! GetNextPlayer��������ļ����ҳ���һλ��Ա������λ��
! ����ļ��л���������Ҫ��ȡ, ����.true.
! ����ļ���û��������Ҫ��ȡ, ����.false.
logical function GetNextPlayer(fileid, name)
  implicit none
  integer, intent(in) :: fileid
  character(len=*), intent(out) :: name
  character(len=80) title
  integer  error

  do while(.true.)
    read(fileid,"(A80)",iostat=error) title
	
	if ( error/=0 ) then ! �ļ����Ѿ�û��������
	  GetNextPlayer = .false.
	  return
	end if

	if ( title(1:4)=="����" ) then
	  name = title(6:)
	  GetNextPlayer = .true.
	  return
	end if
  end do

  return
end function