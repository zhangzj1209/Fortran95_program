program  ex1003
  implicit none
  integer, pointer :: a=>null()
  integer, target  :: b=1,c=2

  write(*,*) associated(a)   ! FALSE, ָ��a��δָ��
  a=>c 
  write(*,*) associated(a)   ! TRUE, ָ��a��ָ��
  write(*,*) associated(a,c) ! TRUE, ָ��aָ��c
  write(*,*) associated(a,b) ! FALSE, ָ��a��ָ��b
  nullify(a)                 ! ��ָ��a��Ϊû��ָ��
  write(*,*) associated(a)   ! FALSE, ָ��a��δָ��

  stop
end
