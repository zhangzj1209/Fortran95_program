program ex0716
implicit none
  integer :: students
  integer, allocatable :: a(:) ! ����һ���ɱ��С��һά����
  integer :: i
    
  write(*,*) "How many students:"
  read(*,*) students
  allocate( a(students) ) ! �����ڴ�ռ�

  ! ����ɼ�
  do i=1,students
    write(*,"('Number ',I3)") i
    read(*,*) a(i)
  end do

  stop
end
