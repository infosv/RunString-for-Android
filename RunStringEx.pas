unit RunStringEx;
interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.StrUtils, FMX.Layouts,
  FMX.Menus,Generics.Collections, FMX.Types, FMX.Controls, System.UIConsts, FMX.Platform,
  FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Text;

//  ExtCtrls, StrUtils;// добавляем


type
  TRunStringEx = class(TLabel)
  private
    FTimer: TTimer;
    procedure MoveText(Sender: TObject);
    function GetSpeed: Integer;
    procedure SetSpeed(MSec: Integer);
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AutoSize;
    property Wordwrap;
    property Text;
    property Font;
    property Speed: Integer read GetSpeed write SetSpeed;
end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RunStringEx', [TRunStringEx]);
end;

constructor TRunStringEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTimer := TTimer.Create(Self);
  FTimer.OnTimer := MoveText;
  FTimer.Interval :=300;
  FTimer.Enabled := True;
end;

procedure TRunStringEx.MoveText(Sender: TObject);
begin
  Text := RightStr(Text, Length(Text)-1) + Text[1];
end;

function TRunStringEx.GetSpeed: Integer;
begin
  Result := FTimer.Interval;
end ;

procedure TRunStringEx.SetSpeed(MSec: Integer);
begin
  FTimer.Interval := MSec;
end;
end.
