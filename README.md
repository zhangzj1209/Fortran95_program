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

## Fortran用法总结

### 1、概述

#### *1-1、名词解释*
> Fortran = Formula Translator/Translation  

#### *1-2、Fortran的主要版本及差别*
> 按其发展历史，Fortran编译器的版本其实很多。现在在广泛使用的是Fortran 77和Fortran 90/95。Fortran 90/95在Fortran 77基础上添加了不少使用的功能，并且改良了77编程的版面格式，所以编程时推荐使用90/95。鉴于很多现成的程序只有77版本，有必要知道77的一些基本常识，至少保证能够看77程序。以下是77和90/95的一些格式上的区别。

Fortran 77：固定格式（fixed format），程序代码扩展名：.f或.for
> （1）若某行以C, c或*开头，则该行被当成注释；  
> （2）每行前六个字符不能写程序代码，可空着，或者1\~5字符以数字表明行代码（用作格式化输入出等）；7\~72为程序代码编写区；73往后被忽略；  
> （3）太长的话可以续行，所续行的第六个字符必须是”0”以外的任何字符。

Fortran 90/95：自由格式（free format），扩展名：.f90/95
> （1）以”!”引导注释；  
> （2）每行可132字符，行代码放在每行最前面；  
> （3）以\&续行，放在该行末或下行初。

以下都是讨论Fortran 90及95。

#### *1-3、Fortran的一些特点，与C的一些不同*
大致为：
> （1）不分大小写。  
> （2）每句末尾不必要写分号。  
> （3）程序代码命令间的空格没有意义。  
> （4）不像C，Fortran不使用\{ \}。  
> （5）数据类型多出了复数和逻辑判断类型。比如复数类型：
```fortran
complex :: a      ! 声明复数的方法。复数显然方便了科学计算，满足了工程方面需求
a = (1.0, 2.0)       ! a=1+i
```

> （6）多出了乘幂运算（\*\*）。乘幂除了整数还可以是实数形式。如开方，开立方：
```fortran
a = 4.0**0.5, b = 8.0**(1.0/3.0)
```

> （7）数组有一些整体操作的功能；可以方便的对部分元素进行操作。  
> （8）有些情况下可以声明大小待定的数组，这是很实用的一项功能。  

#### *1-4、Fortran的基本程序结构*
> 先看一看所谓的”Hello Fortran”程序：
```fortran
program main           ! 程序开始，main是program的名字，完全自定义
  write(*,*) "Hello"   ! 主程序
  stop                 ! 终止程序
end [program[main]]    ! end用于封装代码，表示代码编写完毕。[]中的内容可省略，下同。
```

> 再看一段用于计算圆柱的表面积的程序，要求输入底面半径和高。
```fortran
program cylinder      ! 给主函数起个名字

! Calculate the area of a cylinder.
! Declare variables and constants.
! constants = pi
! variables = radius squared and height
implicit none      ! Require all variables to be explicitly declared.
! 这个一般都是要写上的。下面会进一步说明。
  integer :: ierr
  character :: yn
  real :: radius, height, area
  real, parameter :: pi = 3.1415926536      ! 这是常量的声明方法

  interactive_loop: do      ! do循环，Fortran中的循环可以加标签，如do前面的interactive_loop就是标签

! Prompt the user for radius and height and read them.
    write (*,*) 'Enter radius and height.'       ! 屏幕输出
    read (*,*,iostat=ierr) radius, height        ! 键盘输入。isotat的值用判断输入成功否

! If radius and height could not be read from input, then cycle through the loop.
    if (ierr /= 0) then 
      write(*,*) 'Error, invalid input.'
      cycle interactive_loop      ! cycle 相当于C里的continue
    end if

! Compute area. The ** means "raise to a power."
    area = 2 * pi * (radius**2 + radius*height)      ! 指数运算比C方便

! Write the input variables (radius, height) and output (area) to the screen. 
    write (*,'(1x,a7,f6.2,5x,a7,f6.2,5x,a5,f6.2)') &      ! "&"表示续行。这里还显示了格式化输出
    'radius=', radius, 'height=', height, 'area=', area
    yn = ' '

    yn_loop: do      ! 内嵌的另一个do循环
      write(*,*) 'Perform another calculation? y[n]'
      read(*,'(a1)') yn
      if (yn=='y' .or. yn=='Y') exit yn_loop
      if (yn=='n' .or. yn=='N' .or. yn==' ') exit interactive_loop
    end do yn_loop      ! 结束内嵌do循环

  end do interactive_loop 

end program cylinder 
```
Fortran程序的主要结构就是这样了。一般还会有些module的部分在主函数前，函数在主函数后。

