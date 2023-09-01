VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "VB App"
   ClientHeight    =   4740
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4155
   LinkTopic       =   "Form1"
   ScaleHeight     =   4740
   ScaleWidth      =   4155
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "计算随机数数列"
      Height          =   495
      Left            =   720
      TabIndex        =   7
      Top             =   4080
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "转成大写"
      Height          =   495
      Left            =   720
      TabIndex        =   6
      Top             =   2280
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   240
      TabIndex        =   5
      Text            =   "ABC"
      Top             =   1560
      Width           =   3495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "计算圆面积"
      Height          =   375
      Left            =   720
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   720
      TabIndex        =   0
      Text            =   "1"
      Top             =   480
      Width           =   975
   End
   Begin VB.Label Label4 
      Height          =   495
      Left            =   240
      TabIndex        =   8
      Top             =   3360
      Width           =   3495
   End
   Begin VB.Label Label3 
      Height          =   375
      Left            =   2640
      TabIndex        =   4
      Top             =   480
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "圆面积"
      Height          =   255
      Left            =   1920
      TabIndex        =   3
      Top             =   480
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "半径"
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   480
      Width           =   375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function Circle_Area Lib "forlib.dll" (r As Single) As Single
Private Declare Sub MAKELOWER Lib "forlib.dll" (ByVal s As String, ByVal i As Long)
Private Declare Function SUM Lib "forlib.dll" (r As Long) As Long
  
Private Sub Command1_Click()
  Dim r As Single
  Dim a As Single
  r = Val(Text1.Text)
  a = Circle_Area(r)
  Label3 = Str(a)
End Sub

Private Sub Command2_Click()
  Dim s As String
  s = Text2.Text
  Call MAKELOWER(s, Len(s))
  Text2.Text = s
End Sub

Private Sub Command3_Click()
  Dim a(10) As Long
  Dim i As Long
  Dim total As Long
  
  For i = 0 To 9
    a(i) = Rnd() * 9 + 1
  Next i
  
  Label4.Caption = Str(a(0))
  For i = 1 To 9
    Label4.Caption = Label4.Caption + "+" + Str(a(i))
  Next i
  total = SUM(a(0))
  Label4.Caption = Label4.Caption + "=" + Str(total)
End Sub

