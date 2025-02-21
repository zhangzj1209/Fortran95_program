# 《Fortran95 程序设计》

## 实例程序及习题参考解答

- 第01章 计算机概论
- 第02章 [编译器的使用](./program/chap02)
- 第03章 [Fortran程序设计基础](./program/chap03)
- 第04章 [输入输出及声明](./program/chap04) [[习题解答](./ans/chap04)]
- 第05章 [流制控制与逻辑运算](./program/chap05) [[习题解答](./ans/chap05)]
- 第06章 [循环](./program/chap06) [[习题解答](./ans/chap06)]
- 第07章 [数组](./program/chap07) [[习题解答](./ans/chap07)]
- 第08章 [函数](./program/chap08) [[习题解答](./ans/chap08)]
- 第09章 [文件](./program/chap09) [[习题解答](./ans/chap09)]
- 第10章 [指针](./program/chap10) [[习题解答](./ans/chap10)]
- 第11章 [MODULE及面向对象](./program/chap11) [[习题解答](./ans/chap11)]
- 第12章 [编译器使用进阶](./program/chap12)
- 第13章 [电脑绘图](./program/chap13)
- 第14章 [数值方法](./program/chap14)
- 第15章 [数据结构与算法](./program/chap15)
- 第16章 [IMSL函数库](./program/chap16)
- 第17章 [Visual Fortran扩充功能](./program/chap17)

## 电子书

- 第01~16章 [[PDF](./book/Fortran95程序设计.pdf)]
- 第17章Visual Fortran扩充功能 [[PDF](./book/chap17.pdf)]


# Fortran用法总结

## 1、概述

### 1-1、Fortran的主要版本及差别
现在广泛使用的版本为Fortran 77和Fortran 90/95。Fortran 90/95在Fortran 77基础上添加了不少使用的功能，并且改良了77编程的版面格式，所以编程时推荐使用90/95。鉴于很多现成的程序只有77版本，有必要知道77的一些基本常识，至少保证能够看77程序。以下是77和90/95的一些格式上的区别：

- **Fortran 77**：固定格式（Fixed Format），程序代码扩展名：`*.F`, `*.f`, `*.for` 或 `*.f77`

  | 列数 | 说明 |
  | - | - |
  | 第1列 | 若某行以C, c或*开头，则该行被当成注释，不编译（注释区） |
  | 第1-5列 | 若是数字，则代表这一行程序的编号，否则只能是空格（行号区） |
  | 第6列 | 若是“0”以外的字符，则表示这一行接上一行（续行区） |
  | 第7-72列 | （代码编写区） |
  | 第73列以后 | 不使用，编译会忽略或出错 |

- **Fortran 90/95**：自由格式（Free Format），程序代码扩展名：`*.f90/95`
  - 以`!`引导注释；  
  - 每行可132字符，行代码放在每行最前面；  
  - 以`&`续行，放在该行末或下行初。

  以下都是讨论Fortran 90及95。

### 1-2、Fortran的一些特点，与C的一些不同
- Fortran**不区分大小写字母**；
- Fortran每句末尾不必要写分号；
- 不像C，Fortran不使用`{ }`；
- Fortran数据类型多出了**复数**和**逻辑判断类型**；
- Fortran多出了**乘幂**运算（`**`），乘幂除了整数还可以是实数形式，如开平方，开立方：`a=4.0**0.5, b=8.0**(1.0/3.0)`；
- Fortran中数组有一些整体操作的功能，可以方便的对部分元素进行操作；
- Fortran在有些情况下可以声明大小待定的数组，这是很实用的一项功能。 

### 1-3、Linux系统下gfortran编译与执行
- **编译命令**：`gfortran test.for`自动生成名称为`a.out`的可执行文件；指定输出名称可使用`gfortran test.f90 -o test.out`
- **运行命令**：`./test.out`

### 1-4、Fortran的基本程序结构
- Fortran程序通常以`PROGRAM+程序名`开头，以`END`结尾。以 “Hello Fortran” 程序为例：
  ```fortran
  program main           ! 程序开始，main是program的名字，完全自定义
    write(*,*) "Hello"   ! 主程序
    stop                 ! 终止程序
  end [program[main]]    ! end用于封装代码，表示代码编写完毕。[ ]中的内容可省略，下同
  ```

## 2、数据类型及基本输入输出

### 2-1、数据类型，声明及赋初值

