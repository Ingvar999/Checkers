object Checkers: TCheckers
  Left = 195
  Top = 178
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1064#1072#1096#1082#1080
  ClientHeight = 620
  ClientWidth = 620
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object FonBoardImage: TImage
    Left = 0
    Top = 0
    Width = 620
    Height = 620
  end
  object ImgBoard: TImage
    Left = 30
    Top = 30
    Width = 560
    Height = 560
    OnClick = ImgBoardClick
  end
  object MainMenu: TMainMenu
    Left = 16
    Top = 296
    object Menu: TMenuItem
      Caption = #1052#1077#1085#1102
      object DelayingGame: TMenuItem
        Caption = #1054#1090#1083#1086#1078#1080#1090#1100' '#1080#1075#1088#1091
        OnClick = DelayingGameClick
      end
      object CheckersMenu: TMenuItem
        Caption = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
        OnClick = CheckersMenuClick
      end
      object CloseGame: TMenuItem
        Caption = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1080#1075#1088#1091
        OnClick = CloseGameClick
      end
      object Clock_on_off: TMenuItem
        Caption = #1063#1072#1089#1099'  ('#1074#1082#1083'.)'
        OnClick = Clock_on_offClick
      end
    end
    object Game: TMenuItem
      Caption = #1048#1075#1088#1072
      object MoveBack: TMenuItem
        Caption = #1061#1086#1076' '#1085#1072#1079#1072#1076
        OnClick = MoveBackClick
      end
      object Restart: TMenuItem
        Caption = #1047#1072#1085#1086#1074#1086
        OnClick = RestartClick
      end
      object SaveGame: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1075#1088#1091
        OnClick = SaveGameClick
      end
    end
    object Help: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object HelpProgram: TMenuItem
        Caption = #1054' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1080
        OnClick = HelpProgramClick
      end
      object HelpRule: TMenuItem
        Caption = #1055#1088#1072#1074#1080#1083#1072' '#1080#1075#1088#1099
        OnClick = HelpRuleClick
      end
    end
  end
end
