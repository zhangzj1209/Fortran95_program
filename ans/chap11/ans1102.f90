module time_utility
  implicit none

  type :: time
    integer :: hour,minute,second
  end type time

  interface operator(+)
    module procedure add_time_time
  end interface

contains
  function add_time_time( a, b )
    implicit none
    type(time) :: add_time_time
    type(time), intent(in) :: a,b
    integer :: seconds,minutes,carry

    seconds=a%second+b%second
    carry=seconds/60
    minutes=a%minute+b%minute+carry
    carry=minutes/60
    add_time_time%second=mod(seconds,60)
    add_time_time%minute=mod(minutes,60)
    add_time_time%hour=a%hour+b%hour+carry

    return
  end function add_time_time

  subroutine input( a )
    implicit none
    type(time), intent(out) :: a

    write(*,*) " Input hours:"
    read (*,*) a%hour
    write(*,*) " Input minutes:"
    read (*,*) a%minute
    write(*,*) " Input seconds:"
    read (*,*) a%second

    return
  end subroutine input

  subroutine output( a )
    implicit none
    type(time), intent(in) :: a
    write(*, "(I3,' hours',I3,' minutes',I3,' seconds')" ) a%hour,a%minute,a%second

    return
  end subroutine output

end module time_utility

program main
  use time_utility
  implicit none
  type(time) :: a,b,c

  call input(a)
  call input(b)
  c=a+b
  call output(c)

  stop
end program main
