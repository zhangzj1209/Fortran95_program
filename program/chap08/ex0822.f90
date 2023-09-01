program ex0822
  implicit none
  external sub1, sub2 ! 声明sub1跟sub2是子程序名称
  call sub(sub1)      ! 把子程序sub1当参数传出去
  call sub(sub2)      ! 把子程序sub1当参数传出去
  stop
end program

subroutine sub(sub_name)
  implicit none
  external sub_name ! 声明sub_name是个子程序
  call sub_name()   ! 调用传入的子程序sub_name
  return
end subroutine

subroutine sub1()
  implicit none
  write(*,*) "sub1"
end subroutine

subroutine sub2()
  implicit none
  write(*,*) "sub2"
end subroutine
