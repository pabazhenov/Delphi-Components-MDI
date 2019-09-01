object Form2: TForm2
  Left = 376
  Top = 134
  Width = 178
  Height = 348
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1059#1076#1072#1083#1080#1090#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 84
    Height = 13
    Caption = #1057#1086#1079#1076#1072#1085#1085#1099#1077' '#1086#1082#1085#1072
  end
  object deleteSomeWindow: TButton
    Left = 8
    Top = 248
    Width = 145
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 0
    OnClick = deleteSomeWindowClick
  end
  object closeWindow: TButton
    Left = 8
    Top = 280
    Width = 145
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = closeWindowClick
  end
  object createdWindowsList: TListBox
    Left = 8
    Top = 24
    Width = 145
    Height = 217
    ItemHeight = 13
    TabOrder = 2
  end
end
