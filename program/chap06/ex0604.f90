program ex0604
implicit none
  integer, parameter :: limit=10  ! 计数器的上限
  integer counter      ! 计数器
  integer :: ans = 0   ! 拿来累加使用

  counter = 2  ! 设定计数器初值
  do while( counter <= limit )
    ans = ans + counter
    counter = counter + 2  ! 计数器累加
  end do

  write(*,*) ans

  stop
end
