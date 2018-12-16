object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 220
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 24
    Width = 32
    Height = 13
    Caption = #1041#1077#1083#1099#1077
  end
  object Label2: TLabel
    Left = 154
    Top = 24
    Width = 39
    Height = 13
    Caption = #1063#1105#1088#1085#1099#1077
  end
  object Label3: TLabel
    Left = 64
    Top = 93
    Width = 73
    Height = 13
    Caption = #1055#1077#1088#1074#1099#1077' '#1093#1086#1076#1103#1090
  end
  object Label4: TLabel
    Left = 64
    Top = 123
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object maxDepthW: TEdit
    Left = 64
    Top = 56
    Width = 57
    Height = 21
    TabOrder = 0
    Text = '4'
  end
  object maxDepthB: TEdit
    Left = 152
    Top = 56
    Width = 57
    Height = 21
    TabOrder = 1
    Text = '4'
  end
  object Start: TButton
    Left = 88
    Top = 152
    Width = 97
    Height = 33
    Caption = #1053#1072#1095#1072#1090#1100
    TabOrder = 2
    OnClick = StartClick
  end
  object First: TEdit
    Left = 152
    Top = 90
    Width = 57
    Height = 21
    TabOrder = 3
    Text = '1'
  end
  object Edit1: TEdit
    Left = 152
    Top = 120
    Width = 57
    Height = 21
    TabOrder = 4
    Text = '10'
  end
end
