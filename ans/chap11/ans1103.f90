module rational_utility

  implicit none

  private
  public :: rational, &
            operator(+), operator(-), operator(*),&
            operator(/), assignment(=),operator(>),&
            operator(<), operator(==), operator(/=),&
            output, input

  type :: rational
    integer :: num, denom
  end type rational

  interface operator(+)
    module procedure  rat__rat_plus_rat
  end interface

  interface operator(-)
    module procedure rat__rat_minus_rat
  end interface

  interface operator(*)
    module procedure rat__rat_times_rat
  end interface

  interface operator(/)
    module procedure rat__rat_div_rat
  end interface

  interface assignment(=)
    module procedure rat_eq_rat
    module procedure int_eq_rat
    module procedure real_eq_rat
  end interface

  interface operator(>)
    module procedure rat_gt_rat
  end interface

  interface operator(<)
    module procedure rat_lt_rat
  end interface

  interface operator(==)
    module procedure rat_compare_rat
  end interface

  interface operator(/=)
    module procedure rat_ne_rat
  end interface

contains
  function rat_gt_rat(a,b)
    implicit none
    logical :: rat_gt_rat
    type(rational), intent(in) :: a,b
    real :: fa,fb

    fa=real(a%num)/real(a%denom)
    fb=real(b%num)/real(b%denom)
    if ( fa > fb ) then
      rat_gt_rat=.true.
    else
      rat_gt_rat=.false.
    end if
    return
  end function rat_gt_rat

  function rat_lt_rat(a,b)
    implicit none
    logical :: rat_lt_rat
    type(rational), intent(in) :: a,b
    real :: fa,fb

    fa=real(a%num)/real(a%denom)
    fb=real(b%num)/real(b%denom)
    if ( fb > fa ) then
      rat_lt_rat=.true.
    else
      rat_lt_rat=.false.
    end if
    return
  end function rat_lt_rat

  function rat_compare_rat(a,b)
    implicit none
    logical :: rat_compare_rat
    type(rational), intent(in) :: a,b
    type(rational) :: c

    c=a-b

    if ( c%num == 0 ) then
      rat_compare_rat=.true.
    else
      rat_compare_rat=.false.
    end if
    return
  end function rat_compare_rat

  function rat_ne_rat(a,b)
    implicit none
    logical :: rat_ne_rat
    type(rational), intent(in) :: a,b
    type(rational) :: c

    c=a-b

    if ( c%num==0 ) then
      rat_ne_rat=.false.
    else
      rat_ne_rat=.true.
    end if
    return
  end function rat_ne_rat

  subroutine rat_eq_rat( rat1, rat2 )
    implicit none
    type(rational), intent(out):: rat1
    type(rational), intent(in) :: rat2

    rat1%num   = rat2%num
    rat1%denom = rat2%denom

    return
  end subroutine rat_eq_rat

  subroutine int_eq_rat( int, rat )
    implicit none
    integer, intent(out):: int
    type(rational), intent(in) :: rat

    int = rat%num / rat%denom

    return
  end subroutine int_eq_rat

  subroutine real_eq_rat( float, rat )
    implicit none
    real, intent(out) :: float
    type(rational), intent(in) :: rat

    float = real(rat%num) / real(rat%denom)

    return
  end subroutine real_eq_rat

  function reduse( a )
    implicit none
    type(rational), intent(in) :: a
    integer :: b
    type(rational) :: reduse

    b=gcv_interface(a%num,a%denom)
    reduse%num = a%num/b
    reduse%denom = a%denom/b

    return
  end function reduse

  function gcv_interface(a,b)
    implicit none
    integer, intent(in) :: a,b
    integer :: gcv_interface

    if ( min(a,b) .eq. 0 ) then
      gcv_interface=1
      return
    end if

    if (a==b) then
      gcv_interface=a
      return
    else if ( a>b ) then
      gcv_interface=gcv(a,b)
    else if ( a<b ) then
      gcv_interface=gcv(b,a)
    end if
    return
  end function gcv_interface

  recursive function gcv(a,b) result(ans)
    implicit none
    integer, intent(in) :: a,b
    integer :: m
    integer :: ans

    m=mod(a,b)

    select case(m)
    case(0)
      ans=b
      return
    case(1)
      ans=1
      return
    case default
      ans=gcv(b,m)
    end select

    return
  end function gcv

  function rat__rat_plus_rat( rat1, rat2 )
    implicit none
    type(rational) :: rat__rat_plus_rat
    type(rational), intent(in) :: rat1,rat2
    type(rational) :: act

    act%denom= rat1%denom * rat2%denom
    act%num  = rat1%num*rat2%denom + rat2%num*rat1%denom
    rat__rat_plus_rat = reduse(act)

    return
  end function rat__rat_plus_rat

  function rat__rat_minus_rat( rat1, rat2 )
    implicit none
    type(rational) :: rat__rat_minus_rat
    type(rational), intent(in) :: rat1, rat2
    type(rational) :: temp

    temp%denom = rat1%denom*rat2%denom
    temp%num   = rat1%num*rat2%denom - rat2%num*rat1%denom
    rat__rat_minus_rat = reduse( temp )
  return
  end function rat__rat_minus_rat

  function rat__rat_times_rat( rat1, rat2 )
    implicit none
    type(rational) :: rat__rat_times_rat
    type(rational), intent(in) :: rat1, rat2
    type(rational) :: temp

    temp%denom = rat1%denom* rat2%denom
    temp%num   = rat1%num  * rat2%num
    rat__rat_times_rat = reduse(temp)

    return
  end function rat__rat_times_rat

  function rat__rat_div_rat( rat1, rat2 )
    implicit none
    type(rational) :: rat__rat_div_rat
    type(rational), intent(in) :: rat1, rat2
    type(rational) :: temp

    temp%denom = rat1%denom* rat2%num
    temp%num   = rat1%num  * rat2%denom
    rat__rat_div_rat = reduse(temp)

    return
  end function rat__rat_div_rat

  subroutine input(a)
    implicit none
    type(rational), intent(out) :: a

    write(*,*) "·Ö×Ó:"
    read(*,*)  a%num
    write(*,*) "·ÖÄ¸:"
    read(*,*)  a%denom

    return
  end subroutine input

  subroutine output(a)
    implicit none
    type(rational), intent(in) :: a

    if ( a%denom/=1 ) then
      write(*, "(' (',I3,'/',I3,')' )" ) a%num,a%denom
    else
      write(*, "(I3)" ) a%num
    end if

    return
  end subroutine output

end module rational_utility

program main
  use rational_utility
  implicit none
  type(rational) :: a,b,c

  call input(a)
  call input(b)

  c=a+b
  write(*,*) "a+b="
  call output(c)
  c=a-b
  write(*,*) "a-b="
  call output(c)
  c=a*b
  write(*,*) "a*b="
  call output(c)
  c=a/b
  write(*,*) "a/b="
  call output(c)

  if (a>b) write(*,*) "a>b"
  if (a<b) write(*,*) "a<b"
  if (a==b) write(*,*) "a==b"
  if (a/=b) write(*,*) "a/=b"

  stop
end program main
