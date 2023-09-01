program ex0502
implicit none
  real(kind=4) :: height ! 记录身高
  real(kind=4) :: weight ! 记录体重

  write(*,*) "height:"
  read(*,*)   height     ! 读入身高
  write(*,*) "weight:"
  read(*,*)   weight     ! 读入体重
	
  if ( weight > height-100 ) then 
    ! 如果体重大于身高减去100, 会执行下面的程序
    write(*,*) "Too fat!"
  else
    ! 如果体重不大于身高减去100, 会执行下面的程序
    write(*,*) "Under control."
  end if

stop
end