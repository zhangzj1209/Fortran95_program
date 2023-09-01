module func

contains 
function getmin(p)
  implicit none
  integer, pointer :: p(:)
  integer, pointer :: getmin
  integer i,s
  integer min
  s=size(p,1) ! 查寻数组的大小
  min = 2**30 ! 先把min设定成一个很大的值
  do i=1,s
    if ( min>p(i) ) then
	  min=p(i)
	  getmin=>p(i)
	end if
  end do
  return
end function

end module

program ex1008
  use func
  implicit none
  integer, target  :: a(8)=(/ 10, 15, 8, 25, 9, 20, 17, 19 /)
  integer, pointer :: p(:)

  p=>a(1:8:2)
  ! p(1)=>a(1), p(2)=>a(3), p(3)=>a(5), p(4)=>a(7)
  write(*,*) getmin(p)
  
  stop
end