- **整数INTEGER**：短整型`kind=2`，长整型`kind=4`
  ```fortran
  integer([kind=]2) :: a=3
  ```

  - 如果声明成`integer :: a`，则默认为长整型。  
  - `::`在声明并同时赋初值时必须要写上；类型名后面有形容词时也必须保留`::`；其他情况可略去。  
  - 所谓形容词，可以参照这个示例。比如声明常数：`real, parameter :: pi=3.1415926535`，则`parameter`就是形容词。 

- **实数REAL**：单精度`kind=4`（默认），双精度`kind=8`
  ```fortran
  real([kind=]8) :: a=3.0
  ```
  还有指数的形式，如`1E10`为单精度，`1D10`为双精度。

- **复数COMPLEX**：单精度和双精度
  ```fortran
  complex([kind=]4) b
  b=(1.0,2.0)          ! b=1+2i
  ```

- **字符及字符串CHARACTER**
  ```fortran
  character([len=]10) c      ! len为最大长度
  ```

- **逻辑判断LOGICAL**
  ```fortran
  logical*2 :: d=.true.      ! (等价于 logical(2) :: d=.true.)
  ```

- **自定义类型TYPE**：类似于C中的`struct`
  ```fortran
  type :: person                ! 创造一个叫person的数据类型
    character(len=30) :: name   ! 记录姓名
    integer :: age              ! 记录年龄
  end type person               ! 自定义数据类型结束

  type(person) :: a             ! 声明一个person类型的变量
  read(*,*) a%name
  write(*,*) a%name
  ```
 
  - Fortran 77中给变量赋初值常用`DATA`命令，可同时给多个变量赋初值：
    ```fortran
    data a,b,string /1,2.0,'fortran'/
    ```
  - 与C不同的是，Fortran中变量不声明也能使用，即有默认类型（跟`IMPLICIT`命令有关）。按照默认的定，以`I, J, K, L, M, N`开头的变量被定义为`INTEGER`，其余为`REAL`。取消该设置需在程序声明部分之前`implicit none`。
  - 另一点关于声明的不同是Fortran有“等价声明”：
    ```fortran
    integer a,b
    equivalence(a,b)
    ```

  - 使得`a,b`使用同一块内存。这样可以节省内存；有时可精简代码。如：`equivalence(很长名字的变量如三维数组的某个元素,a)`，之后使用`a`来编写程序就简洁多了。

### 2-2、基本输入输出

- **输入**：
  ```fortran
  read([unit=]5,[fmt=]*) a            ! 从键盘读入
                                      ! UNIT：输入设备（*表示默认值，等同于5，代表键盘）
                                      ! FMT：输入格式（*表示不赋值输入格式）
  ```
  同一行程序代码一次读入多个数值`read(*,*) a,b,c`。

- **输出**：
  ```fortran
  write([unit=]*,[fmt=]*) "text"      ! 在屏幕上输出。Fortran 77用'text'。Fortan 90中一般" "和' '都可
                                      ! UNIT：输出位置（*表示默认值，等同于6，代表屏幕）
                                      ! FMT：输出格式（*表示不限定格式）

  print *,"text"                      ! 只能用于屏幕输出
  ```
  - 每执行一次`write`，会自动换到下一行；  
  - 如要**输出双引号**，则连续使用两个双引号；  
  - 可**同时输出多个数据**，中间用逗号隔开，`write(6,*) 123,456.0`。

### 2-3、格式化输入输出（FORMAT）

“**I、F、E、A、X**”是最常用的几种格式：

  | 格式 | 说明 |
  | - | - |
  | I (Integer) | 整型 |
  | F (Float) | 小数 |
  | E | 科学计数法小数 |
  | A | 字符 |
  | X | 空格 |

- `Iw[.m]` 以`w`个字符长来输出整数，至少输出`m`个数字
  ```fortran
  write(*,"(I5.3)") 10        ! 以5个字符的长度来输出一个整数，至少输出3个数字，位数不足补0
  ```

- `Fw.d` 以`w`个字符长来输出实数，小数部分占`d`个字符
  ```fortran
  write(*,"(F9.3)") 123.45    ! 以9个字符的长度来输出实数，小数部分占3个位数
  ```

- `Ew.d[Ee]` 用科学技术法，以`w`个字符长来输出实数，小数部分占`d`个字符长，指数部分最少输出`e`个数字
  ```fortran
  write(*,"(E15.7)") 123.45   ! 使用15个字符长度，小数部分占7位
  ```

