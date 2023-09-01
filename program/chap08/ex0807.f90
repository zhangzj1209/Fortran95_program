program ex0807
implicit none
  real :: a=1
  real :: b=2
  real, external :: add

  write(*,*) add(a,b)
  stop
end

function add(a,b)
implicit none
  real :: a,b ! 传入的参数
  real :: add 
  ! add跟函数名称一样，这边不是用来声明变量，
  ! 是声明这个函数会返回的数值类型
  add = a+b
  return
end