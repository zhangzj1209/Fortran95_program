program ex0502
implicit none
  real(kind=4) :: height ! ��¼���
  real(kind=4) :: weight ! ��¼����

  write(*,*) "height:"
  read(*,*)   height     ! �������
  write(*,*) "weight:"
  read(*,*)   weight     ! ��������
	
  if ( weight > height-100 ) then 
    ! ������ش�����߼�ȥ100, ��ִ������ĳ���
    write(*,*) "Too fat!"
  else
    ! ������ز�������߼�ȥ100, ��ִ������ĳ���
    write(*,*) "Under control."
  end if

stop
end