- `Aw` 以`w`个字符长来输出字符串
  ```fortran
  write(*,"(A10)") “Hello”    ! 使用10个字符长度输出字符串，总长度不足10位，前面补空格
  ```

- `nX` 输出位置向右移动`n`位（输出`n`个空格）
  ```fortran
  write(*,"(5X,I3)") 100      ! 先填5个空格，再输出整数
  ```

- `Lw` 以`w`个字符长来输出**T**或**F**的真假值
  ```fortran
  write(*,"(L4)") .true.      ! 使用4个字符长度输出逻辑变量，输出3个空格和1个T
  ```

- `Gw.d` 以`w`个字符长来输出所有类型的数据，`d`不一定会使用，但不能省略。用来输入/输出 字符/整数/逻辑数 时，`Gw.d=Aw/Iw/Lw`，`d`必须随便给一个数字，不能省略；用来输入/输出 实数 时，`Gw.d=Fw.d`或`Ew.d`
  ```fortran
  write(*,"(G11.2)") 123.45
  ```

- `/` 换行输出
  ```fortran
  write(*,"(I3//I3)") 10,10         ! /代表换行
  write(*,"(I3,/,/,I3)") 10,10      ! 可以中间加逗号
  ```

- `Tc` 把输出的位置移动到本行的第`c`个字符
  ```fortran
  write(*,"(T3,I3)") 100            ! 把输出位置移动到第3个字符
  ```

### 2-4、格式转换

  | 转为整型 | 转为单精度实型 | 转为双精度实型 |
  | :-: | :-: | :-: |
  | int | real | dble |

### 2-5、字符串函数

  | 字符串函数 | 解析说明 |
  | - | - |
  | CHAR(num) | 返回数值num在ASCII字符表中代表的字符 |
  | ICHAR(char) | 返回字符char在ASCII字符表中的编号 |
  | LEN(string) | 返回字符串string的声明长度 |
  | LEN_TRIM(string) | 返回字符串string去除尾端空格后的实际长度 |
  | TRIM(string) | 返回字符串string去除尾端空格后的字符串 |
  | INDEX(string, key[, .true.]) | 返回字符串key在string中第一次出现的位置，第三个变量为真则从右起 |
  | ADJUSTL(string) | 将字符串左端对齐，即去掉左端空格 |
  | ADJUSTR(string) | 将字符串右端对齐，即去掉右端空格 |

## 3、流程控制与逻辑运算

### 3-1、运算符

- 六个逻辑运算符

  | 等于 | 不等于 | 大于 | 大于等于 | 小于 | 小于等于 | 适用标准 |
  | - | - | - | - | - | - | - |
  | == | /= | > | >= | < | <= | Fortran 90用法 |
  | .EQ. | .NE. | .GT. | .GE. | .LT. | .LE. | Fortran 77用法 |

- 五个集合运算符

  | 逻辑与 | 逻辑或 | 逻辑非 | 逻辑等价 | 逻辑不等价 |
  | - | - | - | - | - |
  | .AND. | .OR. | .NOT. | .EQV. | .NEQV. |

  - 仅`.NOT.`连接一个表达式，其余左右两边都要有表达式（可以是`logical`类型的变量）；
  - `.EQV.` ：当两边逻辑运算值相同时为真；
  - `.NEQV.` ：当两边逻辑运算值不同时为真。

### 3-2、IF

- **基本**：
  ```fortran
  if (逻辑判断式) then
    ......
  end if 
  ```

  如果`then`后面只有一句，可写为：
  ```fortran
  if (逻辑判断式) ......      ! then 和 end if 可省略
  ```

- **多重判断**：
  ```fortran
  if (条件1) then
    ......
  else if (条件2) then
    ......
  else if (条件3) then
    ......
  else
    ......
  end if
  ```

- **嵌套**：
  ```fortran
  if (逻辑判断式) then
    if (逻辑判断式) then
      if (逻辑判断式) then
      else if (逻辑判断式) then
        ......
      else
        ...... 
      end if 
    end if
  end if
  ```

- **算术判断**：
  ```fortran
        program example

        implicit none
        real c

        write(*,*) "input a number"
        read(*,*) c
        if(c) 10,20,30      ! 10, 20和30为行代码，根据c小于/等于/大于0，执行10/20/30行的程序
   10   write(*,*) "A"
        goto 40             ! goto可实现跳到任意前面或后面的行代码处，但用多了破坏程序结构
   20   write(*,*) "B"
        goto 40
   30   write(*,*) "C"
        goto 40
   40   stop

        end program example
  ```

