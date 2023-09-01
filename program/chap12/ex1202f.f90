module cprog
  interface
    subroutine SUBA(a)
    !DEC$ ATTRIBUTES C, ALIAS:'_sub1' :: SUBA
	integer :: a
	!DEC$ ATTRIBUTES REFERENCE :: a
	end subroutine
    subroutine SUBB(a)
    !DEC$ ATTRIBUTES C, ALIAS:'_sub2' :: SUBB
	integer :: a
	!DEC$ ATTRIBUTES VALUE :: a
	end subroutine
  end interface
end module cprog

program main
  use cprog
  implicit none
  integer :: a=10

  call SUBA(a)
  call SUBB(a)

  stop
end program