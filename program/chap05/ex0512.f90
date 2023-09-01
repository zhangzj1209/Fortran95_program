program ex0512
implicit none
  integer score
  character grade

  write(*,*) "Score:"
  read(*,*) score

  select case(score)
  case(90:100) ! 90到100分之间
    grade='A'
  case(80:89)  ! 80到89分之间
    grade='B'
  case(70:79)  ! 70到79分之间
    grade='C'
  case(60:69)  ! 60到69分之间
    grade='D'
  case(0:59)   ! 0到59分之间
    grade='E'
  case default ! 其它情形
    grade='?'
  end select
  
  write(*,"('Grade:',A1)") grade
  stop
end