### 3-3、SELECT CASE

- 类似于C的`switch`语句：

  ```fortran
  select case (变量)
  case (数值1)      ! 比如case (1:5) 代表1<=变量<=5会执行该模块
    ......          ! case (1,3,5) 代表变量等于1或3或5会执行该模块
  case (数值2)      ! 括号中数值只能是integer, character或logical型常量，不能real型
    ......
  case default
    ......
  end select
  ```

### 3-4、PAUSE, CONTINUE, STOP  

- `pause`：暂停程序执行，按enter可继续执行。  
- `continue`：没有实际用途，可用作封装程序的标志。
- `stop`：结束程序执行。

## 4、循环

- **DO**
  ```fortran
  do counter=初值,终值,增/减量      ! counter的值从初值到终值按增/减量变，counter每取一个值对应着一次循环。
    ......                          ! 增/减量不写则认为1。循环主体也没有必要用{ } 
  end do
  ```

  Fortran 77中不是用`end do`来终止，而是下面这样子：
  ```fortran
  do 循环终行行代码 counter=初值,终值,增/减量 
    ......
  行代码 ......                     ! 这是do的最后一行
  ```

- **DO WHILE**
  ```fortran
  do while(逻辑运算)
    ......
  end do
  ```

  类似于C中的`while(逻辑运算) {......}`。  

- 没看到和C里面的`do{......} while(逻辑运算);` 相对应的循环语句。不过可以这样，保证至少做一循环：
  ```fortran
  do while(.ture.)
    ......
    if(逻辑运算) exit 
  end do
  ```

  **exit**就好比C里面的break。C里的continue在Fortran里是**cycle**。

- Fortran的一个特色：**带署名的循环**
  ```fortran
  outer: do i=1,3      ! 循环取名为outter
    inner: do j=1,3    ! 循环取名为inner
      ......
    end do inner
  end do outer
  ```

  或者：

  ```fortran
  loop1: do i=1,3
    loop2: do j=1,3
      if(i==3) exit loop1      ! exit终止整个循环loop1
      if(j==2) cycle loop2     ! cycle跳出loop2的本次循环，进行loop2的下次循环
      write(*,*) i,j
    end do loop2
  end do loop1
  ```

## 5、数组

### 5-1、数组的声明

- 和C不同的是，Fortran中的数组元素的索引值写在`( )`内，且高维的也只用一个`( )`，如：
  ```fortran
  integer a(5)                  ! 声明一个整型一维数组
  integer, dimension(5) :: a    ! 另一种方法
  real :: b(3,6)                ! 声明一个实型二维数组
  real, dimension(3,6) :: b     ! 另一种方法
  ```

  类型可以是`integer`, `real`, `character`, `logical`或`type`。最高可以到**7维**。  

- 数组大小必须为常数。但和C语言不同，Fortran也有办法使用大小可变的数组（**动态数组**），方法如：
  ```fortran
  integer, allocatable :: a(:)    ! 声明一维可变数组
  allocate(a(10),stat=error)      ! 配置内存空间（error是事先声明好的整型变量，执行allocate时会经由stat这个叙述传给error一个数值，
                                  ! 若error=0，则表示allocate数组成功，否则表示失败）
  deallocate(a)                   ! 释放内存空间
  ```

  之后该数组和通过一般方法声明的数组完全相同。  

- 与C不同，**Fortran索引值默认为从1开始**，而且可以在声明时改变该规则：
  ```fortran
  integer a(-3:1)       ! 索引值为-3,-2,-1,0,1
  integer b(2:3,-1:3)   ! b(2~3,-1~3)为可使用的元素
  ```
  
- 检查一个动态数组是否已经配置内存使用：
  ```fortran
  if(.not. allocated(a)) then
    allocate(a(5))
  end if
  ```

### 5-2、数组在内存中的存放

和C不同，Fortran中的数组比如`a(2,2)`在内存中存放顺序为`a(1,1),a(2,1),a(1,2),a(2,2)`。原则是先放低维的元素，再放高维的元素。此规则称为**column major（列优先）**。

### 5-3、赋初值

