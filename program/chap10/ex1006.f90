program ex1006
  implicit none
  integer, pointer :: a(:,:) ! 定义a是2维的指针数组
  integer, target  :: b(3,3,2)
  integer i
  
  forall( i=1:3 )
	b(:,i,1)=i
	b(:,i,2)=2*i
  end forall

  a=>b(:,:,1)
  ! a(i,j)=>b(i,j,1)
  write(*,"(9I2)") a
  a=>b(1:3:2,1:2,2)
  ! a(1,1)=>b(1,1,2), a(2,1)=>b(3,1,2)
  ! a(1,2)=>b(1,2,2), a(2,2)=>b(3,2,2)
  write(*,"(4I2)") a
  stop
end

