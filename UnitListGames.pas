unit UnitListGames;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, ExtCtrls;

type
   TFormListGames = class(TForm)
      sgListGames: TStringGrid;
      Choose: TImage;
      ChooseLabel: TLabel;
      UpData: TImage;
      UpDataLabel: TLabel;
      Remove: TImage;
      RemoveLabel: TLabel;
      procedure FormActivate(Sender: TObject);
      procedure RemoveLabelClick(Sender: TObject);
      procedure RemoveClick(Sender: TObject);
      procedure ChooseLabelClick(Sender: TObject);
      procedure ChooseClick(Sender: TObject);
      procedure UpDataLabelClick(Sender: TObject);
      procedure UpDataClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private 
    { Private declarations }
   public     
     { Public declarations }
   end;

var
   FormListGames: TFormListGames;

implementation

{$R *.dfm}

uses
   BoardCreateUnit, MenuUnit, CheckersLib;

var
   border: byte;

procedure TFormListGames.ChooseClick(Sender: TObject);
var
   i: byte;
begin
   with sgListGames do
      if Cells[0, row] <> '' then
      begin
         if (row <= border) then
         begin
            i := StrToInt(Cells[0, row][6]) - 1;
            Checkers[i].Visible := true;
            Checkers[i].Active := true;
            if (not Checkers[i].GameEnd) then
               with Checkers[i].FormClock do
               begin
                  TimerClock.Enabled := true;
                  StartTime := Time - StrToTime(TimeLabel.Caption);
                  Visible := true;
               end;
            Checkers[i].BringToFront;
            Close;
         end
         else
         begin
            i := 0;
            while (i < numberOfForms) and (Checkers[i] <> nil)  do
               inc(i);
            if i = numberOfForms then
            begin
               inc(numberOfForms);
               SetLength(Checkers, numberOfForms);
            end;
            MenuUnit.numberOfRecord := row - border - 1;
            MenuUnit.newGame := false;
            Application.CreateForm(TCheckers, Checkers[i]);
            with Checkers[i] do
            begin
               Show;
               oldX := Left;
               oldY := Top;
               FormClock.Left := Left + Width - 5;
               FormClock.Top := Top + 100;
               FormClock.Show;
               BringToFront;
            end;
            MenuUnit.newGame := true;
         end;
         Close;
      end;
end;

procedure TFormListGames.ChooseLabelClick(Sender: TObject);
begin
   ChooseClick(nil);
end;

procedure TFormListGames.FormActivate(Sender: TObject);
begin
   FormShow(nil);
end;

procedure TFormListGames.FormCreate(Sender: TObject);
begin
   with sgListGames do
   begin
      ColCount := 5;
      RowCount := 2;
      DefaultColWidth := 90;
      Cells[0, 0] := '���';
      Cells[1, 0] := '����� ����';
      Cells[2, 0] := '������';
      Cells[3, 0] := '������������';
      Cells[4, 0] := '����� ������';
   end;
   Choose.Picture.LoadFromFile('Button5.bmp');
   Choose.Transparent := true;
   ChooseLabel.Font.Color := Gold;
   UpData.Picture.LoadFromFile('Button5.bmp');
   UpData.Transparent := true;
   UpDataLabel.Font.Color := Gold;
   Remove.Picture.LoadFromFile('Button5.bmp');
   Remove.Transparent := true;
   RemoveLabel.Font.Color := Gold;
end;

procedure TFormListGames.FormShow(Sender: TObject);
var
   n, i, number: byte;
   myFile: file of TSavedGameF;
   savedGameF: TSavedGameF;
begin
   border := 0;
   sgListGames.RowCount := 2;
   for i := 0 to 4 do
      sgListGames.Cells[i, 1] := '';
   if NumberOfForms > 0 then
      for i := 0 to (NumberOfForms - 1) do
         if  (Checkers[i] <> nil) and not Checkers[i].Active then
            with sgListGames do
            begin
               inc(border);
               RowCount := border + 1;
               Cells[0, border] := '���� ' + IntToStr(i + 1);
               if Checkers[i].forOne then
                  case Checkers[i].maxDepth[2] of
                     0: Cells[1, border] := '�������';
                     2: Cells[1, border] := '��������';
                     4: Cells[1, border] := '�������';
                     6: Cells[1, border] := '�������';
                  end
               else
                  Cells[1, border] := '�� �����';
               if Checkers[i].GameEnd then
                  Cells[2, border] := '���������'
               else
                  Cells[2, border] := '�� ���������';
               Cells[3, border] := Checkers[i].FormClock.TimeLabel.Caption;
               Cells[4, border] := TimeToStr(Checkers[i].FormClock.StartTime);
            end;
   AssignFile(myFile, 'SavedGames.txt');
   Reset(myFile);
   number := FileSize(myFile);
   if (number > 0) then
   begin
      with sgListGames do
      begin
         for i := 0 to number - 1 do
         begin
            n := border + 1 + i;
            RowCount := n + 1;
            seek(myFile, i);
            read(myFile, savedGameF);
            Cells[0, n] := savedGameF.name;
            if savedGameF.forOneS then
               case savedGameF.maxDepthS of
                  0: Cells[1, n] := '�������';
                  2: Cells[1, n] := '��������';
                  4: Cells[1, n] := '�������';
                  6: Cells[1, n] := '�������';
               end
            else
               Cells[1, n] := '�� �����';
            if savedGameF.GameEndS then
               Cells[2, n] := '���������'
            else
               Cells[2, n] := '�� ���������';
            Cells[3, n] := savedGameF.duration;
            Cells[4, n] := TimeToStr(savedGameF.StartTimeS);
         end;
      end;
      CloseFile(myFile);
   end;
end;

procedure TFormListGames.RemoveClick(Sender: TObject);
var
   i, Res: integer;
   myFile: file of TSavedGameF;
   savedGameF: TSavedGameF;
begin
   with sgListGames do
   begin
      if Cells[0, row] <> '' then
      begin
         if (row <= border) then
         begin
            i := StrToInt(Cells[0, row][6]) - 1;
            Checkers[i].Close;
         end
         else
         begin
            Res := MessageBox(Self.Handle
               , PChar('�� ����� ������ ������� ����������� ����?')
               , PChar('�������������')
               , MB_YESNO + MB_ICONINFORMATION + MB_APPLMODAL);
            if Res = IDYES then
            begin
               AssignFile(myFile, 'SavedGames.txt');
               Reset(myFile);
               i := sgListGames.Row - border - 1;
               for i := i to fileSize(myFile) - 2 do
               begin
                  seek(myFile, i + 1);
                  read(myFile, savedGameF);
                  seek(myFile, i);
                  write(myFile, savedGameF);
               end;
               seek(myFile, filesize(myFile) - 1);
               truncate(myFile);
               closeFile(myFile);
            end;
         end;
         FormShow(nil);
      end;
   end;
end;

procedure TFormListGames.RemoveLabelClick(Sender: TObject);
begin
   RemoveClick(nil);
end;

procedure TFormListGames.UpDataClick(Sender: TObject);
begin
   FormShow(nil);
end;

procedure TFormListGames.UpDataLabelClick(Sender: TObject);
begin
   FormShow(nil);
end;

end.