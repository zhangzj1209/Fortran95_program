program main
  implicit none
  integer money
  real    tax
  
  write(*,*) "请输入月收入"
  read(*,*) money

  if ( money<1000 ) then
    tax = 0.03
  else if ( money<5000) then
    tax = 0.1
  else
    tax = 0.15
  end if
  write(*,"(' 税金为 'I8)") nint(money*tax)

end program