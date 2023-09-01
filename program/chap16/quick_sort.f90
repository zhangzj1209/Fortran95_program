! 快速排序法范例
! By Perng 1997/8/30
program QuickSort_Demo
implicit none
  integer, parameter :: N=10
  real :: B(N)
  integer :: A(N)
  
  ! 用随机数来产生数列
  call random_seed()
  call random_number(B)
  A = B*100
  write(*,"('Source=>',10I3)") A

  ! 调用Quick_Sort时除了要传入类型的信息外,还要给定要排列类型元素
  ! 的上下限位置范围. 在此当然是要给 1,N ,表示要从头排到尾.
  call Quick_Sort(A,N,1,N)
  write(*,"('Sort=>',10I3)") A

  stop
end program QuickSort_Demo
!
! 快速排序法的子程序
!
recursive subroutine Quick_Sort(A,N,S,E)
implicit none
  integer :: N    ! 表示类型的大小
  integer :: A(N) ! 存放数据的类型
  integer :: S    ! 传入的参数, 这一组的类型起始位置
  integer :: E    ! 传入的参数, 这一组的类型结束位置
  integer :: L,R  ! 用来找A(L)>K及A(R)<K时用的
  integer :: K    ! 记录键值A(S)
  integer :: temp ! 交换两个数值时用的
  ! 首先要先给定L,R的初值. L要从头开始,E则要从尾开始
  L=S  
  R=E+1
  ! Right值 > Left值 时才有必要进行排序  
  if ( R<=L ) return

  K=A(S)  ! 设定键值
  do while(.true.)
    ! 找出A(L)<K的所在
    do while( .true. )
      L=L+1
      if ( (A(L) > K) .or. (L>=E) ) exit
    end do
    ! 找出A(R)>K的所在
    do while( .true. )
      R=R-1
      if ( (A(R) < K) .or. (R<=S) ) exit
    end do
    ! 如果Right 跑到 Left的左边时, 循环就该结束了
    if ( R <= L ) exit
    ! 交换A(L),A(R)的数值
    temp=A(L)
    A(L)=A(R)
    A(R)=temp
  end do
  ! 交换A(S),A(R)的数值
  temp=A(S)
  A(S)=A(R)
  A(R)=temp
  ! 把R之前的数据重新分组,再做排序
  call Quick_Sort(A,N,S,R-1)
  ! 把R之后的数据重新分组,再做排序
  call Quick_Sort(A,N,R+1,E)
  return
end subroutine Quick_Sort
                
