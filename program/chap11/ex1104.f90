module MA
  implicit none

  interface show ! 虚拟的函数名称show
    module procedure show_int       ! 等待选择的函数show_int
    module procedure show_character ! 等待选择的函数show_character
  end interface

contains
  subroutine show_int( n )
    implicit none
    integer, intent(in) :: n
    write(*,"('n=',I3)") n
    return
  end subroutine show_int

  subroutine show_character( str )
    implicit none
    character(len=*), intent(in) :: str
    write(*,"('str=',A)") str
    return
  end subroutine show_character
end module

program main
  use MA
  implicit none
  call show_int(1)
  ! 参入的参数是整数, 会自动选择调用show_int
  call show(1)
  call show_character("FORTRAN 95")
  ! 参入的参数是整数, 会自动选择调用show_character
  call show("FORTRAN 95")
  stop
end program
