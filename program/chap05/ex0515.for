      PROGRAM  ex0515
      IMPLICIT NONE

      INTEGER  I
      INTEGER  N
      PARAMETER(N=10)
      DATA I /0/

10    WRITE(*, '(1X,A3,I2)' ) 'I=',I
      I=I+1
      IF ( I .LT. N ) GOTO 10

      STOP
      END
