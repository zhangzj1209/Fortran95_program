module time_util
  implicit none
  type :: time
    integer :: hour,minute
  end type time
  interface operator(+) ! ��type(time)���ͱ����ܹ����
    module procedure add
  end interface

contains
  function add( a, b )
    implicit none
    type(time), intent(in) :: a,b
    type(time) :: add
    integer :: minutes,carry
    minutes=a%minute+b%minute
    carry=minutes/60
    add%minute=mod(minutes,60)   ! ȡ����
    add%hour=a%hour+b%hour+carry 
    return
  end function add

  subroutine output(t)
    type(time), intent(in) :: t
	write(*,"(I2,':',I2.2)") t%hour, t%minute
	return
  end subroutine

end module

program ex1107
  use time_util
  implicit none
  type(time) :: a,b,c
  
  a=time(1,45)
  b=time(2,18)
  c=a+b ! ʵ�ʻ���ú���add
  call output(c)

  stop
end program
