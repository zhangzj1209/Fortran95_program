program ex0812
implicit none
  integer :: a,b
  common a,b          ! a,b放在不具名的全局变量空间中
  integer :: c,d
  common /group1/ c,d ! c,d放在group1的全局变量空间中
  integer :: e,f
  common /group2/ e,f ! e,f放在group2的全局变量空间中

  write(*,"(6I4)") a,b,c,d,e,f

  stop
end

block data
implicit none
  integer a,b
  common  a,b          ! a,b放在不具名的全局变量空间中
  data    a,b /1,2/    ! 设定a,b的初值
  integer c,d
  common  /group1/ c,d ! c,d放在group1的全局变量空间中
  data    c,d /3,4/    ! 设定c,d的初值
  integer e,f
  common  /group2/ e,f ! e,f放在group2的全局变量空间中
  data    e,f /5,6/    ! 设定e,f的初值
end block data
