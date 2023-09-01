module defoperator
  use typedef
  implicit none
  interface assignment(=)
    module procedure vector2i_assign_vector2f
	module procedure vector2f_assign_vector2i
  end interface
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
  subroutine vector2i_assign_vector2f(a,b)
    type(vector2i), intent(out) :: a
	type(vector2f), intent(in)  :: b
	a = vector2i( int(b%x), int(b%y) )
  end subroutine

  subroutine vector2f_assign_vector2i(a,b)
    type(vector2f), intent(out) :: a
	type(vector2i), intent(in)  :: b
	a = vector2f( real(b%x), real(b%y) )
  end subroutine
  
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
  use defoperator
  implicit none

contains
  
  function SetLine(a,b)
    type(vector2f) :: a,b
	type(line) :: SetLine
    SetLine = line(a,b,b-a)
  end function

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

  integer function ccw(a,b,c)
    type(vector2f) :: a,b,c
	real dx1, dy1, dx2, dy2
	
	dx1=b%x - a%x;
	dy1=b%y - a%y;
	dx2=c%x - a%x;
	dy2=c%y - a%y;
	
	if ( dx1*dy2>dy1*dx2 ) then
	  ccw = 1
	  return;
	end if

	if ( dx1*dy2<dy1*dx2 ) then
	  ccw = -1;
	  return
	end if

	if ( (dx1*dx2<0) .or. (dy1*dy2<0) ) then
	  ccw = -1;
	  return
	end if

	if ( (dx1*dx1+dy1*dy1)<(dx2*dx2+dy2*dy2) ) then 
	  ccw = 1;
	  return
	end if
    
	ccw = 0
  end function

  logical function Cross(line1, line2, inter)
    type(line) :: line1, line2
	type(vector2f) :: inter
	real x1, y1, x2, y2, x3, y3, x4, y4
	real x, y, t
	real Ax,Bx,Cx,Ay,By,Cy,d,e,f,num
	real x1lo,x1hi,y1lo,y1hi

    cross = .false.
	x1 = line1%a%x
	y1 = line1%a%y
	x2 = line1%a%x
	y2 = line1%a%y
	x3 = line2%a%x
	y3 = line2%a%y
	x4 = line2%a%x
	y4 = line2%a%y

	Ax = x2-x1
	Bx = x3-x4

	if( Ax<0 ) then
      !X bound box test
	  x1lo=x2
	  x1hi=x1
	else 
	  x1hi=x2
	  x1lo=x1
	end if

	if(Bx>0) then
	  if( x1hi < x4 .or. x3 < x1lo) return
	else 
	  if( x1hi < x3 .or. x4 < x1lo) return
	end if

	Ay = y2-y1
	By = y3-y4

	if( Ay < 0 ) then
	  y1lo=y2
	  y1hi=y1
	else 
      y1hi=y2
	  y1lo=y1
	end if
	
	if( By > 0 )  then
	  if( y1hi < y4 .or. y3 < y1lo) return
	else 
	  if( y1hi < y3 .or. y4 < y1lo) return
	end if

	Cx = x1-x3
	Cy = y1-y3
	d = By*Cx - Bx*Cy  ! alpha numerator
	f = Ay*Bx - Ax*By  ! both denominator
	
  ! alpha tests
	if( f>0 ) then
	  if( d<0 .or. d>f ) return
	else 
      if( d>0 .or. d<f ) return
	end if

	e = Ax*Cy - Ay*Cx  ! beta numerator
	! beta tests
	if( f>0 ) then
	  if(e<0 .or. e>f) return
	else 
	  if(e>0 .or. e<f) return
	end if

    ! compute intersection coordinates
	if(f==0) return

	t = d/f
	num = t*Ax		! numerator 
	x = x1 + num	! intersection x
	num = t*Ay
	y = y1 + num;	! intersection y

	inter = vector2f(x,y)

	return
  end function
  
  real function distance( l, point )
    type(line) :: l
	type(vector2f) :: point
	type(vector2f) :: va, vb, vc
	real valength, vblength, vclength, temp
	real cosvalue, sinvalue

	va = l%b - l%a
	vb = point - l%a
	vc = point - l%b
	valength = length(va)
	vblength = length(vb)
	vclength = length(vc)

	cosvalue = (va .dot. vb)/(valength*vblength)
	temp = 1.0 - cosvalue*cosvalue
	if ( temp<0.0 ) temp=0.0
	sinvalue = sqrt(temp)
	
	if ( cosvalue>0 ) then
	  temp = vblength*cosvalue
	  if ( temp<=valength ) then
	    distance = vblength*sinvalue
	  else
		distance = min(vblength, vclength)    
	  end if
	else
	  distance = vblength
	end if
  end function 
  
  real function LineDistance( line1, line2 )
    type(line) :: line1, line2
	LineDistance = min( distance(line1,line2%a),&
					    distance(line1,line2%b),&
						distance(line2,line1%a),&
						distance(line2,line1%b) )    
  end function

  logical function LineIntersectWithCircle( l, cir, p )
    type(line) :: l
	type(circle) :: cir
	type(vector2f) :: p
	real x0,y0, x1,y1, radius
	real dx,dy, ox,oy, t0,t1,t
	real A,B,C,det

	x0 = l%a%x - cir%center%x
	y0 = l%a%y - cir%center%y
	x1 = l%b%x - cir%center%x
	y1 = l%b%y - cir%center%y
	radius = cir%radius

	dx = x1 - x0;
	dy = y1 - y0;

	A = dx*dx + dy*dy;
	if ( A==0 ) then
	  LineIntersectWithCircle = .false.
	  return
	end if

	B = 2.0*(x0*dx + y0*dy)
	C = x0*x0 + y0*y0 - radius*radius
	det = B*B - 4*A*C;

	if ( det<0 ) then
	  LineIntersectWithCircle = .false.
	  return
	end if

	t0 = (-B+sqrt(det))/(2.0*A);
	t1 = (-B-sqrt(det))/(2.0*A);

	t = 1-MAX(t0,t1);

	if ( t<0 ) then
	  LineIntersectWithCircle = .false.
	  return
	end if

	if ( t>1.0 ) t=1.0;

	p%x = x0 + dx*t + cir%center%x
	p%y = y0 + dy*t + cir%center%y

	LineIntersectWithCircle = .true.
  end function

end module