### 2、数据类型及基本输入输出

#### *2-1、数据类型，声明及赋初值*

（1）integer：短整型kind=2, 长整型kind=4
```fortran
integer([kind=]2) :: a = 3
```

> 如果声明成integer :: a，则默认为长整型。  
> *注意：*”::” 在声明并同时赋初值时必须要写上；类型名后面有形容词时也必须保留::；其他情况可略去。  
> 所谓形容词，可以看一下这个。比如声明常数：
```fortran
real, parameter :: pi = 3.1415926535
```
> parameter就是形容词。

（2）real：单精度kind=4（默认），双精度kind=8
```fortran
real([kind=]8) :: a = 3.0
```
> 还有指数的形式，如1E10为单精度，1D10为双精度

（3）complex：单精度和双精度
```fortran
complex([kind=]4) b
```

（4）character
```fortran
character([len=]10) c      ! len为最大长度
```

（5）logical
```fortran
logical*2 :: d = .ture.      ! (等价于logical(2) :: d = .ture.)
```

（6）自定义类型type：类似于C中的struct
> Fortran 77中给变量赋初值常用DATA命令，可同时给多个变量赋初值
```fortran
data a,b,string /1, 2.0, 'fortran'/
```
> 与C不同的是，Fortran中变量不声明也能使用，即有默认类型（跟implicit命令有关）。按照默认的定，以i, j, k, l, m, n开头的变量被定义为integer，其余为real。取消该设置需在程序声明部分之前`implicit none`。彭国伦建议一般都使用该语句。  
> 另一点关于声明的不同是Fortran有“等价声明”：
```fortran
integer a, b
equivalence(a, b)
```

> 使得a, b使用同一块内存。这样可以节省内存；有时可精简代码。如：equivalence\(很长名字的变量如三维数组的某个元素，a\)，之后使用a来编写程序就简洁多了。

#### *2-2、基本输入输出* 

输入：
```fortran
read(*,*) a      ! 从键盘读入 
```

输出：
```fortran
write(*,*) "text"      ! 在屏幕上输出。Fortran 77用'text'。Fortan 90中一般" "和' '都可
print *，"text"        ! 只能用于屏幕输出
```

> (\*,\*) 完整写为 (unit=\*,fmt=\*)  
> 其中unit为输入/输出位置，如屏幕，文件等；fmt为格式。如这两项都写成\*，则按默认的方式进行，即上面描述的。print后面的\*表示按默认格式输出。

### 3、流程控制

#### *3-1、运算符*

（1）六个关系运算符

| 等于 | 不等于 | 大于 | 大于等于 | 小于 | 小于等于 | 适用标准 |
| - | - | - | - | - | - | - |
| == | /= | > | >= | < | <= | Fortran 90用法 |
| .EQ. | .NE. | .GT. | .GE. | .LT. | .LE. | Fortran 77用法 |

（2）五大逻辑运算符

| 逻辑与 | 逻辑或 | 逻辑非 | 逻辑等价 | 逻辑不等价 |
| - | - | - | - | - |
| .AND. | .OR. | .NOT. | .EQV. | .NEQV. |

> *注意：* 仅.NOT.连接一个表达式，其余左右两边都要有表达式（可以是logical类型的变量）。  
> *注意：* .EQV.：当两边逻辑运算值相同时为真； .NEQV.：当两边逻辑运算值不同时为真。

#### *3-2、IF*

