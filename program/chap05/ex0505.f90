program ex0505
implicit none
  integer score
  character grade
	
  write(*,*) "Score:"
  read(*,*)  score

  if ( score>=90 .and. score<=100 ) then
    grade='A'
  else if ( score>=80 .and. score<90 ) then
    grade='B'
  else if ( score>=70 .and. score<80 ) then
    grade='C'
  else if ( score>=60 .and. score<70 ) then
    grade='D'
  else if ( score>=0 .and. score<60 ) then
    grade='E'
  else 
    ! score<0 或 score>100的不合理情形
    grade='?'
  end if

  write(*,"('Grade:',A1)") grade

stop
end
