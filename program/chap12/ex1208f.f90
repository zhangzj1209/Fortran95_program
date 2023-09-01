module typedef
  implicit none
  type person
    integer age
	real    weight, height
  end type
end module

program main
  use typedef
  implicit none
  integer :: a=3
  character(len=20) :: str="FORTRAN 95"
  type(person) :: p=person(20,70,180)  

  call sub1(a)
  call sub2(str)
  call sub3(p)

  stop
end