（1）基本：
```fortran
if (逻辑判断式) then
  ......
end if 
```

如果then后面只有一句，可写为：
```fortran
if (逻辑判断式) ......      ! then 和 end if 可省略
```

（2）多重判断：
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

（3）嵌套：
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

（4） 算术判断：
```fortran
      program example

      implicit none
      real c

      write (*,*) "input a number"
      read (*,*) c
      if(c) 10,20,30      ! 10, 20和30为行代码，根据c小于/等于/大于0，执行10/20/30行的程序
 10   write (*,*) "A"
      goto 40             ! goto可实现跳到任意前面或后面的行代码处，但用多了破坏程序结构
 20   write (*,*) "B"
      goto 40
 30   write (*,*) "C"
      goto 40
 40   stop

      end program example
```

#### *3-3、SELECT CASE*  

类似于C的switch语句

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

#### *3-4、PAUSE, CONTINUE*  

> pause暂停程序执行，按enter可继续执行  
> continue没有实际用途，可用作封装程序的标志

### 4、循环

（1）DO
```fortran
do counter=初值, 终值, 增/减量      ! counter的值从初值到终值按增/减量变，
  ......                            ! counter每取一个值对应着一次循环。增/减量不写则认为1
  ......                            ! 循环主体也没有必要用{}
end do
```

> Fortran 77中不是用end do来终止，而是下面这样子：
```fortran
do 循环终行行代码 counter=初值, 终值, 增/减量 
  ......
行代码 ......      ! 这是do的最后一行
```

（2）DO WHILE
```fortran
do while (逻辑运算)
  ......
end do
```

> 类似于C中的while\(逻辑运算\) \{......\}。  

（3）没看到和C里面的do\{......\}while\(逻辑运算\); 相对应的循环语句.

> 不过可以这样，保证至少做一循环：

```fortran
do while(.ture.)
   …… 
   …… 
   if(逻辑运算) exit 
end do
```

> exit就好比C里面的break。C里的continue在Fortran里是cycle

（4）Fortran的一个特色：带署名的循环

> 可以这样，不易出错：

```fortran
outer: do i=1,3 
inner: do j=1,3
    …… 
end do inner
end do outer
```

> 还可以这样，很方便：

```fortran
loop1: do i=1,3
loop2: do j=1,3
if(i==3) exit loop1 !exit终止整个循环loop1
if(j==2) cycle loop2 !cycle跳出loop2的本次循环，进行loop2的下次循环
write(*,*) i,j
end do loop2
end do loop1
```

> 还有一些循环主要用于Fortran中的数组运算，为Fortran特有，很实用。

  

## 五、数组

_1、数组的声明_

> 和C不同的是，Fortran中的数组元素的索引值写在（）内，且高维的也只用一个（），如

```fortran
integer a(5) !声明一个整型一维数组
real :: b(3,6) !声明一个实型二维数组
```

> 类型可以是integer, real, character, logical或type。最高可以到7维。  
> 数组大小必须为常数。但是和C语言不同，Fortran也有办法使用大小可变的数组，方法如：

```fortran
integer, allocatable :: a(:)
!声明小可变经过某个途径得知所需数组大小size之后，用下面的语句：
allocate(a(size)) !配置内存空间
```

> 之后该数组和通过一般方法声明的数组完全相同。  
> 与C不同，Fortran索引值默认为从1开始，而且可以在声明时改变该规则：

```fortran
integer a(-3:1) ! 索引值为-3，-2，-1，0，1
integer b(2:3,-1:3) !b(2~3,-1~3)为可使用的元素
```

_2、数组在内存中的存放_

> 和C不同，Fortran中的数组比如a\(2,2\)在内存中存放顺序为a\(1,1\),a\(2,1\),a\(1,2\),a\(2,2\)。原则是放低维的元素，再放高维的元素。此规则称为column major。

_3、赋初值_

（1）最普通的做法：

```fortran
integer a(5)
data a /1,2,3,4,5/
或integer :: a(5)=(/1,2,3,4,5/)
若integer :: a(5)=5，则5个元素均为5
```

