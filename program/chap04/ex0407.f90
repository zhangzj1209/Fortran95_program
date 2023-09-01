program ex0407
  real :: a ! 声明浮点数类型变量a
  a = 2.5+3/2
  write(*,*) '2.5+3.0/2.0=', A ! A和a指的是同一个变量
  stop
end
