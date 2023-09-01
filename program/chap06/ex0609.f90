program  ex0609
implicit none
  integer  ::  i,j

  loop1: do i=1,3
    loop2: do j=1,3
      if ( i==3 ) exit  loop1  ! 跳离loop1循环
      if ( j==2 ) cycle loop2  ! 重做loop2循环
      write(*, "('(',i2,',',i2,')')" ) i, j
    end do loop2
  end do loop1
  stop
end