> 对于integer :: a\(2,2\)=\(/1,2,3,4/\)  
> 根据数组元素在内存中存放的方式，等价于赋值  
> a\(1,1\)=1,a\(2,1\)=2,a\(1,2\)=3,a\(2,2\)=4

（2）利用Fortran的特色：隐含式循环。看例子就明白了。

```fortran
integer a(5)
integer i
data (a(i),i=2,4)/2,3,4/ !(a(i),i=2,4)表示i从2到4循环，增量为默认值1
```

> 还可以这样：

```fortran
integer i
integer :: a(5)=(/1,(2,i=2,4),5/) !五个元素分别赋值为1，2，2，2，5
integer :: b(5)=(/i, i=1,5/) !五个元素分别赋值为1，2，3，4，
```

> 还可以嵌套

```fortran
data ((a(i,j),i=1,2),j=1,2)=/1,2,3,4/ !//a(1,1)=1,1(2,1)=2,a(1,2)=3,a(2,2)=4
```

_4、操作整个数组_

> 设a，b为相同类型、维数和大小的数组

```fortran
a=5 !所有元素赋值为5
a=(/1,2,3/) !这里假设a为一维，a(1)=1,a(2)=2,a(3)=3
a=b !对应元素赋值，要求a,b,c维数和大小相同，下同
a=b+c 
a=b-c
a=b*c
a=b/c
a=sin(b) !内部函数都可以这样用
```

_5、操作部分数组元素_

> a为一维数组

```fortran
a(3:5)=(/3,4,5/) !a(3)=3,a(4)=4,a(5)=5
a(1:5:2)=3 !a(1)=3,a(3)=3,a(5)=3
a(3:)=5 !a(3)以及之后的所有元素赋值为5
a(1:3)=b(4:6) !类似于这种的要求左右数组元素个数相同
a(:)=b(:,2) !a(1)=b(1,2),a(2)=b(2,2)，以此类推
```

_6、WHERE_

> where形式上类似于if，但只用于设置数组。设有两个同样类型、维数和大小的数组a,b

```fortran
where(a<3)
    b=a !a中小于3的元素赋值给b对应位置的元素
end where 
```

> 再如：where\(a\(1:3\)/=0\) c=a \!略去了end where,因为只跟了一行where可嵌，也可类似do循环有署名标签。

_7、FORALL_

> 有点像C中的for循环：

```fortran
forall(triplet1[,triplet2 [,triplet3…]],mask)
```

> 其中triplet形如i=2：6：2，表示循环，最后一个数字省略则增量为1

```fortran
例如：
forall(i=1:5,j=1:5,a(i,j)<10)
    a(i,j)=1
end forall
```

> 又如： forall\(i=1:5,j=1:5,a\(i,j\)/=0\) a\(i,j\)=1/a\(i,j\)  
> forall也可以嵌套使用，好比C中for循环的嵌套。

## 六、函数

> Fortran中函数分两类：子程序（subroutine）和自定义函数（function）。自定义函数本质上就是学上的函数，一般要传递自变量给自定义函数，返回函数值。子程序不一定是这样，可以没有返值。传递参数要注意类型的对应，这跟C是一样的。

_1、子程序_

> 目的：把某一段经常使用的有特定功能的程序独立出来，可以方便调用。习惯上一般都把子程序放在主程序结束之后。  
> 形式：

```fortran
subroutine name (parameter1, parameter2) 
!给子程序起一个有意义的名字。可以传递参数，子程序无返回值与自定义函数不同之处。括号内也可以空着，代不传递参数。 
implicit none 
integer:: parameter1, parameter2 !需要定义一下接收参数的类型。
…… !接下来的程序编写跟主程序没有任何别。
…… 
return !跟C不同，这里表示子程序执行后回到调用它的地方继续执行下面的程序。不一定放在最后。
！可以放在子程序的其他位置，作用相同；子程序中return之后的部分不执行。还可省略不写
end [subroutine name]
```

