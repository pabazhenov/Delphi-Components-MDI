unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    AddWindowMenu: TMenuItem;
    CloseLastWindowMenu: TMenuItem;
    CloseMenu: TMenuItem;
    CloseAllMenu: TMenuItem;
    WindowBtnBox: TGroupBox;
    procedure AddWindowMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure showHide(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CloseLastWindowMenuClick(Sender: TObject);
    procedure CloseAllMenuClick(Sender: TObject);
    procedure deleteSomeWindow(caption: String);
    procedure fillCreatedWindowsList();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  iterator,totalCount:Integer;
  startTopPosition:Integer;
implementation

uses Unit2;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  startTopPosition:=16;
  iterator:=1;
  totalCount:=0;
  if (not Assigned(Form2)) then
       Form2:=TForm2.Create(Form1);
  WindowBtnBox.Align:=alClient;
end;

procedure TForm1.deleteSomeWindow(caption: String);
begin
   WindowBtnBox.FindComponent('createdBtn'+caption).Free;
   dec(iterator);
end;

procedure TForm1.fillCreatedWindowsList();
var
  i:integer;
begin
  Form2.createdWindowsList.Items.Clear;
  for i:=0 to WindowBtnBox.ComponentCount-1 do
    Form2.createdWindowsList.Items.Add(
        (WindowBtnBox.Components[i] as TButton).Caption);
end;

procedure TForm1.AddWindowMenuClick(Sender: TObject);
var
  createdBtn: TButton;
  createdForm: TForm;
  memoFromCreatedForm: TMemo;
begin
  if not (iterator>11) then begin
    createdBtn:= TButton.Create(WindowBtnBox);
    createdBtn.Parent:=WindowBtnBox;
    createdBtn.Left:=8;
    createdBtn.Height:=25;
    createdBtn.Width:=129;
    createdBtn.onMouseDown:=showHide;
    createdBtn.Top:=startTopPosition+(iterator-1)*24;
    inc(iterator);
    inc(totalCount);
    createdBtn.Caption:=IntToStr(totalCount);
    createdBtn.Name:='createdBtn'+IntToStr(totalCount);
    // Создание формы
    createdForm:=TForm.Create(createdBtn);
    createdForm.ClientHeight:=232;
    createdForm.ClientWidth:=374;
    createdForm.top:=294;
    createdForm.Left:=543;
    createdForm.BorderIcons:=[];
    createdForm.Visible:=true;
    createdForm.Name:='createdForm'+IntToStr(totalCount);
    createdForm.Caption:=IntToStr(totalCount);
    memoFromCreatedForm:=TMemo.Create(createdForm);
    memoFromCreatedForm.Parent:=createdForm;
    memoFromCreatedForm.Width:=300;
    memoFromCreatedForm.Height:=200;
    memoFromCreatedForm.Align:=alClient;
    memoFromCreatedForm.WordWrap:=true;
    memoFromCreatedForm.Name:='memoFromCreatedForm';
    memoFromCreatedForm.Text:='';
    memoFromCreatedForm.ScrollBars:=ssVertical;
  end else begin
    showMessage('Нельзя создать еще одну форму. Максимальное количество: 11');
  end;

end;

procedure TForm1.showHide(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TButton then
    if Button=mbRight then begin
      if ((((Sender as TButton).Components[0]) as TForm).Visible) then
        (((Sender as TButton).Components[0]) as TForm).Visible:=false
      else (((Sender as TButton).Components[0]) as TForm).Visible:=true;
    end else
      if not (((Sender as TButton).Components[0]) as TForm).Focused
        and (((Sender as TButton).Components[0]) as TForm).visible then
          (((Sender as TButton).Components[0]) as TForm).SetFocus;
end;

procedure TForm1.CloseMenuClick(Sender: TObject);
begin
   Form2.visible:=true;
   fillCreatedWindowsList();

end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize:=False;
end;

procedure TForm1.CloseLastWindowMenuClick(Sender: TObject);
begin
  if (WindowBtnBox.ComponentCount>0) then begin
      (WindowBtnBox.Components[WindowBtnBox.ComponentCount-1] as TButton).Free;
       dec(iterator);
  end;
end;

procedure TForm1.CloseAllMenuClick(Sender: TObject);
var
  i:integer;
begin
    if (WindowBtnBox.ComponentCount>0) then begin
      for i:=0 to WindowBtnBox.ComponentCount-1 do
        (WindowBtnBox.Components[0] as TButton).Free;
      iterator:=1;
    end;
end;

end.
