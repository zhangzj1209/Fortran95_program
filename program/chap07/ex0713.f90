program ex0713
implicit none
  integer i
  integer :: a(5)

  forall(i=1:5)
    a(i)=5
  end forall
  ! a(1)=a(2)=a(3)=a(4)=a(5)=5
  write(*,*) a

  forall(i=1:5)
    a(i)=i
  end forall
  ! a(1)=1, a(2)=2, a(3)=3, a(4)=4, a(5)=5
  write(*,*) a

  stop
end