- **最普通的做法**：
  ```fortran
  integer a(5)
  data a /1,2,3,4,5/
  ```

  或者：
  
  ```
  integer :: a(5)=(/1,2,3,4,5/)      ! 若integer :: a(5)=5，则5个元素均为5
  ```

  对于`integer :: a(2,2)=(/1,2,3,4/)`，根据数组元素在内存中存放的方式，等价于赋值`a(1,1)=1,a(2,1)=2,a(1,2)=3,a(2,2)=4`。

- 利用Fortran的特色：**隐含式循环**。

  例子：
  ```fortran
  integer a(5)
  integer i
  data (a(i),i=2,4) /2,3,4/      ! (a(i),i=2,4)表示i从2到4循环，增量为默认值1
  ```
  
  或者：
  
  ```fortran
  integer i
  integer :: a(5)=(/1,(2,i=2,4),5/)      ! 五个元素分别赋值为1,2,2,2,5
  integer :: b(5)=(/i,i=1,5/)            ! 五个元素分别赋值为1,2,3,4,5
  ```

  还可以嵌套：
  ```fortran
  integer a(2,2)
  integer i,j
  data ((a(i,j),i=1,2),j=1,2) /1,2,3,4/  ! 里面括号的循环会先执行
                                         ! 结果为a(1,1)=1, a(2,1)=2, a(1,2)=3, a(2,2)=4
  ```

### 5-4、操作整个数组

- 设`a,b`为相同类型、维数和大小的数组：
  ```fortran
  a=5          ! 所有元素赋值为5
  a=(/1,2,3/)  ! 这里假设a为一维，a(1)=1,a(2)=2,a(3)=3
  a=b          ! 对应元素赋值，要求a,b,c维数和大小相同，下同
  a=b+c 
  a=b-c
  a=b*c
  a=b/c
  a=sin(b)     ! 内部函数都可以这样用
  ```

### 5-5、操作部分数组元素

- `a`为一维数组：
  ```fortran
  a(3:5)=(/3,4,5/)      ! a(3)=3,a(4)=4,a(5)=5
  a(1:5:2)=3            ! a(1)=3,a(3)=3,a(5)=3
  a(3:)=5               ! a(3)以及之后的所有元素赋值为5
  a(1:3)=b(4:6)         ! 类似于这种的要求左右数组元素个数相同
  a(:)=b(:,2)           ! a(1)=b(1,2), a(2)=b(2,2)，以此类推
  ```

### 5-6、WHERE

- `where`形式上类似于`if`，但只用于设置数组。设有两个同样类型、维数和大小的数组`a,b`：
  ```fortran
  where(a<3)
    b=a        ! a中小于3的元素赋值给b对应位置的元素
  end where 
  ```

- 再如：`where(a(1:3)/=0) c=a`，略去了`end where`，因为只跟了一行`where`可嵌，也可类似`do`循环有署名标签。

### 5-7、FORALL

- 有点像C中的`for`循环：
  ```fortran
  forall(triplet1[,triplet2[,triplet3…]],mask)
  ```

  其中`triplet`形如`i=2:6:2`，表示循环，最后一个数字省略则增量为1。例如：
  ```fortran
  forall(i=1:5,j=1:5,a(i,j)<10)
    a(i,j)=1
  end forall
  ```

- 又如： `forall(i=1:5,j=1:5,a(i,j)/=0) a(i,j)=1/a(i,j)`  
- `forall`也可以嵌套使用，好比C中`for`循环的嵌套。

## 6、函数

Fortran中函数分两类：子程序（subroutine）和自定义函数（function）。自定义函数本质上就是学上的函数，一般要传递自变量给自定义函数，返回函数值。子程序不一定是这样，可以没有返值。传递参数要注意类型的对应，这跟C是一样的。

### 6-1、子程序（SUBROUTINE）

- 目的：把某一段经常使用的有特定功能的程序独立出来，可以方便调用。习惯上一般都把子程序放在主程序结束之后。  
- 形式：
  ```fortran
  subroutine name (parameter1, parameter2) 
  ! 给子程序起一个有意义的名字。可以传递参数，子程序无返回值（与自定义函数不同之处）。括号内也可以空着，代表不传递参数。 
    implicit none 
    integer :: parameter1,parameter2    ! 需要定义一下接收参数的类型。
    ......                              ! 接下来的程序编写跟主程序没有任何区别。
    return                              ! 跟C不同，这里表示子程序执行后回到调用它的地方继续执行下面的程序。不一定放在最后。
                                        ! 可以放在子程序的其他位置，作用相同；子程序中return之后的部分不执行。还可省略不写。
  end [subroutine name]
  ```

