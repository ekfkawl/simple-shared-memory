object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #54028#51068' '#47588#54609' '#44061#52404' '#49373#49457' & '#51069#44592'/'#50416#44592
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 128
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 177
    Height = 89
    Caption = 'Read'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 16
    Width = 169
    Height = 89
    Caption = 'Write'
    TabOrder = 1
    OnClick = Button2Click
  end
end
