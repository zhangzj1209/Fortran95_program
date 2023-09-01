module typedef
  implicit none

  type vector2f
    real x,y
  end type
  
  type line
    type(vector2f) :: a,b
	type(vector2f) :: vector
  end type
  
  interface operator(+)
    module procedure vector2f_add_vector2f
  end interface

  interface operator(-)
    module procedure vector2f_sub_vector2f
  end interface

  interface operator(*)
    module procedure real_mul_vector2f
	module procedure vector2f_dot_vector2f
  end interface

  interface operator(.dot.)
    module procedure vector2f_dot_vector2f
  end interface

contains
  
  function vector2f_add_vector2f(a,b)
    type(vector2f), intent(in) :: a,b
	type(vector2f) :: vector2f_add_vector2f
	vector2f_add_vector2f = vector2f(a%x+b%x, a%y+b%y)
  end function

  function vector2f_sub_vector2f(a,b)
    type(vector2f), intent(in) :: a,b
	type(vector2f) :: vector2f_sub_vector2f
	vector2f_sub_vector2f = vector2f(a%x-b%x, a%y-b%y)
  end function

  function real_mul_vector2f(a,b)
    real, intent(in) :: a
	type(vector2f), intent(in) :: b
	type(vector2f) :: real_mul_vector2f
	real_mul_vector2f = vector2f( a*b%x, a*b%y )
  end function

  real function vector2f_dot_vector2f(a,b)
    type(vector2f), intent(in) :: a,b
	vector2f_dot_vector2f = a%x*b%x + a%y*b%y
  end function

  real function length(a)
    type(vector2f), intent(in) :: a
	length = SQRT(a%x*a%x + a%y*a%y)
  end function
end module

module utility
  use typedef
  implicit none

contains
  ! 设定type(line)类型变量
  function SetLine(a,b)
    type(vector2f) :: a,b
	type(line) :: SetLine
    SetLine = line(a,b,b-a)
  end function
  ! 计算x/(x+y)或y/(x+y)
  real function GetRatio(index, vector)
    integer index
	type(vector2f) :: vector
	real total
	GetRatio=0.0
	total = vector%x + vector%y
	if ( total==0.0 ) return
	select case(index)
	case(1)
	  GetRatio = vector%x/total
	case(2)
	  GetRatio = vector%y/total
	end select
  end function
  ! 转换成单位向量, 返回原本向量的长度值
  real function normalize(vector)
    type(vector2f) :: vector
	real temp
	temp = vector%x*vector%x + vector%y*vector%y
	if ( temp<0.0 ) temp = 0.0
	normalize = SQRT(temp)
	if ( normalize<1E-5 ) return
	vector%x = vector%x/normalize
	vector%y = vector%y/normalize
  end function
  ! 检查是否会打到球
  logical function HitBall( line1, line2, length, t )
    type(line), intent(in) :: line1, line2
	real, intent(in) :: length
	real, intent(out) :: t
	type(vector2f) :: V,P
	real Ax,Ay,Bx,By
	real A,B,C,D
	real t1,t2

	HitBall = .false.
	P = line1%a - line2%a
	V = line1%vector - line2%vector
	A = V%x*V%x + V%y*V%y
	B = 2.0*(V%x*P%x+V%y*P%y)
	C = P%x*P%x + P%y*P%y - length*length
	D = B*B - 4*A*C
	if ( D<0 ) return
	if ( A==0.0 ) return

	t1 = (-B-SQRT(D))/(2.0*A)
	t2 = (-B+SQRT(D))/(2.0*A)

	t = -1.0
	if ( t1>=0 .and. t2>=0 ) then
	  t = min(t1,t2)
	else if ( t1>=0 ) then
	  t = t1
	else if ( t2>=0 ) then
	  t = t2
	end if
	if ( t>=0 .and. t<=1.0 ) then
	  hitball = .true.
	end if

  end function 

end module