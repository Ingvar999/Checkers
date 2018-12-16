object ReadName: TReadName
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1080#1075#1088#1099
  ClientHeight = 111
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Cancel: TImage
    Left = 16
    Top = 56
    Width = 140
    Height = 33
    OnClick = CancelClick
  end
  object Save: TImage
    Left = 168
    Top = 56
    Width = 140
    Height = 33
    OnClick = SaveClick
  end
  object CancelLabel: TLabel
    Left = 54
    Top = 62
    Width = 59
    Height = 22
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Monotype Corsiva'
    Font.Style = [fsItalic, fsUnderline]
    ParentFont = False
    Transparent = True
    OnClick = CancelLabelClick
  end
  object SaveLabel: TLabel
    Left = 196
    Top = 61
    Width = 81
    Height = 22
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Monotype Corsiva'
    Font.Style = [fsItalic, fsUnderline]
    ParentFont = False
    Transparent = True
    OnClick = SaveLabelClick
  end
  object NameEdit: TEdit
    Left = 32
    Top = 16
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'NameEdit'
  end
end
