
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

function Circle_Area(r: PSingle) : Single; stdcall; external 'forlib.dll';
function SUM(r: array of Longint) : Longint; stdcall; external 'forlib.dll';
procedure MAKELOWER(r: String; i:Longint); stdcall; external 'forlib.dll';
{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
  var s,a:Single;
begin
  s := StrToFloat(Edit1.text);
  a := Circle_Area(Addr(s));
  Label3.Caption := FloatToStr(a);
end;

procedure TForm1.Button1Click(Sender: TObject);
  var s:String;
begin
  s := Edit2.Text;
  MAKELOWER(s, Length(s) );
  Edit2.Text := s;
end;

procedure TForm1.Button3Click(Sender: TObject);
  var s: array [1..10] of Longint;
  var i,total: Longint;
begin
  for i:=1 to 10 do
  begin
    s[i]:=Random(9)+1;
  end;
  label4.Caption := IntToStr(s[1]);
  for i:=2 to 10 do
  begin
    label4.Caption := Label4.Caption + '+' + IntToStr(s[i]);
  end;
  total := SUM(s);
  Label4.Caption:=Label4.Caption+'='+IntToStr(total);
end;

end.
