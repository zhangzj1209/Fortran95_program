module typedef
  implicit none
  type person
    sequence ! ǿ���Զ��������еı�������˳�����ڴ�������
    integer age
    real    weight, height
  end type
end module

module cprog
  interface
    subroutine SUBA(str)
    !DEC$ ATTRIBUTES C, ALIAS:'_sub1' :: SUBA
	character(len=*) :: str
	!DEC$ ATTRIBUTES REFERENCE :: str
	end subroutine
    subroutine SUBB(c)
    !DEC$ ATTRIBUTES C, ALIAS:'_sub2' :: SUBB
	complex :: c
	!DEC$ ATTRIBUTES VALUE :: c
	end subroutine
	subroutine SUBC(p)
	use typedef
    !DEC$ ATTRIBUTES C, ALIAS:'_sub3' :: SUBC
    type(person) :: p
	end subroutine
  end interface
end module cprog

program main
  use typedef
  use cprog
  implicit none
  character(len=20) :: str="Fortran 95"C ! ���ַ��������0
  complex :: c=(1.0,2.0)
  type(person) :: p=person(20, 70, 180)

  call SUBA(str)
  call SUBB(c)
  call SUBC(p)

  stop
end program