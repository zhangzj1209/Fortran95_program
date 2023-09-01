program ex0819
implicit none
  integer, parameter :: dim1 = 2
  integer, parameter :: dim2 = 2
  integer, parameter :: dim3 = 2
  integer :: a(dim1, dim2, dim3)
  a(:,:,1)=1
  a(:,:,2)=2
  call GetArray1( a(:,:,1), dim1, dim2 ) 
  call GetArray2( a(1,1,2), dim1 )
  stop
end program ex0819

subroutine GetArray1( a, dim1, dim2 )
  implicit none
  integer :: dim1, dim2
  integer :: a(dim1, dim2)
  write(*,*) a
  return
end subroutine GetArray1

subroutine GetArray2( a, dim1 )
  implicit none
  integer :: dim1, dim2
  integer :: a(dim1, *)
  integer :: i
  write(*,*) (a(:,i),i=1,2) ! 必需指定要输出哪几个维度
  return
end subroutine GetArray2