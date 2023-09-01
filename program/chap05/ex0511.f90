program ex0511
implicit none
  character(len=20) :: str1,str2
  character relation

  write(*,*) "String 1:"
  read(*,"(A20)") str1
  write(*,*) "String 2:"
  read(*,"(A20)") str2
  
  if ( str1>str2 ) then
    relation = '>'
  else if ( str1==str2 ) then
    relation = '='
  else
    relation = '<'
  end if

  write(*,"('String1',A1,'String2')") relation
    
  stop
end