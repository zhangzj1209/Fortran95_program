module cprog
  interface
    integer function FUNC(a)
    !DEC$ ATTRIBUTES C, ALIAS:'_func' :: FUNC
    integer a(2,2)
    end function
  end interface
end module cprog

program main
  use cprog
  implicit none
  integer :: a(2,2) = (/ 1,2,3,4 /)
  integer sum

  sum = FUNC(a)
  write(*,*) sum

  stop
end program
