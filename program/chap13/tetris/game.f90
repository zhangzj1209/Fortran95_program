module GAME_DATA
  use global
  implicit none
  integer, parameter :: SX = 240, SY = 440
  integer, parameter :: BoundX = 20, BoundY = 20
  integer, parameter :: BoardWidth = SX-BoundX*2
  integer, parameter :: BoardHeight = SY-BoundY*2
  integer, parameter :: BlocksX = 10, BlocksY = 25
  integer, parameter :: GridSize = 1
  integer, parameter :: BX = BoardWidth/BlocksX
  integer, parameter :: BY = BoardHeight/BlocksY
  integer, save :: Board(BlocksX, BlocksY)
  integer, parameter :: Mode_Playing = 1, Mode_End = 2
  integer, parameter :: Block_HitBlock = 1, Block_HitWall = 2, &
                        Block_HitBottom = 3, Block_Free = 4
  integer, save :: GameMode, Speed
  integer, parameter :: SpeedInc = 3, SpeedLimit = 10, SpeedInit = 300
  integer, save :: Score = 0
  type(block), pointer :: CurrentBlock
  integer, save :: LastTime, ThisTime, TickTime, LastFallTime
end module

module GAME
  use SGL
  use GAME_DATA
  use UTILITY
contains
  ! 初始化
  subroutine Init()
    call sglUseFont("Arial", 8, 16)
    LastTime = sglGetInfo(SGL_TIME)
	LastFallTime = LastTime
	Board = 0
	Score = 0
	Speed = SpeedInit
    GameMode = Mode_Playing
    call random_seed()
    call InitBlock()
    call NewBlock()	
  end subroutine
  ! 产生新的方块
  subroutine NewBlock()
    integer, parameter :: StartX = BlocksX/2-2
	integer, parameter :: StartY = -3
    real r
	integer ir

	call random_number(r)
	ir = mod(int(r*100), blocktype) + 1
	call bound(1,blocktype,ir)
	CurrentBlock => blocks(ir)
	call random_number(r)
	CurrentBlock%index = mod(int(r*100),4) + 1
	call bound(1,4,CurrentBlock%index)
	CurrentBlock%x = StartX
	CurrentBlock%y = StartY
	CurrentBlock%backup_x = -1
    if ( NextPosition(StartX,StartY)==Block_HitBlock ) GameMode = Mode_End
  end subroutine
  ! 检查方块能不能放到(x,y)的位置上
  integer function NextPosition(x,y)
    integer x,y
	integer i,j,bx,by

	NextPosition = Block_Free
	
	do i=1,4
      by = y+i
	  do j=1,4
	    bx = x+j
	    if ( (bx > 0 .and. bx <= BlocksX) .and. &
		     (by > 0 .and. by <= BlocksY) ) then
	      if ( Board(bx, by)/=0 .and. CurrentBlock%db(j,i,CurrentBlock%index)/=0 ) then
		    NextPosition = Block_HitBlock
		    return
		  end if
		else if ( bx<=0 .or. bx>BlocksX ) then
		  if ( CurrentBlock%db(j,i,CurrentBlock%index)/=0 ) then
		    NextPosition = Block_HitWall
			return
		  end if
		else if ( by>BlocksY ) then
		  if ( CurrentBlock%db(j,i,CurrentBlock%index)/=0 ) then
		    NextPosition = Block_HitBottom
			return
		  end if
		end if
	  end do
	end do 

  end function
  ! 把方块移出版面
  subroutine ClearBlock()
    integer i,j, bx,by
	do i=1,4
	  by = CurrentBlock%y+i
	  do j=1,4
	    bx = CurrentBlock%x+j
		if ( bx>0 .and. bx<=BlocksX .and. &
		     by>0 .and. by<=BlocksY .and. &
		     CurrentBlock%db(j,i, CurrentBlock%index)/=0 ) then
		  Board(bx,by)=0
	    end if
	  end do
	end do
  end subroutine
  ! 把方块放入版面
  subroutine PutBlock()
    integer i,j, bx,by
	do i=1,4
	  by = CurrentBlock%y+i
	  do j=1,4
	    bx = CurrentBlock%x+j
		if ( bx>0 .and. bx<=BlocksX .and. &
		     by>0 .and. by<=BlocksY .and. &
		     CurrentBlock%db(j,i, CurrentBlock%index)/=0 ) then
		  Board(bx,by) = CurrentBlock%db(j,i, CurrentBlock%index)
	    end if
	  end do
	end do
  end subroutine
  ! 某一行已经填满, 把它移除
  subroutine DeleteLevel(l)
    integer l
	integer i
	do i=l,2,-1
	  Board(:,i)=Board(:,i-1)
	end do
    Score = Score + 10
	Speed = Speed - SpeedInc
	if ( Speed<SpeedLimit ) Speed = SpeedLimit
  end subroutine 
  ! 检查有哪几行被填满
  subroutine Check()
    integer c
	integer i
	do i=1, BlocksY
	  c = count(Board(:,i)/=0)
	  if ( c==BlocksX .and. i>1 ) then
		call DeleteLevel(i)
	  end if
	end do
  end subroutine
  ! 没有信息时会一直调用OnIdle函数
  subroutine OnIdle()
    ThisTime = sglGetInfo(SGL_TIME)
	TickTime = ThisTime - LastTime
	if ( TickTime<10 ) return

	select case(GameMode)
	case(Mode_Playing)
	  call GameMove()
      call display()
	case(Mode_End)
	  call sglKeyDownSub(KeyDown2)
	  call ShowMessage()
	end select

	LastTime = ThisTime
  end subroutine
  ! 游戏结束的画面
  subroutine ShowMessage()
	call sglClearBuffer()
	call sglTextOut(10,SY/2,"Game Over, play again?(Y/N)")
	call sglUpdateBuffer()    
  end subroutine
  ! 游戏结束后读取键盘的程序
  subroutine KeyDown2(key)
    integer key
	character ckey
	ckey = achar(key)
	select case(ckey)
	case('Y','y')
	  call sglKeyDownSub(KeyDown)
	  call Init()
	case('N','n')
	  call sglEnd()
	end select 
  end subroutine
  ! 显示的函数
  subroutine display()
    call sglClearColor3i(0,100,100)
    call sglClearBuffer()
    call DrawBoard()
	call sglUpdateBuffer()
  end subroutine
  ! 游戏进行中读取键盘的函数
  subroutine KeyDown(key)
    integer key
	integer, parameter :: MOVE_LEFT = 37,&
						  MOVE_RIGHT= 39,&
						  MOVE_DOWN = 40,&
						  MOVE_ROT  = 32
    integer oldindex, check
    
	call ClearBlock()

	select case(key)
	case(MOVE_LEFT)
	  if ( NextPosition(CurrentBlock%x-1, CurrentBlock%y)==Block_Free ) then
	    CurrentBlock%x = CurrentBlock%x-1
	  end if
	case(MOVE_RIGHT)
	  if ( NextPosition(CurrentBlock%x+1, CurrentBlock%y)==Block_Free ) then
	    CurrentBlock%x = CurrentBlock%x+1
	  end if
	case(MOVE_DOWN)
	  if ( NextPosition(CurrentBlock%x, CurrentBlock%y+1)==Block_Free ) then
	    CurrentBlock%y = CurrentBlock%y+1
	  end if
	case(MOVE_ROT)
	  oldindex = CurrentBlock%index
	  CurrentBlock%index = CurrentBlock%index+1
	  if ( CurrentBlock%index>4 ) CurrentBlock%index = 1
	  check = NextPosition(CurrentBlock%x, CurrentBlock%y)
	  select case(check)
	  case(Block_HitWall)
	    if ( CurrentBlock%index==2 .or. CurrentBlock%index==4 ) then
   	      if ( NextPosition(BlocksX-CurrentBlock%rot_shift, CurrentBlock%y)==Block_Free ) then
		    CurrentBlock%backup_x = CurrentBlock%x
		    CurrentBlock%x = BlocksX-CurrentBlock%rot_shift
		  end if
		end if
	  case(Block_Free)
	    if ( (CurrentBlock%index==1 .or. CurrentBlock%index==3) .and. &
		     CurrentBlock%backup_x/=-1 ) then
		  CurrentBlock%x = CurrentBlock%backup_x
		  CurrentBlock%backup_x = -1 
		end if
	  case default  
	    CurrentBlock%index = oldindex
	  end select
	end select
	
	call PutBlock()
  end subroutine
  ! 让方块自然向下落的函数
  subroutine GameMove()
    if ( ThisTime-LastFallTime > Speed ) then
	  LastFallTime = ThisTime
	  call ClearBlock()
	  if ( NextPosition(CurrentBlock%x, CurrentBlock%y+1)/=Block_Free ) then
	    call PutBlock()
		call Check()
		call NewBlock()
	  else
	    CurrentBlock%y = CurrentBlock%y+1
		call PutBlock()
	  end if
	end if
  end subroutine
  ! 画出所有的版面
  subroutine DrawBoard()
    integer x,y
	character(len=20) :: string

    call sglColor3i(255,255,255)
    call sglRect(BoundX, BoundY, SX-BoundX, SY-BoundY)
	
	do y=1, BlocksY
	  do x=1, BlocksX
	    call DrawBlock(x,y,Board(x,y))
	  end do
	end do
	write( string, "('Score:',I5)" ) Score
	call sglColor3i(255,255,0)
	call sglTextOut(1,1,string)

  end subroutine
  ! 画出每一个小方块的函数
  subroutine DrawBlock(x,y,c)
    integer, intent(in) :: x,y,c
    integer, parameter :: w = BX-GridSize*2
	integer, parameter :: h = BY-GridSize*2
	integer :: startx, starty
	
	if ( c==0 ) return

	startx = (x-1)*BX + BoundX + GridSize
	starty = (y-1)*BY + BoundY + GridSize
	call sglColor3i( color(c)%r, color(c)%g, color(c)%b )
	call sglFilledRect( startx, starty, startx+w, starty+h )
  end subroutine

end module
