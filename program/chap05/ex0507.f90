program ex0507
implicit none
  integer score
  character grade
	
  write(*,*) "Score:"
  read(*,*)  score

  if ( score>=90 .and. score<=100 ) grade='A'
  if ( score>=80 .and. score<90 )   grade='B'
  if ( score>=70 .and. score<80 )   grade='C'
  if ( score>=60 .and. score<70 )   grade='D'
  if ( score>=0  .and. score<60 )   grade='E'
  if ( score>100 .or.  score<0  )   grade='?' 

  write(*,"('Grade:',A1)") grade

stop
end
