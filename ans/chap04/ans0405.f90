program main
  implicit none
  type distance
    real meter, inch, cm
  end type
  type(distance) :: d
  write(*,*) "�����볤��:"
  read(*,*) d%meter
  d%cm = d%meter*100
  d%inch = d%cm/2.54
  write(*,"(f8.3'�� ='f8.3'���� ='f8.3'Ӣ��')") d%meter, d%cm, d%inch
end program