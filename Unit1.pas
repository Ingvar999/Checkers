unit Unit1;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, BoardCreateUnit, MenuUnit;

type
   TForm1 = class(TForm)
      maxDepthW: TEdit;
      maxDepthB: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      Start: TButton;
      First: TEdit;
      Label3: TLabel;
      Edit1: TEdit;
      Label4: TLabel;
      procedure StartClick(Sender: TObject);
   private 
    { Private declarations }
   public 
     { Public declarations }
   end;

var
   Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.StartClick(Sender: TObject);
var
   i: byte;
begin
   i := 0;
   while (i < numberOfForms) and (Checkers[i] <> nil)  do
      inc(i);
   if i = numberOfForms then
   begin
      inc(numberOfForms);
      SetLength(Checkers, numberOfForms);
   end;
   Application.CreateForm(TCheckers, Checkers[i]);
   with Checkers[i] do
   begin
      OnShortCut := ComputerGame;
      maxDepth[1] := StrToInt(maxDepthW.Text);
      maxDepth[2] := StrToInt(maxDepthB.Text);
      act := StrToInt(First.Text);
      StartGame.actS := act;
      with statistick do
      begin
         number := StrToInt(edit1.Text);
         whiteWin := 0;
         blackWin := 0;
         nichja := 0;
      end;
      Caption := maxDepthW.Text + ' - ' + maxDepthB.Text
       + '  (Игра ' + IntToStr(i + 1) + ')';
      FormClock.Caption := FormClock.Caption + '  (Игра ' + IntToStr(i + 1) + ')';
      Show;
      oldX := Left;
      oldY := Top;
      FormClock.Left := Left + Width - 5;
      FormClock.Top := Top + 100;
      FormClock.Show;
      BringToFront;
   end;
end;

end.