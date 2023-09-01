program ex0601
implicit none
  integer counter
  integer, parameter :: lines=10
  ! counter<=lines之前会一直重复循环
  ! 每跑一次循环counter会累加1
  do counter=1,lines,1
    write(*,*) "Happy Birthday",counter
  end do

  stop
end
