subroutine getstring(a)
!
  implicit none
  character(len=*) :: a
  write(*,*) a
  return
end subroutine

module typedef
  implicit none
  type person
  sequence
    integer age
	real    weight, height
  end type
end module

subroutine getperson(p)
  use typedef
  implicit none
  type(person) :: p
  write(*,"('age:',I3,' weight:',F5.1,' height:',F5.1)") p
  return
end subroutine