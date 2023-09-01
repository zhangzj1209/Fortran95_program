C
C       矩阵乘法范例
C             By Perng 1997/9/17
        PROGRAM MATMUL_DEMO
        IMPLICIT NONE
        INTEGER N
        PARAMETER(N=3)
        INTEGER A(N,N)  ! MATRIX A
        INTEGER B(N,N)  ! MATRIX B
        INTEGER C(N,N)  ! MATRIX C
        DATA B /1,2,3,4,5,6,7,8,9/
        DATA C /9,8,7,6,5,4,3,2,1/

        CALL MATMUL(A,B,N,N,C,N,N)
        WRITE(*,*) 'Matrix A:'  
        CALL OUTPUT(A,N)

        STOP
        END
C
C       输出矩阵的子程序
C
        SUBROUTINE OUTPUT(A,N)
        IMPLICIT NONE
        INTEGER N,A(N,N)
        INTEGER I,J
        CHARACTER FOR*20
        DATA FOR /'(??(1X,I3))'/

C       用字符串来设定输出格式
        WRITE( FOR(2:3), '(I2)' ) N
        DO I=1,N
          WRITE( *, FMT=FOR ) (A(I,J),J=1,N)
        END DO
                
        RETURN
        END
C
C       矩阵乘法的子程序
C
        SUBROUTINE MATMUL(A,B,BR,BC,C,CR,CC)
        IMPLICIT NONE
        INTEGER BR       ! Row of Matrix B
        INTEGER BC       ! Column of Matrix B
        INTEGER B(BR,BC) ! Matrix B
        INTEGER CR       ! Row of Matrix C
        INTEGER CC       ! Column of Matrix C
        INTEGER C(CR,CC) ! Matrix C
        INTEGER A(BR,CC) ! Matrix A
        INTEGER I,J,K    ! 循环的计数器

        ! BC若不等于CR, 这两个矩阵无法相乘
        IF ( BC .NE. CR ) THEN
          WRITE(*,*) 'Matrix size error!'
          STOP
        END IF

        DO I=1,BR
          DO J=1,CC
            A(I,J)=0
            DO K=1,BC
              A(I,J)=A(I,J)+B(I,K)*C(K,J)
            END DO
          END DO
        END DO

        RETURN
        END
