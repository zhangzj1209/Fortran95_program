program ex0715
implicit none
  integer, parameter :: max = 1000
  integer :: a(max) ! ������һ�����������
  integer :: students
  integer :: i
    
  write(*,*) "How many students:"
  read(*,*) students

  ! ����ɼ�
  do i=1,students
    write(*,"('Number ',I3)") i
    read(*,*) a(i)
  end do

  stop
end