> 调用：使用call命令直接使用，不需要声明。在调用处写：

```fortran
call subroutine name(parameter1,parameter2)
```

> 注意点：  
> a.子程序之间也可相互调用。直接调用就是了，像在主程序中调用子程序一样。  
> b.传递参数的原理和C中不同。Fortran里是传址调用\(call by address/reference\)，就是传递时用参数和子程序中接收时用的参数使用同一个地址，尽管命名可以不同。这样如果子程序的执行改子程序中接收参数的值，所传递的参数也相应发生变化。  
> c.子程序各自内部定义的变量具有独立性，类似于C。各自的行代码也具有独立性。因此各个子程序主程序中有相同的变量名、行代码号，并不会相互影响。

_2、自定义函数_

> 和子程序的明显不同在于：需要在主程序中声明之后才能使用。调用方式也有差别。另外按照惯例用函数不去改变自变量的值。如果要改变传递参数的值，习惯上用子程序来做。  
> 声明方式：

```fortran
real, external :: function_name
```

> 一般自定义函数也是放在主程序之后。  
> 形式：

```fortran
function function_name(parameter1, parameter2)
implicit none
real:: parameter1, parameter2 !声明函数参数类型，这是必需的
real::function_name !声明函数返回值类型，这是必需的
……
…… 
function_name=…. !返回值的表达式，以函数名返回
return !跟C不同，这里表示子程序执行后回到调用它的地方继续执行下面的程序。可以不写
end 
```

> 也可以这样直接声明返回值类型，简洁些：

```fortran
real function function_name(parameter1, parameter2)
implicit none
real:: parameter1, parameter2 !这个还是必需的
……
…… 
function_name=…. !返回值表达式
return
end 
```

> 调用：

```fortran
function_name(parameter1,parameter2)
```

> 不需要call命令。  
> 自定义函数可以相互调用。调用时也需要事先声明。  
> 总之，调用自定义函数前需要做声明，调用子程序则不需要。

_3、关于函数中的变量_

> （1）注意类型的对应。Fortran中甚至可以传递数值常量，但只有跟函数定义的参数类型对应才会到想要的结果。如call ShowReal\(1.0\)就必须用1.0而不是1。  
> （2）传递数组参数，也跟C一样是传地址，不过不一定是数组首地址，而可以是数组某个指定元素地址。比如有数组a\(5\)，调用call function\(a\)则传递a\(1\)的地址，调用call function\(a\(3\)\)则递a\(3\)的地址。  
> （3）多维数组作为函数参数，跟C相反的是，最后一维的大小可以不写，其他维大小必须写。这决于Fortran中数组元素column major的存放方式。  
> （4）在函数中，如果数组是接收用的参数，则在声明时可以用变量赋值它的大小，甚至可以不指定大小。例如：

```fortran
subroutine Array(num,size)
implicit none
integer:: size
integer num(size) !可以定义一个数组，其大小是通过传递过来的参数决定的。这很实用。
…… 
……
return
end
```

> ！注意这里与在主程序中声明数组时，数组大小需要用常数来规定大小的规则不太一样，而这里也可以用参数变量赋值其数组大小。  
> （5）save命令：将函数中的变量值在调用之后保留下来，下次调用此函数时该变量的值就是上次保的值。只要在定义时加上save就行：

```fortran
integer, save :: a=1
```

> （6）传递函数（包括自定义函数、库函数、子程序都是可以的）。类似于C中的函数指针需要在主程序和调用函数的函数中都声明作为参数传递的函数。如

```fortran
real, external :: function !自定义函数
real, intrinsic :: sin !库函数
external sub !子程序
```

> （7）函数使用接口（interface）：一段程序模块。以下情况必需：  
> a.函数返回值为数组  
> b.指定参数位置来传递参数时  
> c.所调用的函数参数个数不固定  
> d.输入指标参数时  
> e.函数返回值为指针时。  
> 具体用法结合例子容易看懂。例子都很长。看书吧。

_4、全局变量_

