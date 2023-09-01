module GAME
  use SGL
  use utility
  implicit none
  integer, parameter :: SX = 210, SY = 430
  integer, parameter :: BoundX = 5, BoundY = 15
  integer, parameter :: BatRadius = 8, BallRadius = 10, DoorSize = 6*BallRadius
  integer, parameter :: HitRange = BatRadius + Ballradius
  real, parameter :: InitSpeed = 50, MaxBallSpeed = (SY+SY)-(BoundY+BoundX)*2, MinBallSpeed = 0
  real, parameter :: fHitRange = real(BatRadius) + real(BallRadius)
  real, parameter :: decay = MaxBallSpeed/50.0, HitDecay = 0.95
  integer, save :: ComputerScore = 0, PlayerScore = 0
  type(vector2f), save :: PlayerPos = vector2f( SX/2.0, SY-BoundY-BallRadius)
  type(vector2f), save :: ComputerPos = Vector2f(SX/2.0, BoundY+BallRadius)
  type(vector2f), save :: PrevPlayerPos, PrevComputerPos
  type(vector2f), save :: ComputerDir, PlayerDir
  type(vector2f), save :: BallPos, BallDir
  real, save :: BallSpeed, PlayerSpeed, ComputerSpeed
  integer, save :: LastTime, ThisTime, TickTime
  real, save :: fTickTime
  integer, save :: HitTime = 0  
