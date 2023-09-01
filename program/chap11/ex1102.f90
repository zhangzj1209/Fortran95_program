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
	  write(*,*) "不合理的金额"
	  return
	end if

    open(fileid, file="log.txt", position="append")
	if ( money>=num ) then
	  call TimeLog()
	  write(fileid,"(A10,' 领取',I5,'元')") name,num
	  money=money-num
	else
	  write(fileid,*) "银行目前现金不足"
	  write(*,*) "银行目前现金不足"
	end if
    close(fileid)
	return
  end subroutine
  
  subroutine SaveMoney(name,num)
    implicit none
	character(len=*) :: name
	integer :: num
	if ( num<=0 ) then
	  write(*,*) "不合理的金额"
	  return
	end if
    open(fileid, file="log.txt", position="append")
	call TimeLog()
	write(fileid,"(A10,' 存入',I5,'元')") name,num
	close(fileid)
    money=money+num
    return
  end subroutine
end module

program ex1102
  use bank
  implicit none

  call LoadMoney("彭先生",100)
  call SaveMoney("陈先生",1000)

  stop
end