unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    deleteSomeWindow: TButton;
    closeWindow: TButton;
    createdWindowsList: TListBox;
    Label1: TLabel;
    procedure deleteSomeWindowClick(Sender: TObject);
    procedure closeWindowClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.deleteSomeWindowClick(Sender: TObject);
begin
  if (createdWindowsList.itemIndex>=0) then
    Form1.deleteSomeWindow(
        createdWindowsList.items[createdWindowsList.itemIndex]);
  Form1.fillCreatedWindowsList();
end;

procedure TForm2.closeWindowClick(Sender: TObject);
var
  i:integer;
begin
   Form2.Visible:=false;
   createdWindowsList.Items.Clear;
   for i:=0 to Form1.WindowBtnBox.ComponentCount-1 do begin
      (Form1.WindowBtnBox.Components[i] as TButton).Top:=16+(i)*24;
   end;
end;

procedure TForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
