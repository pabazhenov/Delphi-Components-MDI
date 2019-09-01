object Form1: TForm1
  Left = 205
  Top = 134
  Width = 171
  Height = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object WindowBtnBox: TGroupBox
    Left = 8
    Top = 0
    Width = 145
    Height = 289
    Caption = #1057#1086#1079#1076#1072#1085#1085#1099#1077' '#1086#1082#1085#1072
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 120
    object N1: TMenuItem
      Caption = #1054#1082#1085#1086
      object AddWindowMenu: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = AddWindowMenuClick
      end
      object CloseLastWindowMenu: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1077#1077
        OnClick = CloseLastWindowMenuClick
      end
      object CloseMenu: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = CloseMenuClick
      end
      object CloseAllMenu: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
        OnClick = CloseAllMenuClick
      end
    end
  end
end
