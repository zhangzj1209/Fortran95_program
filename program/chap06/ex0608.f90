program  ex0608
implicit none
  integer  ::  i,j

  outter: do i=1,3
    inner:  do j=1,3
      write(*, "('(',i2,',',i2,')')" ) i,j
    end do inner
  end do outter

  stop
end
