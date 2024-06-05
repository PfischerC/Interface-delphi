unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TFrmLogin = class(TForm)
    LayoutCircle: TLayout;
    Circle: TCircle;
    AnimationCircle: TFloatAnimation;
    Button1: TButton;
    LayoutLogin: TLayout;
    LayoutLoginCampos: TLayout;
    LayoutLoginTexto: TLayout;
    Layout1: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    RoundRect1: TRoundRect;
    Label3: TLabel;
    Layout2: TLayout;
    Label4: TLabel;
    RoundRect2: TRoundRect;
    RoundRect3: TRoundRect;
    Edit1: TEdit;
    Edit2: TEdit;
    RoundRect4: TRoundRect;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AnimationCircleFinish(Sender: TObject);
  private
    procedure PosicionaObjetos;
    procedure Animar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}
 procedure TFrmLogin.Animar;
  begin
    AnimationCircle.Start;
  end;


procedure TFrmLogin.AnimationCircleFinish(Sender: TObject);
begin
  AnimationCircle.Inverse	:= NOT  AnimationCircle.Inverse;
end;

procedure TFrmLogin.Button1Click(Sender: TObject);
begin
   Animar;
end;

procedure TFrmLogin.FormResize(Sender: TObject);
begin
  PosicionaObjetos;
end;

procedure TFrmLogin.PosicionaObjetos;
begin
  if LayoutCircle.Width	>= LayoutCircle.Height	 then
  begin
     Circle.width := LayoutCircle.Width * 1.5;
     Circle.height := Circle.width;
     Circle.Margins.Bottom	 := Circle.Width * 0.30;

     AnimationCircle.PropertyName := 'Margins.Right';
     AnimationCircle.StartValue := Circle.Width;
     AnimationCircle.StopValue := -Circle.Width;

     if NOT AnimationCircle.Inverse	 then
        Circle.Margins.Right :=  AnimationCircle.StartValue
        else
        Circle.Margins.Right :=  AnimationCircle.StopValue;


          LayoutLoginTexto.Align := TALignLayout.Left;		

        LayoutLoginTexto.Width := LayoutCircle.Width	 / 2;
        	
        LayoutLoginCampos.Width := LayoutCircle.Width	 / 2;
        LayoutLoginCampos.Align	:= 	TALignLayout.Right;
  end
   else
   begin
     Circle.height := LayoutCircle.height* 1.5;
     Circle.width := Circle.height;
     Circle.Margins.Right := 0;

     AnimationCircle.PropertyName := 'Margins.bottom';
     AnimationCircle.StartValue := Circle.Width * 1.10;
     AnimationCircle.StopValue := -Circle.Width * 1.10;

     if NOT AnimationCircle.Inverse	 then
        Circle.Margins.Bottom :=  AnimationCircle.StartValue * 1.10
        else
        Circle.Margins.Bottom :=  AnimationCircle.StopValue * 1.10;

        LayoutLoginTexto.Align := TALignLayout.Top;	 
        LayoutLoginTexto.Height	:= 200;
        	
        LayoutLoginCampos.Align	:= 	TALignLayout.client;
   end;

end;


end.