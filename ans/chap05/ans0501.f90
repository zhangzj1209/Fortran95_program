program main
  implicit none
  integer money
  real    tax
  
  write(*,*) "������������"
  read(*,*) money

  if ( money<1000 ) then
    tax = 0.03
  else if ( money<5000) then
    tax = 0.1
  else
    tax = 0.15
  end if
  write(*,"(' ˰��Ϊ 'I8)") nint(money*tax)

end program