program ex0901
  implicit none
  open(unit=10, file="hello.txt")
  write(10,*) "Hello"
  stop
end 
