subroutine SUB()
!DEC$ ATTRIBUTES DLLEXPORT :: SUB
  implicit none
  write(*,*) "Subroutine in DLL"
  return
end