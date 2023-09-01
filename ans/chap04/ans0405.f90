program main
  implicit none
  type distance
    real meter, inch, cm
  end type
  type(distance) :: d
  write(*,*) "请输入长度:"
  read(*,*) d%meter
  d%cm = d%meter*100
  d%inch = d%cm/2.54
  write(*,"(f8.3'米 ='f8.3'厘米 ='f8.3'英寸')") d%meter, d%cm, d%inch
end program