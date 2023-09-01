module GLOBAL
  implicit none
  
  integer, parameter :: blocktype = 7

  type color3i
    integer r,g,b
  end type
  ! 每种方块的颜色  
  type(color3i) :: color(blocktype) = (/ color3i(0,0,255),&
										 color3i(0,255,0),&
										 color3i(0,255,255),&
										 color3i(255,0,0),&
										 color3i(255,0,255),&
										 color3i(255,255,0),&
										 color3i(255,255,255) /)
  type block
    integer name
	integer rot_shift
    integer index
	integer x,y, backup_x
	integer :: db(4,4,4)
  end type
  
  type(block), target, save :: blocks(blocktype)  
  !各种方块的形状信息
  integer, target :: b1(4,4,1) = (/ 0,0,0,0,& ! type 1
							        0,0,0,0,&
								    1,1,0,0,&
								    1,1,0,0 /) 

  integer, target :: b2(4,4,2) = (/ 0,0,0,0,& ! type 1
									2,0,0,0,& 
									2,2,0,0,&
									0,2,0,0,& 

									0,0,0,0,& ! type 2
									0,0,0,0,& 
									0,2,2,0,&
									2,2,0,0 /)

  integer, target :: b3(4,4,2) = (/ 0,0,0,0,& ! type 1
							        0,3,0,0,&
                                    3,3,0,0,&
									3,0,0,0,&

									0,0,0,0,& ! type 2
									0,0,0,0,&
									3,3,0,0,&
									0,3,3,0 /)

  integer, target :: b4(4,4,2) = (/ 4,0,0,0,& ! type 1
									4,0,0,0,&
									4,0,0,0,&
									4,0,0,0,&

									0,0,0,0,& ! type 2
									0,0,0,0,&
									0,0,0,0,&
									4,4,4,4 /)

  integer, target :: b5(4,4,4) = (/ 0,0,0,0,& ! type 1
									5,0,0,0,&
									5,5,0,0,&
									5,0,0,0,&

									0,0,0,0,& ! type 2
									0,0,0,0,& 
									5,5,5,0,&
									0,5,0,0,&

									0,0,0,0,& ! type 3
									0,5,0,0,&
									5,5,0,0,&
									0,5,0,0,&

									0,0,0,0,& ! type 4
									0,0,0,0,&
									0,5,0,0,&
									5,5,5,0 /)

  integer, target :: b6(4,4,4) = (/ 0,0,0,0,& ! type 1
									6,6,0,0,&
									0,6,0,0,&
									0,6,0,0,&

									0,0,0,0,& ! type 2
									0,0,0,0,&
									0,0,6,0,&
									6,6,6,0,&

									0,0,0,0,& ! type 3
									6,0,0,0,&
									6,0,0,0,&
									6,6,0,0,&
									
									0,0,0,0,& ! type 4
									0,0,0,0,&
									6,6,6,0,&
									6,0,0,0 /)	

  integer, target :: b7(4,4,4) = (/ 0,0,0,0,& ! type 1
									7,7,0,0,&
									7,0,0,0,&
									7,0,0,0,&

									0,0,0,0,& ! type 2
									0,0,0,0,&
									7,7,7,0,&
									0,0,7,0,&

									0,0,0,0,& ! type 3
									0,7,0,0,&
									0,7,0,0,&
									7,7,0,0,&
									
									0,0,0,0,& ! type 4
									0,0,0,0,&
									7,0,0,0,&
									7,7,7,0 /)	

contains
  ! 设定各种方块的信息
  subroutine InitBlock()
    blocks(1).name = 1
	blocks(1).rot_shift = 2
    blocks(1).db(:,:,1) = b1(:,:,1)
    blocks(1).db(:,:,2) = b1(:,:,1)
    blocks(1).db(:,:,3) = b1(:,:,1)
    blocks(1).db(:,:,4) = b1(:,:,1)

    blocks(2).name = 2
	blocks(2).rot_shift = 3
	blocks(2).db(:,:,1) = b2(:,:,1)
	blocks(2).db(:,:,2) = b2(:,:,2)
	blocks(2).db(:,:,3) = b2(:,:,1)
	blocks(2).db(:,:,4) = b2(:,:,2)

    blocks(3).name = 3
	blocks(3).rot_shift = 3
	blocks(3).db(:,:,1) = b3(:,:,1)
	blocks(3).db(:,:,2) = b3(:,:,2)
	blocks(3).db(:,:,3) = b3(:,:,1)
	blocks(3).db(:,:,4) = b3(:,:,2)

    blocks(4).name = 4
	blocks(4).rot_shift = 4
	blocks(4).db(:,:,1) = b4(:,:,1)
	blocks(4).db(:,:,2) = b4(:,:,2)
	blocks(4).db(:,:,3) = b4(:,:,1)
	blocks(4).db(:,:,4) = b4(:,:,2)

    blocks(5).name = 5
	blocks(5).rot_shift = 3
	blocks(5).db = b5

	blocks(6).name = 6
	blocks(6).rot_shift = 3
	blocks(6).db = b6

	blocks(7).name = 7
	blocks(7).rot_shift = 3
	blocks(7).db = b7
  end subroutine

end module