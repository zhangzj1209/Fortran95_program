program ex0415
  character(len=20) string
  character(len=5) substring
  string = "Have a nice day."
  substring = "nice"
  write(*,*) ichar('A') ! 输出字符A的ASCII码
  write(*,*) char(65)   ! 输出ASCII码65所代表的字符,也就是A
  write(*,*) len(string) ! 输出字符串string声明时的长度
  write(*,*) len_trim(string) ! 输出字符串string内容的长度
  write(*,*) index(string, substring) ! nice在Have a nice day的第8个位置
end
