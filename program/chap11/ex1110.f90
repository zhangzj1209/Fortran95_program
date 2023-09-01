module rational_util
implicit none

  private
  public :: rational, &
            operator(+), operator(-), operator(*),&
            operator(/), assignment(=),&
            output

  type :: rational
    integer :: num    ! ����
    integer :: denom  ! ��ĸ
  end type rational
  ! �ӷ�
  interface operator(+)
    module procedure rat_plus_rat
  end interface
  ! ����
  interface operator(-)
    module procedure rat_minus_rat
  end interface
  ! �˷�
  interface operator(*)
    module procedure rat_times_rat
  end interface
  ! ����
  interface operator(/)
    module procedure rat_div_rat
  end interface
  ! �Ⱥ�
  interface assignment(=)
    module procedure int_eq_rat
    module procedure real_eq_rat
  end interface

contains
  ! ����=����
  subroutine int_eq_rat( int, rat )
    implicit none
    integer, intent(out):: int
    type(rational), intent(in) :: rat
    ! ���ӳ��Է�ĸ��ת��������
    int = rat%num / rat%denom
    return
  end subroutine int_eq_rat
  ! ������=����
  subroutine real_eq_rat( float, rat )
    implicit none
    real, intent(out) :: float
    type(rational), intent(in) :: rat
    ! ���ӳ��Է�ĸ
    float = real(rat%num) / real(rat%denom)
    return
  end subroutine real_eq_rat
  ! �������
  function reduse( a )
    implicit none
    type(rational), intent(in) :: a
    type(rational) :: temp
    integer :: b
    integer :: sign
    type(rational) :: reduse

    if ( a%num*a%denom > 0 ) then
      sign=1
    else
      sign=-1
    end if
    temp%num=abs(a%num)
    temp%denom=abs(a%denom)
    b=gcv(temp%num,temp%denom)  ! �ҷ������ĸ���������
    ! �ѷ���,��ĸͬ�����������
    reduse%num = temp%num/b*sign
    reduse%denom = temp%denom/b
    return
  end function reduse
  ! ��շת��������������
  function gcv(a,b)
    implicit none
    integer, intent(in) :: a,b
    integer :: big,small
    integer :: temp
    integer :: gcv

    big=max(a,b)
    small=min(a,b)
    do while( small>1 )
      temp=mod(big,small)
      if ( temp == 0 ) exit
      big=small
      small=temp
    end do
    gcv=small
    return
  end function gcv
  ! �������
  function rat_plus_rat( rat1, rat2 )
    implicit none
    type(rational) :: rat_plus_rat
    type(rational), intent(in) :: rat1,rat2
    type(rational) :: act
    ! b/a+d/c = ( b*c+d*a )/(a*c)
    act%denom= rat1%denom * rat2%denom  ! a*c
    act%num  = rat1%num*rat2%denom + rat2%num*rat1%denom ! (b*c+d*a)
    rat_plus_rat = reduse(act) ! Լ��

    return
  end function rat_plus_rat
  ! �������
  function rat_minus_rat( rat1, rat2 )
    implicit none
    type(rational) :: rat_minus_rat
    type(rational), intent(in) :: rat1, rat2
    type(rational) :: temp
    ! b/a-d/c=(b*c-d*a)/(a*c)
    temp%denom = rat1%denom*rat2%denom ! a*c
    temp%num = rat1%num*rat2%denom - rat2%num*rat1%denom ! (b*c-d*a)
    rat_minus_rat = reduse( temp ) ! Լ��
  return
  end function rat_minus_rat
  ! �������
  function rat_times_rat( rat1, rat2 )
    implicit none
    type(rational) :: rat_times_rat
    type(rational), intent(in) :: rat1, rat2
    type(rational) :: temp
    ! (b/a)*(d/c)=(b*d)/(a*c)
    temp%denom = rat1%denom* rat2%denom ! (a*c)
    temp%num   = rat1%num  * rat2%num   ! (b*d)
    rat_times_rat = reduse(temp)   ! Լ��
    return
  end function rat_times_rat
  ! �������
  function rat_div_rat( rat1, rat2 )
    implicit none
    type(rational) :: rat_div_rat
    type(rational), intent(in) :: rat1, rat2
    type(rational) :: temp
    ! (b/a)/(d/c)=(b*c)/(a*d)
    temp%denom = rat1%denom* rat2%num   ! (a*d)
    temp%num   = rat1%num  * rat2%denom ! (b*c)
    rat_div_rat = reduse(temp)     ! Լ��
    return
  end function rat_div_rat
  ! ���
  subroutine output(a)
    implicit none
    type(rational), intent(in) :: a

    if ( a%denom/=1 ) then
      write(*, "(1x,'(',I3,'/',I3,')' )") a%num,a%denom
    else
      write(*, "(1x,I3)" ) a%num
    end if
    return
  end subroutine output
end module
! ������
program main
  use rational_util
  implicit none
  type(rational) :: a,b,c
  real :: f

  a=rational(1.0,3.0)
  b=rational(2.0,3.0)
  write(*,"(1x,A4)",advance="no") "a="
  call output(a)
  write(*,"(1x,A4)",advance="no") "b="
  call output(b)
  c=a+b
  write(*,"(1x,A4)",advance="no") "a+b="
  call output(c)
  c=a-b
  write(*,"(1x,A4)",advance="no") "a-b="
  call output(c)
  c=a*b
  write(*,"(1x,A4)",advance="no") "a*b="
  call output(c)
  c=a/b
  write(*,"(1x,A4)",advance="no") "a/b="
  call output(c)
  f=c
  write(*, "(f6.2)" ) f
  stop
end program