- 调用：使用`call`命令直接使用，不需要声明。在调用处写：
  ```fortran
  call subroutine name(parameter1,parameter2)
  ```

  **注意点：**  
  - 子程序之间也可相互调用。直接调用就是了，像在主程序中调用子程序一样。  
  - 传递参数的原理和C中不同。Fortran里是传址调用(call by address/reference)，就是传递时用参数和子程序中接收时用的参数使用同一个地址，尽管命名可以不同。这样如果子程序的执行改子程序中接收参数的值，所传递的参数也相应发生变化。  
  - 子程序各自内部定义的变量具有独立性，类似于C。各自的行代码也具有独立性。因此各个子程序主程序中有相同的变量名、行代码号，并不会相互影响。

### 6-2、自定义函数（FUNCTION）

和子程序的明显不同在于：需要在主程序中声明之后才能使用。调用方式也有差别。另外按照惯例用函数不去改变自变量的值。如果要改变传递参数的值，习惯上用子程序来做。  
- 声明方式：
  ```fortran
  real, external :: function_name
  ```

- 一般自定义函数也是放在主程序之后。形式为：
  ```fortran
  function function_name(parameter1,parameter2)
    implicit none
    real :: parameter1,parameter2       ! 声明函数参数类型，这是必需的
    real :: function_name               ! 声明函数返回值类型，这是必需的
    ......
    function_name=......                ! 返回值的表达式，以函数名返回
    return                              ! 跟C不同，这里表示子程序执行后回到调用它的地方继续执行下面的程序。可以不写
  end 
  ```

- 也可以这样直接声明返回值类型，简洁些：
  ```fortran
  real function function_name(parameter1,parameter2)
    implicit none
    real :: parameter1,parameter2       ! 这个还是必需的
    ......
    function_name=......                ! 返回值表达式
    return
  end 
  ```

- 调用：
  ```fortran
  function_name(parameter1,parameter2)
  ```

  - 不需要call命令。  
  - 自定义函数可以相互调用。调用时也需要事先声明。  
  - 总之，调用自定义函数前需要做声明，调用子程序则不需要。

### 6-3、关于函数中的变量

- 注意类型的对应。Fortran中甚至可以传递数值常量，但只有跟函数定义的参数类型对应才会到想要的结果。如`call ShowReal(1.0)`就必须用1.0而不是1。  
- 传递数组参数，也跟C一样是传地址，不过不一定是数组首地址，而可以是数组某个指定元素地址。比如有数组`a(5)`，调用`call function(a)`则传递`a(1)`的地址，调用`call function(a(3))`则递`a(3)`的地址。  
- 多维数组作为函数参数，跟C相反的是，最后一维的大小可以不写，其他维大小必须写。这决于Fortran中数组元素column major的存放方式。  
- 在函数中，如果数组是接收用的参数，则在声明时可以用变量赋值它的大小，甚至可以不指定大小。例如：

  ```fortran
  subroutine Array(num,size)
    implicit none
    integer :: size
    integer num(size)      ! 可以定义一个数组，其大小是通过传递过来的参数决定的。这很实用。
    ......
    return
  end
  ！注意这里与在主程序中声明数组时，数组大小需要用常数来规定大小的规则不太一样，而这里也可以用参数变量赋值其数组大小。 
  ```

- `save`命令：将函数中的变量值在调用之后保留下来，下次调用此函数时该变量的值就是上次保的值。只要在定义时加上`save`就行：
    
  ```fortran
  integer, save :: a=1
  ```

- 传递函数（包括自定义函数、库函数、子程序都是可以的）。类似于C中的函数指针需要在主程序和调用函数的函数中都声明作为参数传递的函数。如：
  ```fortran
  real, external :: function      ! 自定义函数
  real, intrinsic :: sin          ! 库函数
  external sub                    ! 子程序
  ```

- 函数使用接口（interface）：一段程序模块。以下情况必需：  
  - 函数返回值为数组  
  - 指定参数位置来传递参数时  
  - 所调用的函数参数个数不固定  
  - 输入指标参数时  
  - 函数返回值为指针时  

### 6-4、全局变量

- 原理：根据声明时的相对位置关系而取用，不同与C中根据变量名使用。  
- 如果在主程序中定义：
  ```fortran
  integer :: a,b
  common a,b      ! 就是这样定义全局变量的
  ```

