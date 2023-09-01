module bank
  implicit none
  integer :: money = 1000000
  integer :: fileid = 10
  private money, fileid
  private TimeLog
contains
  subroutine TimeLog()
    implicit none
	integer :: num
	character(len=20) :: date, time
 	call date_and_time(date, time)
	write(fileid, "('Date:',A8,' Time:',A2,':',A2,':',A2)") &
	      date, time(1:2), time(3:4), time(5:6)
	return
  end subroutine

  subroutine LoadMoney(name,num)
    implicit none
	character(len=*) :: name
	integer :: num

	if ( num<=0 ) then
	  write(*,*) "������Ľ��"
	  return
	end if

    open(fileid, file="log.txt", position="append")
	if ( money>=num ) then
	  call TimeLog()
	  write(fileid,"(A10,' ��ȡ',I5,'Ԫ')") name,num
	  money=money-num
	else
	  write(fileid,*) "����Ŀǰ�ֽ���"
	  write(*,*) "����Ŀǰ�ֽ���"
	end if
    close(fileid)
	return
  end subroutine
  
  subroutine SaveMoney(name,num)
    implicit none
	character(len=*) :: name
	integer :: num
	if ( num<=0 ) then
	  write(*,*) "������Ľ��"
	  return
	end if
    open(fileid, file="log.txt", position="append")
	call TimeLog()
	write(fileid,"(A10,' ����',I5,'Ԫ')") name,num
	close(fileid)
    money=money+num
    return
  end subroutine
end module

program ex1102
  use bank
  implicit none

  call LoadMoney("������",100)
  call SaveMoney("������",1000)

  stop
end