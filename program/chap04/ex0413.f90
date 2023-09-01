program ex0413
  character(len=20) string 
  string = "Good morning."
  write(*,*) string
  string(6:) = "evening." ! 重设设定从第6个字符之后的字符串
  write(*,*) string
end