contains
  ! 初启资料
  subroutine InitGame()   
	LastTime = sglGetInfo(SGL_TIME)
	PrevPlayerPos = PlayerPos
	PrevComputerPos = ComputerPos
	call sglUseFont("Times New Roman", 8, 16)
    call random_seed()
	call NewBall()
  end subroutine
  ! 发出一个新的球
  subroutine NewBall()
    real distance

	BallPos = vector2f(real(BoundX + BallRadius), SY/2.0)
  
	call random_number(BallSpeed)
	BallSpeed = BallSpeed*InitSpeed/2.0 + InitSpeed/2.0

    call random_number(BallDir%x)
	call random_number(BallDir%y)
	BallDir%x = (BallDir%x-0.5)
	BallDir%y = (BallDir%y-0.5)
	
	if ( abs(BallDir%y)<0.1 ) BallDir%y=0.1
	distance = normalize(BallDir)
  end subroutine
  ! 显示的函数
  subroutine display()
    call sglClearColor3i(0,200,0)
	call sglClearBuffer()
    call DrawBoard()
	call DrawBall()
	call DrawPlayer()
	call sglUpdateBuffer()    
  end subroutine
  ! 画出球桌
  subroutine DrawBoard()
    character(len=20) :: string
    call sglColor3i(255,255,255)
	call sglRect(BoundX, BoundY, SX-BoundX, SY-BoundY)
    call sglLine(BoundX, SY/2, SX-BoundX, SY/2)
	call sglColor3i(0,200,0)
	call sglLine(SX/2-DoorSize/2, BoundY, SX/2+DoorSize/2, BoundY)
	call sglLine(SX/2-DoorSize/2, SY-BoundY, SX/2+DoorSize/2, SY-BoundY)
	call sglColor3i(0,0,0)
	write(string,"('Computer:'I2)") ComputerScore
	call sglTextOut(1,1,string)
	write(string,"('You:'I2)") PlayerScore
	call sglTextOut(1,SY-BoundY+1,string)
  end subroutine
  ! 画出球
  subroutine DrawBall()
    call sglColor3i(255,0,0)
	call sglFilledCircle( int(BallPos%x), int(BallPos%y), BallRadius)
    call sglColor3i(150,0,0)
	call sglFilledCircle( int(BallPos%x), int(BallPos%y), BallRadius*2/3)
    call sglColor3i(255,0,0)
	call sglFilledCircle( int(BallPos%x), int(BallPos%y), BallRadius/3)
  end subroutine
  ! 画出拍子
  subroutine DrawPlayer()
    call sglColor3i(0,50,50)
    call sglFilledCircle( int(PlayerPos%x), int(PlayerPos%y), BatRadius)
    call sglFilledCircle( int(ComputerPos%x), int(ComputerPos%y), BatRadius)
    call sglColor3i(0,255,255)
    call sglFilledCircle( int(PlayerPos%x), int(PlayerPos%y), BatRadius/4)
    call sglFilledCircle( int(ComputerPos%x), int(ComputerPos%y), BatRadius/4)
  end subroutine
  ! 移动鼠标的信息函数
  subroutine MouseMove(x,y)
    integer x,y
	PlayerPos = vector2f( real(x), real(y) )
	if ( PlayerPos%y < SY/2+BallRadius ) PlayerPos%y = SY/2.0+BallRadius
	if ( PlayerPos%y > SY-Boundy-BallRadius ) PlayerPos%y = Sy-Boundy-BallRadius
	if ( PlayerPos%x < BoundX+BallRadius ) PlayerPos%x = BoundX+BallRadius
	if ( PlayerPos%x > SX-BoundX-BallRadius ) PlayerPos%x = SX-BoundX-BallRadius
  end subroutine
  ! 电脑的AI
  subroutine ComputerMove()
    real, parameter :: movespeed = 200, hitspeed = 300
	real speed, length, speedup
    type(vector2f) vec
    integer, parameter :: bx = BoundX+BatRadius !+BallRadius*2
	integer, parameter :: by = BoundY+BatRadius !+BallRadius*2
	integer, parameter :: AIHitBall = 1, AIGoBack = 2
	integer :: AIMode
    real :: DefenceRange 
	
	if ( ComputerScore>=PlayerScore ) then
	  speedup = 1.0
	else
	  speedup = 1.5
	end if

	if ( BallSpeed > hitspeed ) then 
	  DefenceRange = SY/3.0-BatRadius
	else
	  DefenceRange = BoundY+SY/2.0-BatRadius
	end if

	if ( BallPos%y > DefenceRange .or. ThisTime-HitTime<(500/speedup) ) then
	  AIMode = AIGoBack
	else
	  AIMode = AIHitBall
	end if

	select case(AIMODE)
	case(AIGoBack)
	  vec%x = SX/2.0 - ComputerPos%x
      vec%y = by + BallRadius - ComputerPos%y
	  speed = movespeed*speedup
	  length = normalize(vec)
	case(AIHitBall)
      vec%x = BallPos%x - ComputerPos%x
	  vec%y = BallPos%y - ComputerPos%y
	  speed = hitspeed*speedup
	  length = normalize(vec)
	  !if ( length<fHitRange*3.0 ) speed = speed*2.0
	end select
	
	if ( length>BatRadius ) then
      ComputerPos%x = ComputerPos%x + vec%x * speed * fTickTime
      ComputerPos%y = ComputerPos%y + vec%y * speed * fTickTime
	end if
	
	if ( ComputerPos%x < bx ) ComputerPos%x=bx
	if ( ComputerPos%x > SX-bx ) ComputerPos%x=SX-bx
	if ( ComputerPos%y < by ) ComputerPos%y=by
	if ( ComputerPos%y > SY-by ) ComputerPos%y=SY-by

  end subroutine
  ! 计算球的移动
  subroutine BallMove()
    real vx, vy
	type(vector2f) :: newpos
	integer, parameter :: DoorSX = SX/2 - DoorSize/2 + BallRadius
	integer, parameter :: DoorEX = SX/2 + DoorSize/2 - BallRadius

	vx = (fTickTime * BallSpeed) * BallDir%x
	vy = (fTickTime * BallSpeed) * BallDir%y
    newpos = vector2f(BallPos%x+vx, BallPos%y+vy)

	call CheckHit(1,newpos)
    call CheckHit(2,newpos)

	if ( (newpos%x-BallRadius) < BoundX ) then
	  BallSpeed = BallSpeed * HitDecay
	  newpos%x = BoundX+BallRadius
	  BallDir%x = -BallDir%x
	end if

	if ( (newpos%x+BallRadius) > (SX-BoundX) ) then
	  BallSpeed = BallSpeed * HitDecay
	  newpos%x = SX-BoundX-BallRadius
	  BallDir%x = -BallDir%x
	end if
	
	if ( (newpos%y-BallRadius) < BoundY ) then
	  BallSpeed = BallSpeed * HitDecay
	  newpos%y = BoundY+BallRadius
	  BallDir%y = -BallDir%y
	end if

	if ( (newpos%y+BallRadius) > (SY-BoundY) ) then
	  BallSpeed = BallSpeed * HitDecay
	  newpos%y = SY-BoundY-BallRadius
	  BallDir%y = -BallDir%y
	end if

	BallPos = newpos

	if ( BallPos%y == BoundY+BallRadius .and. ( BallPos%x>=DoorSX .and. BallPos%x<=DoorEX ) ) then
	  PlayerScore = PlayerScore+1
	  call NewBall()
	end if

	if ( BallPos%y == SY-BoundY-BallRadius .and. ( BallPos%x>=DoorSX .and. BallPos%x<=DoorEX ) ) then
	  ComputerScore = ComputerScore+1
	  call NewBall()
	end if
	
  end subroutine
  ! 检查是否有打到球
  logical function Hit(Speed, PlayerMove, BallMove)
    real speed
    type(line) :: PlayerMove, BallMove
	type(vector2f) :: PlayerVec
	type(vector2f) :: inter1, inter2, vec, N, A
	type(vector2f) :: force
	integer :: hitcount = 0
    real length, dotvalue, t
	real speedadd
	logical check
	PlayerVec = PlayerMove%vector
	length = normalize(PlayerVec)
	Hit = .false.

	if ( HitBall(PlayerMove, BallMove, fHitRange, t) ) then
	  hitcount = hitcount+1
	  inter1 = BallMove%a  + t*BallMove%vector
	  inter2 = PlayerMove%a + t*PlayerMove%vector
	  N = inter1 - inter2
	  length = normalize(N)
	  A = BallMove%vector
	  length = normalize(A)
	  dotvalue = A*N

	  speedadd = Speed*(PlayerVec*N)
	  force = (speedadd)*N

	  if ( dotvalue<0.0 ) then
		BallDir = A - (2.0*dotvalue)*N
	  end if

      length = normalize(BallDir)
	  BallDir = (BallSpeed*HitDecay)*BallDir + force
	  BallSpeed = normalize(BallDir)

      if ( BallSpeed > MaxBallSpeed ) BallSpeed = MaxBallSpeed
	  if ( BallSpeed < MinBallSpeed ) BallSpeed = MinBallSpeed

	  length = (1.0-t)*fTickTime*BallSpeed
	  BallMove%b = inter1 + length*BallDir

	  vec = BallMove%b - PlayerMove%b
	  length = normalize(vec)
	  if ( length<fHitRange ) then
	    BallMove%b = PlayerMove%b + (fHitRange+1)*vec
	  end if

	  Hit = .true.
	end if
  end function
  ! 检查玩家或是电脑有没有打到球
  subroutine CheckHit(who, newpos)
    integer who
	type(vector2f) :: newpos, vec
	type(line) :: playermove, ballmove
	real speed
	real :: length

	ballmove = SetLine(ballpos, newpos)
	
	select case(who)
	case(1) 
	  ! Check for player  
	  PlayerMove = SetLine(PrevPlayerPos, PlayerPos)
	  speed = PlayerSpeed
	case(2)
	  ! Check for computer  
	  PlayerMove = SetLine(PrevComputerPos, ComputerPos)
	  speed = ComputerSpeed
	end select
	!if ( speed>MaxBallSpeed ) speed = MaxBallSpeed
	if ( hit(speed, playermove, ballmove) ) then
	  newpos = ballmove%b
	  if ( who==2 ) HitTime = ThisTime
	end if

  end subroutine
  ! 没有任何信息时一直会被调用的函数
  subroutine OnIdle()
    real move
    integer t
    ThisTime = sglGetInfo(SGL_TIME)
	fTickTime = (ThisTime-LastTime)/1000.0
	if ( fTickTime<0.01 ) return
	    
	PlayerDir = PlayerPos - PrevPlayerPos
	move = normalize(PlayerDir)
	PlayerSpeed = move/fTickTime
	
	call ComputerMove()

	ComputerDir = ComputerPos - PrevComputerPos
	move = normalize(ComputerDir)
	ComputerSpeed = move/fTickTime
	
	call BallMove()
    call display()
	BallSpeed = BallSpeed - decay*fTickTime
	if ( BallSpeed<MinBallSpeed ) BallSpeed = MinBallSpeed

	PrevPlayerPos = PlayerPos
	PrevComputerPos = ComputerPos
	LastTime = ThisTime
  end subroutine

end module
