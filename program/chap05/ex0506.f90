program ex0506
implicit none
  integer score
  character grade
	
  write(*,*) "Score:"
  read(*,*)  score

  if ( score>100 ) then 
    grade='?'
  else if ( score>=90 ) then ! 会执行到此, 代表score<=100
    grade='A'
  else if ( score>=80 ) then ! 会执行到此, 代表score<90
    grade='B'
  else if ( score>=70 ) then ! 会执行到此, 代表score<80
    grade='C'
  else if ( score>=60 ) then ! 会执行到此, 代表score<70
    grade='D'
  else if ( score>=0 ) then  ! 会执行到此, 代表score<60
    grade='E'
  else                       ! 会执行到此, 代表score<0
    grade='?'
  end if

  write(*,"('Grade:',A1)") grade

stop
end
