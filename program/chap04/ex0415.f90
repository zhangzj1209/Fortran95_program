program ex0415
  character(len=20) string
  character(len=5) substring
  string = "Have a nice day."
  substring = "nice"
  write(*,*) ichar('A') ! ����ַ�A��ASCII��
  write(*,*) char(65)   ! ���ASCII��65��������ַ�,Ҳ����A
  write(*,*) len(string) ! ����ַ���string����ʱ�ĳ���
  write(*,*) len_trim(string) ! ����ַ���string���ݵĳ���
  write(*,*) index(string, substring) ! nice��Have a nice day�ĵ�8��λ��
end
