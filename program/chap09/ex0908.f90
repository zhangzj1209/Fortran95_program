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
  logical :: alive   ! 检查文件是否存在
  type(player) :: p  ! 读取选手数据
  character(len=10)  :: title ! 读取数据项目
  real tempnum       ! 读取数据
  logical, external :: GetNextPlayer ! 找出下一位球员数据的函数
  integer i          ! 循环记数器
  integer error      ! 检查文件读取是否正常

  inquire(file=filename, exist=alive)
  if ( .not. alive ) then ! 文件不存在就结束程序
    write(*,*) trim(filename)," doesn't exist."
	stop
  end if
  
  open(unit=fileid, file=filename)
  do while(.true.)
    if ( GetNextPlayer(fileid, p%name) ) then
	  do i=1,3
   	    read(fileid, "(A4,1X,F)", iostat=error ) title, tempnum
		if ( error/=0 ) then
		  write(*,*) "文件读取错误"
		  stop
		end if
	    ! 要经由每一行最前面两个中文字来判断读入的是什么数据
	    select case(title)
	    case("身高")
	      p%height = tempnum
	    case("体重")
	      p%weight = tempnum
	    case("得分")
	      p%score = tempnum
		case default
		  write(*,*) "出现不正确的数据"
		  stop
        end select
	  end do
	else
	  exit  
	end if

	if ( p%score > 20.0 ) then ! 印出得分高于20分的选手数据
	  write(*,"('姓名:',A8/,'身高:',F5.1,' 体重:',F5.1,' 得分:',F4.1)") p
	end if
  end do

  stop
end
! GetNextPlayer函数会从文件中找出下一位球员的数据位置
! 如果文件中还有数据需要读取, 传回.true.
! 如果文件中没有数据需要读取, 传回.false.
logical function GetNextPlayer(fileid, name)
  implicit none
  integer, intent(in) :: fileid
  character(len=*), intent(out) :: name
  character(len=80) title
  integer  error

  do while(.true.)
    read(fileid,"(A80)",iostat=error) title
	
	if ( error/=0 ) then ! 文件中已经没有数据了
	  GetNextPlayer = .false.
	  return
	end if

	if ( title(1:4)=="姓名" ) then
	  name = title(6:)
	  GetNextPlayer = .true.
	  return
	end if
  end do

  return
end function