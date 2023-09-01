module MA
  implicit none

  interface show ! ����ĺ�������show
    module procedure show_int       ! �ȴ�ѡ��ĺ���show_int
    module procedure show_character ! �ȴ�ѡ��ĺ���show_character
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
  ! ����Ĳ���������, ���Զ�ѡ�����show_int
  call show(1)
  call show_character("FORTRAN 95")
  ! ����Ĳ���������, ���Զ�ѡ�����show_character
  call show("FORTRAN 95")
  stop
end program
