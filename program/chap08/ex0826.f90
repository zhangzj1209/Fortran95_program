program  ex0826
  implicit none
  interface
    subroutine sub(a,b) ! �����ӳ�ʽsub�Ľӿ�
    implicit none
    integer :: a
    integer, optional :: b
    end subroutine sub
  end interface

  call sub(1)   ! ʹ��1������
  call sub(2,3) ! ʹ��2������
  stop
end program ex0817

subroutine sub(a,b)
  implicit none
  integer :: a
  integer, optional :: b
  write(*,*) present(a)
  if ( present(b) ) then ! �д���bʱ
    write(*,"('a=',I3,' b=',I3)") a,b ! 
  else                   ! û�д���bʱ
    write(*,"('a=',I3,' b=unknown')") a
  end if
  return
end subroutine sub
