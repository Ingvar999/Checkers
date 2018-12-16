unit MenuUnit;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, Menus;

type
   TCheckersMenu = class(TForm)
      FonImage: TImage;
      GameMode1: TImage;
      GameMode2: TImage;
      GameMode3: TImage;
      GameMode4: TImage;
      GameMode5: TImage;
      Exit: TImage;
      GameMode1Label: TLabel;
      GameMode2Label: TLabel;
      GameMode3Label: TLabel;
      GameMode4Label: TLabel;
      GameMode5Label: TLabel;
      ExitLabel: TLabel;
      Continue: TImage;
      ContinueLabel: TLabel;
      MainMenu: TMainMenu;
      Help: TMenuItem;
      HelpProgram: TMenuItem;
      HelpRule: TMenuItem;
      Arena: TMenuItem;
      procedure ArenaClick(Sender: TObject);
      procedure HelpProgramClick(Sender: TObject);
      procedure HelpRuleClick(Sender: TObject);
      procedure ContinueLabelClick(Sender: TObject);
      procedure ContinueClick(Sender: TObject);
      procedure ExitLabelClick(Sender: TObject);
      procedure GameMode5LabelClick(Sender: TObject);
      procedure GameMode4LabelClick(Sender: TObject);
      procedure GameMode3LabelClick(Sender: TObject);
      procedure GameMode2LabelClick(Sender: TObject);
      procedure GameMode1LabelClick(Sender: TObject);
      procedure ExitClick(Sender: TObject);
      procedure GameModeClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private 
    { Private declarations }
   public    
     { Public declarations }
   end;

const
   helpProgramText = 'Версия: 3.2.1.1' + #10#13 +
   'Внесение последних изменений: 02.07.2017' + #10#13 +
   'Разработчик: Шиманский И. Д., группа 651006';
   helpRuleText  = 'Првила игры "Русские шашки":' + #10#13 +
   'Первый ход делают белые. Шашки ходят только по клеткам' + #10#13 +
   'чёрного цвета. Простая шашка бьёт вперёд и назад, дамка ходит' + #10#13 +
   'и бьёт на любое поле диагонали. При наличии нескольких' + #10#13 +
   'вариантов боя можно выбрать любой из них. Если после взятия обычная' + #10#13 +
   'шашка достигает противоположного края доски, то повторное взятие невозможно.';

var
   CheckersMenu: TCheckersMenu;
   Gold: TColor;
   numberOfForms, numberOfRecord: byte;
   newGame: boolean;

implementation

{$R *.dfm}

uses
   BoardCreateUnit, UnitListGames, Unit1;

procedure TCheckersMenu.GameMode1LabelClick(Sender: TObject);
begin
   GameModeClick(GameMode1);
end;

procedure TCheckersMenu.GameMode2LabelClick(Sender: TObject);
begin
   GameModeClick(GameMode2);
end;

procedure TCheckersMenu.GameMode3LabelClick(Sender: TObject);
begin
   GameModeClick(GameMode3);
end;

procedure TCheckersMenu.GameMode4LabelClick(Sender: TObject);
begin
   GameModeClick(GameMode4);
end;

procedure TCheckersMenu.GameMode5LabelClick(Sender: TObject);
begin
   GameModeClick(GameMode5);
end;

procedure TCheckersMenu.GameModeClick(Sender: TObject);
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
      case StrToInt((Sender as TImage).Name[9]) of
         1:
            begin
               Caption := 'Шашки - Новичок';
               maxDepth[2] := 0;
               forOne := true;
            end;
         2:
            begin
               Caption := 'Шашки - Любитель';
               maxDepth[2] := 2;
               forOne := true;
            end;
         3:
            begin
               Caption := 'Шашки - Бывалый';
               maxDepth[2] := 4;
               forOne := true;
            end;
         4:
            begin
               Caption := 'Шашки - Эксперт';
               maxDepth[2] := 6;
               forOne := true;
            end;
         5: 
            begin
               Caption := 'Шашки - На двоих';
               forOne := false;
            end;
      end;
      statistick.number := 0;
      Caption := Caption + '  (Игра ' + IntToStr(i + 1) + ')';
      FormClock.Caption := FormClock.Caption + '  (Игра ' + IntToStr(i + 1) + ')';
      act := 1;
      Show;
      oldX := Left;
      oldY := Top;
      FormClock.Left := Left + Width - 5;
      FormClock.Top := Top + 100;
      FormClock.Show;
      BringToFront;
   end;
end;

procedure TCheckersMenu.HelpProgramClick(Sender: TObject);
begin
   MessageBox(0, PChar(helpProgramText),
            PChar('Справка'), MB_OK);
end;

procedure TCheckersMenu.HelpRuleClick(Sender: TObject);
begin
   MessageBox(0, PChar(helpRuleText),
            PChar('Справка'), MB_OK);
end;

procedure TCheckersMenu.ArenaClick(Sender: TObject);
begin
   Form1.Show;
end;

procedure TCheckersMenu.ContinueClick(Sender: TObject);
begin
   FormListGames.Show;
end;

procedure TCheckersMenu.ContinueLabelClick(Sender: TObject);
begin
   FormListGames.Show;
end;

procedure TCheckersMenu.ExitClick(Sender: TObject);
begin
   Close;
end;


procedure TCheckersMenu.ExitLabelClick(Sender: TObject);
begin
   Close;
end;

procedure TCheckersMenu.FormCreate(Sender: TObject);
begin
   newGame := true;
   FonImage.Picture.LoadFromFile('fon.bmp');
   GameMode1.Picture.LoadFromFile('Button1.bmp');
   GameMode1.Transparent := true;
   GameMode2.Picture.LoadFromFile('Button2.bmp');
   GameMode2.Transparent := true;
   GameMode3.Picture.LoadFromFile('Button3.bmp');
   GameMode3.Transparent := true;
   GameMode4.Picture.LoadFromFile('Button4.bmp');
   GameMode4.Transparent := true;
   GameMode5.Picture.LoadFromFile('Button5.bmp');
   GameMode5.Transparent := true;
   Exit.Picture.LoadFromFile('Button5.bmp');
   Exit.Transparent := true;
   Continue.Picture.LoadFromFile('Button5.bmp');
   Continue.Transparent := true;
   GameMode1.OnClick := GameModeClick;
   GameMode2.OnClick := GameModeClick;
   GameMode3.OnClick := GameModeClick;
   GameMode4.OnClick := GameModeClick;
   GameMode5.OnClick := GameModeClick;
   Gold := RGB(255, 200, 0);
   GameMode1Label.Font.Color := Gold;
   GameMode2Label.Font.Color := Gold;
   GameMode3Label.Font.Color := Gold;
   GameMode4Label.Font.Color := Gold;
   GameMode5Label.Font.Color := Gold;
   ExitLabel.Font.Color := Gold;
   ContinueLabel.Font.Color := Gold;
   numberOfForms := 0;
end;

end.