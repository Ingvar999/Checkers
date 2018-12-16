program ProjectCheckers;

uses
  Forms,
  MenuUnit in 'MenuUnit.pas' {CheckersMenu},
  BoardCreateUnit in 'BoardCreateUnit.pas' {Checkers},
  ClockUnit in 'ClockUnit.pas' {FormClock},
  CheckersLib in 'CheckersLib.pas',
  UnitListGames in 'UnitListGames.pas' {FormListGames},
  ReadNameUnit in 'ReadNameUnit.pas' {ReadName},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCheckersMenu, CheckersMenu);
  Application.CreateForm(TFormListGames, FormListGames);
  Application.CreateForm(TReadName, ReadName);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
