module time_util
  implicit none
  type :: time
    integer :: hour,minute
  end type time

  interface operator(+) ! 让type(time)类型变量能够相加
    module procedure add_time_time ! time+time
	module procedure add_time_real ! time+real
	module procedure add_real_time ! real+time
  end interface

  interface operator(<) ! 让type(time)类型变量能够比大小
    module procedure time_lt_time  ! 判断time<time
  end interface

  interface assignment(=) ! 让type(time)类型跟浮点数能够转换
    module procedure time_assign_real ! time = real
	module procedure real_assign_time ! real = time
  end interface

contains
  ! type(time) + type(time)
  function add_time_time( a, b ) result(add)
    implicit none
    type(time), intent(in) :: a,b
    type(time) :: add
    integer :: minutes,carry
    minutes=a%minute+b%minute
    carry=minutes/60
    add%minute=mod(minutes,60)   ! 取余数
    add%hour=a%hour+b%hour+carry 
    return
  end function
  ! type(time) + real
  function add_time_real( a, b )
    implicit none
	type(time), intent(in) :: a
	real, intent(in) :: b
	type(time) :: add_time_real
    type(time) :: tb
	tb%hour=int(b)
	tb%minute=int( (b-tb%hour)*60 )
	add_time_real = add_time_time(a,tb)
	return
  end function
  ! real + type(time)
  function add_real_time( a, b )
    implicit none
	real, intent(in) :: a
	type(time), intent(in) :: b
	type(time) :: add_real_time
    add_real_time = add_time_real(b,a)
	return
  end function
  ! type(time) < type(time)
  logical function time_lt_time( a, b )
    implicit none
	type(time), intent(in) :: a,b
    if ( a%hour < b%hour ) then
	  time_lt_time = .true.
	  return
	end if
    if ( a%minute < b%minute ) then
	  time_lt_time = .true.
	  return
	end if
    time_lt_time = .false.
	return
  end function
  ! type(time) = real
  subroutine time_assign_real( a, b )
    implicit none
	type(time), intent(out) :: a
	real, intent(in) :: b
	a%hour = int(b)
    a%minute = int( (b-a%hour)*60 )
    return
  end subroutine
  ! real = type(time)
  subroutine real_assign_time( a, b )
    implicit none
	real, intent(out) :: a
	type(time), intent(in) :: b    
	a=b%hour+real(b%minute)/60.0
	return
  end subroutine

  subroutine output(t)
    type(time), intent(in) :: t
	write(*,"(I2,':',I2.2)") t%hour, t%minute
	return
  end subroutine

end module

program ex1108
  use time_util
  implicit none
  type(time) :: a,b,c
  real :: rt

  a = 0.5    ! a = time(0,30)
  b = 0.1+a  ! b = time(0,36)
  c = a+0.6  ! c = 1.1 hour = time(1,06)
  rt = time(1,30) + time(2,30) ! rt = 1.5 + 2.5 = 4
  call output(c)
  write(*,*) rt
  write(*,*) a<b ! true, 0:30 < 0:36

  stop
end program
