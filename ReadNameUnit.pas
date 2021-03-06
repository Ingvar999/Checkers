unit ReadNameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MenuUnit;

type
  TReadName = class(TForm)
    NameEdit: TEdit;
    Cancel: TImage;
    Save: TImage;
    CancelLabel: TLabel;
    SaveLabel: TLabel;
    procedure CancelLabelClick(Sender: TObject);
    procedure SaveLabelClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReadName: TReadName;

implementation

{$R *.dfm}

procedure TReadName.CancelClick(Sender: TObject);
begin
NameEdit.Text:='';
Close;
end;

procedure TReadName.CancelLabelClick(Sender: TObject);
begin
CancelClick(nil);
end;

procedure TReadName.FormCreate(Sender: TObject);
begin
NameEdit.Text:='';
Cancel.Picture.LoadFromFile('Button5.bmp');
Cancel.Transparent := true;
Save.Picture.LoadFromFile('Button5.bmp');
Save.Transparent := true;
CancelLabel.Font.Color:=Gold;
SaveLabel.Font.Color:=Gold;
end;

procedure TReadName.SaveLabelClick(Sender: TObject);
begin
SaveClick(nil);
end;

procedure TReadName.SaveClick(Sender: TObject);
begin
if (NameEdit.Text='') then
MessageBox(0, PChar('���������� ������ ��� ��� ����������� ����.'),
      PChar('��������������'), MB_OK)
      else
Close;
end;

end.
