program ex0601
implicit none
  integer counter
  integer, parameter :: lines=10
  ! counter<=lines֮ǰ��һֱ�ظ�ѭ��
  ! ÿ��һ��ѭ��counter���ۼ�1
  do counter=1,lines,1
    write(*,*) "Happy Birthday",counter
  end do

  stop
end