- 在子程序或自定义函数中定义：
  ```fortran
  integer :: c,d
  common c,d
  ```

  则`a`和`c`共用相同内存，`b`和`d`共用相同内存。   
- 全局变量太多时会很麻烦。可以把它们人为归类，只需在定义时在`common`后面加上区间名。如：
  ```fortran
  common /groupe1/ a, common /group2/ b
  ```

  这样使用时就不必把所有全局变量都列出来，再声明`common /groupe1/ c`就可以用`a`、`c`全局变量了。
    
- 可以使用`block data`程序模块。在主程序和函数中不能直接使用前面提到的`data`命令给全局变量赋初值。可以给它们各自赋初值；如果要使用`data`命令必须要这样：
  ```fortran
  block data [name]
  implicit none
    integer a,b,c
    real d,e
    common a b c
    common /group1/ d,e
    data a,b,c,d,e /1,2,3,4.0,5.0/
  end [block data [name]]
  ```

### 6-5、Module

Module不是函数。它用于**封装程序**模块，一般是把具有相关功能的函数及变量封装在一起。用法很单，但能提供很多方便，使程序变得简洁。比如使用全局变量不必每次都声明一长串，写在Module里调用就行了。Module一般写在主程序开始之前。  
- 形式：
  ```fortran
  module module_name
    ......
  end [module [module_name]]
  ```

- 使用：在主程序或函数中使用时，需要在声明之前先写上一行：
  ```fortran
  use module_name
  ```

  Module中有函数时必须在`contains`命令之后（即在某一行写上`contains`然后下面开始写函数，多所有函数都写在这个`contains`之后）。并且module中定义过的变量在module里的函数中可直接使用，函数之间也可以直接相互调用，连module中的自定义函数在被调用时也不用先声明。

### 6-6、include放在需要的任何地方，插入另外的文件（必须在同一目录下），如：

```fortran
include 'funcion.f90'
``` 

## 7、文件

### 7-1、文本文件

- Fortran里有两种读取文件的方式，对应于：**顺序读取**（用于文本文件）、**直接读取**（用于二进制文件）。 
  - 这里只摘录关于文本文件的读取，一般模式如下：
    ```fortran
    character(len=20) :: filenamein="in.txt", filenameout="out.txt"      ! 文件名
    logical alive
    integer :: fileidin=10, fileidout=20 
    ! 10，20是给文件编的号，除1，2，5，6的正整数都可，因为2、6是默认的输出位置（屏幕），1、5是默认的输入位置（键盘）
    integer :: error
    real :: in, out

    ! 下面这一段用于确认指定名字的文件是否存在
    inquire(file=filenamein, exist=alive)      ! 如果存在，alive赋值为0
    if(.NOT. alive) then
      write(*,*) trim(filenamein), " doesn't exist."      ! trim用于删去filenamein中字串 ! 后面的stop多余空格，输出时好看些
    end if

    open([unit=]fileidin, file=filenamein, status="old")
    open([unit=]fileidout, file=filenameout[,status="new"])
    ! unit指定输入/输出的位置。打开已有文件一定要用status="old"；打开新文件用status="new"；
    ! 不指定status，则默认status="unknown"，覆盖已有文件或打开新文件...

    read([unit=]fileidin,[fmt=]100,iostat=error) in      ! error=0表示正确读入数据
    100 format(1X,F6.3) 
    ! 按一定格式输入输出，格式可以另外写并指定行代码，也可以直接写在read/write中
    write(([unit=]fileidout,"(1X,F6.3)") out 
    close(fileidin)
    close(fileidout)
    ! 1X代表一个空格。F6.3代表real型数据用占6个字符（含小数点），其中小数点后三位
    ! 常用的还有I3，用于整型数据，共占三个字符；A8，字符型，占8个字符。换行用 /
    ```

  - 二进制文件的读取有所不同，不再列举。

### 7-2、内部文件

- 另一个很实用的读写功能是内部文件（internal file）。看这个例子就明白了：
  ```fortran
  integer :: a=1, b=2
  character(len=20) :: string
  write(unit=string, fmt="(I2,'+',I2,'=',I2)") a,b,a+b
  write(*,*) string
  ```

  则结果输出1+2=3。反过来也是可以的：
  
  ```fortran
  integer a
  character(len=20) :: string="123"
  read(string,*)a
  write(*,*)a
  ```

  则输出123。
