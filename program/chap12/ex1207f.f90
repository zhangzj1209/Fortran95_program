subroutine getinteger(num)
!DEC$ ATTRIBUTES C, ALIAS:'_getinteger' :: getinteger
  implicit none
  integer num
  write(*,*) num
  return
end subroutine

subroutine getstring(string, len)
!DEC$ ATTRIBUTES C, ALIAS:'_getstring' :: getstring
  implicit none
  integer :: len
  character*(len) :: string
!DEC$ ATTRIBUTES REFERENCE :: string
  write(*,*) string
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
!DEC$ ATTRIBUTES C, ALIAS:'_getperson' :: getperson
  use typedef
  implicit none
  type(person) :: p
  write(*,"('age:',I3,' weight:',F5.1,' height:',F5.1)") p
  return
end subroutine