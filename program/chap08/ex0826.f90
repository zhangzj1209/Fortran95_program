program  ex0826
  implicit none
  interface
    subroutine sub(a,b) ! 定义子程式sub的接口
    implicit none
    integer :: a
    integer, optional :: b
    end subroutine sub
  end interface

  call sub(1)   ! 使用1个参数
  call sub(2,3) ! 使用2个参数
  stop
end program ex0817

subroutine sub(a,b)
  implicit none
  integer :: a
  integer, optional :: b
  write(*,*) present(a)
  if ( present(b) ) then ! 有传入b时
    write(*,"('a=',I3,' b=',I3)") a,b ! 
  else                   ! 没有传入b时
    write(*,"('a=',I3,' b=unknown')") a
  end if
  return
end subroutine sub
