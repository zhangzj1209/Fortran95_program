module bank
  implicit none
  private money
  public  LoadMoney, SaveMoney, Report
  integer :: money = 1000000
contains
  subroutine LoadMoney(num)
    implicit none
	integer :: num
	money=money-num
	return
  end subroutine
  
  subroutine SaveMoney(num)
    implicit none
	integer :: num
    money=money+num
    return
  end subroutine

  subroutine Report()
    implicit none
    write(*,"('银行目前库存',I,'元')") money
  end subroutine
end module

program ex1101
  use bank
  implicit none
  call LoadMoney(100)
  call SaveMoney(1000)
  call Report()
  stop
end