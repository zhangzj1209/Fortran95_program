program ex0435
implicit none
! �жϿ��Լ�¼9��λ��������kindֵ
integer, parameter :: long_int  = selected_int_kind( 9 )  
! �жϿ��Լ�¼3��λ��������kindֵ
integer, parameter :: short_int = selected_int_kind( 3 ) 
! �жϿ�����10����Чλ��, ָ�����Լ�¼��50�ĸ�����kindֵ
integer, parameter :: long_real = selected_real_kind( 10, 50 )
! �жϿ�����3����Чλ��, ָ�����Լ�¼��3�ĸ�����kindֵ
integer, parameter :: short_real= selected_real_kind( 3, 3 )

integer(kind=long_int)  :: a = 12345678
integer(kind=short_int) :: b = 12
real(kind=long_real)    :: c = 1.23456789D45
real(kind=short_real)   :: d = 1230

write(*, "(I3,1X,I10)" )    long_int,   a
write(*, "(I3,1X,I10)" )    short_int,  b
write(*, "(I3,1X,E10.5)" )  long_real,  c
write(*, "(I3,1X,E10.5)" )  short_real, d

stop
end