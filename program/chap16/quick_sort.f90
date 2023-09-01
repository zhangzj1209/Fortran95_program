! �������򷨷���
! By Perng 1997/8/30
program QuickSort_Demo
implicit none
  integer, parameter :: N=10
  real :: B(N)
  integer :: A(N)
  
  ! �����������������
  call random_seed()
  call random_number(B)
  A = B*100
  write(*,"('Source=>',10I3)") A

  ! ����Quick_Sortʱ����Ҫ�������͵���Ϣ��,��Ҫ����Ҫ��������Ԫ��
  ! ��������λ�÷�Χ. �ڴ˵�Ȼ��Ҫ�� 1,N ,��ʾҪ��ͷ�ŵ�β.
  call Quick_Sort(A,N,1,N)
  write(*,"('Sort=>',10I3)") A

  stop
end program QuickSort_Demo
!
! �������򷨵��ӳ���
!
recursive subroutine Quick_Sort(A,N,S,E)
implicit none
  integer :: N    ! ��ʾ���͵Ĵ�С
  integer :: A(N) ! ������ݵ�����
  integer :: S    ! ����Ĳ���, ��һ���������ʼλ��
  integer :: E    ! ����Ĳ���, ��һ������ͽ���λ��
  integer :: L,R  ! ������A(L)>K��A(R)<Kʱ�õ�
  integer :: K    ! ��¼��ֵA(S)
  integer :: temp ! ����������ֵʱ�õ�
  ! ����Ҫ�ȸ���L,R�ĳ�ֵ. LҪ��ͷ��ʼ,E��Ҫ��β��ʼ
  L=S  
  R=E+1
  ! Rightֵ > Leftֵ ʱ���б�Ҫ��������  
  if ( R<=L ) return

  K=A(S)  ! �趨��ֵ
  do while(.true.)
    ! �ҳ�A(L)<K������
    do while( .true. )
      L=L+1
      if ( (A(L) > K) .or. (L>=E) ) exit
    end do
    ! �ҳ�A(R)>K������
    do while( .true. )
      R=R-1
      if ( (A(R) < K) .or. (R<=S) ) exit
    end do
    ! ���Right �ܵ� Left�����ʱ, ѭ���͸ý�����
    if ( R <= L ) exit
    ! ����A(L),A(R)����ֵ
    temp=A(L)
    A(L)=A(R)
    A(R)=temp
  end do
  ! ����A(S),A(R)����ֵ
  temp=A(S)
  A(S)=A(R)
  A(R)=temp
  ! ��R֮ǰ���������·���,��������
  call Quick_Sort(A,N,S,R-1)
  ! ��R֮����������·���,��������
  call Quick_Sort(A,N,R+1,E)
  return
end subroutine Quick_Sort
                