> 功能就不用说了。  
> 原理：根据声明时的相对位置关系而取用，不同与C中根据变量名使用。  
> 如果在主程序中定义：

```fortran
integer :: a,b
common a,b !就是这样定义全局变量的
```

> 在子程序或自定义函数中定义：

```fortran
integer :: c,d
common c,d
```

> 则a和c共用相同内存，b和d共用相同内存。  
> 全局变量太多时会很麻烦。可以把它们人为归类，只需在定义时在common后面加上区间名。如

```fortran
common /groupe1/ a, common /group2/ b。
```

> 这样使用时就不必把所有全局变量都列出来，再声明common /groupe1/ c就可以用a、c全局变量了。  
> 可以使用block data程序模块。在主程序和函数中不能直接使用前面提到的data命令给全局变量赋初值。可以给它们各自赋初值；如果要使用data命令必须要这样：

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

_5、Module_

> Module不是函数。它用于封装程序模块，一般是把具有相关功能的函数及变量封装在一起。用法很单，但能提供很多方便，使程序变得简洁，比如使用全局变量不必每次都声明一长串，  
> 写在Module里调用就行了。Module一般写在主程序开始之前。  
> 形式：

```fortran
module module_name
    ……
    ……
end [module [module_name]]
```

> 使用：在主程序或函数中使用时，需要在声明之前先写上一行：

```fortran
use module_name.
```

> Module中有函数时必须在contains命令之后（即在某一行写上contains然后下面开始写函数，多所有函数都写在这个contains之后）。并且module中定义过的变量在module里的函数中可直接使用，函数之间也可以直接相互调用，连module中的自定义函数在被调用时也不用先声明。

_6、include放在需要的任何地方，插入另外的文件\(必须在同一目录下\)。如：_

```fortran
include 'funcion.f90'
```

  

## 七、文件

_1、文本文件_

> Fortran里有两种读取文件的方式，对应于两种文件  
> 顺序读取：用于文本文件  
> 直接读取：用于二进制文件  
> 这里只摘录关于文本文件的读取。一般模式如下。

```fortran
character(len=20)::filenamein="in.txt", filenameout="out.txt" !文件名
logical alive
integer::fileidin=10,fileidout=20 
!10，20是给文件编的号，除1，2，5，6的正整数都可，因为2、6是默认的输出位置（屏幕），1、5是默认的输入位置（键盘）
integer::error
real::in,out

!下面这一段用于确认指定名字的文件是否存在
inquire(file=filenamein, exist=alive) !如果存在，alive赋值为0
if(.NOT. alive) then
    write(*,*) trim(filenamein), " doesn't exist."!trim用于删去filenamein中字串!后面的stop多余空格，输出时好看些
end if

open([unit=]fileidin, file=filenamein, status="old")
open([unit=]fileidout,file=filenameout[,status="new"])
!unit指定输入/输出的位置。打开已有文件一定要用status="old"；打开新文件用status="new"；
!不指定status，则默认status="unknown"，覆盖已有文件或打开新文件……

read([unit=]fileidin, [fmt=]100,iostat=error )in !error=0表示正确读入数据。
100 format(1X,F6.3) 
!按一定格式输入输出，格式可以另外写并指定行代码，也可以直接写在read/write中
write(([unit=]fileidout, "(1X,F6.3)")out 
close(fileidin)
close(fileidout)
!1X代表一个空格。F6.3代表real型数据用占6个字符（含小数点），其中小数点后三位。
!常用的还有I3，用于整型数据，共占三个字符；A8，字符型，占8个字符。换行用 /
```

> 二进制文件的读取有所不同。不再列举。

_2、内部文件_

> 另一个很实用的读写功能是内部文件（internal file）。看看这个例子就明白了。

```fortran
integer::a=1,b=2
character(len=20)::string
write(unit=string,fmt="(I2,'+',I2,'=',I2)")a,b,a+b
write(*,*)string
```

> 则结果输出1+2=3。反过来也是可以的：

```fortran
integer a
character(len=20)::string="123"
read(string,*)a
write(*,*)a
```

> 则输出123。

## 完\~
