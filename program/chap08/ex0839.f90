program ex0839
  implicit none
  integer :: a

  read(*,*) a
  call sub( a, *100, *200 ) 
  ! �ر�����ָ���������ص�, �ֱ����д���100��200�������ط�
  write(*,*) "Default"
  stop
  100 write(*,*) "Return 1"
  stop
  200 write(*,*) "Return 2"
  stop 

end 

subroutine sub( a, *, * )
  implicit none
  integer :: a
  if ( a<=0 ) then
    return    ! �����ڶ��ķ��ص�
  else if ( a==1 ) then
    return 1  ! �����ر�ָ���ĵ�1�����ص�
  else
    return 2  ! �����ر�ָ���ĵ�2�����ص�
  end if
end subroutine