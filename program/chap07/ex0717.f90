program  ex0717
implicit none
  integer :: size, error=0
  integer, parameter :: one_mb=1024*1024 ! 1MB
  character, allocatable ::  a(:)

  do while( .true. )
    size=size+one_mb ! 一次增加1MB个字符,也就是1MB的内存空间
    allocate( a(size), stat=error )
    if ( error/=0 ) exit
    write(*,"('Allocate ',I10, ' bytes')") size
	write(*,"(F10.2,' MB used')") real(size)/real(one_mb)
    deallocate( a )
  end do

  stop
end
