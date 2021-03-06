unit ClockUnit;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls;

type
   TFormClock = class(TForm)
      ImgClockFon: TImage;
      TimerClock: TTimer;
      TimeLabel: TLabel;
      procedure TimerClockTimer(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private 
    { Private declarations }
   public 
      StartTime: TTime;
   end;


implementation

{$R *.dfm}

procedure TFormClock.FormCreate(Sender: TObject);
begin
   ImgClockFon.Picture.LoadFromFile('ClockFon.bmp');
   StartTime := Time;
end;

procedure TFormClock.TimerClockTimer(Sender: TObject);
begin
   TimeLabel.Caption := '0' + TimeToStr(Time - StartTime);
end;

end.