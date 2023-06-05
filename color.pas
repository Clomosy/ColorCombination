Var   
MyForm:TclForm;
TitleEdit: TClProEdit;
color1Pnl,color2Pnl,color3Pnl:TclProPanel;
FirstImg,SecondImg,ThirdImg:TclProImg;
OnlyLayout,genderLyt:TclLayout;
color1Lbl,color2Lbl,color3Lbl:TclProLabel;
firstColor,lastColor:string;
MaleBtn,femaleBtn:TcLProButton;
genderState:integer;
myObject : TclProLabel;


procedure SetEdit;
begin
  TitleEdit := MyForm.AddNewProEdit(MyForm,'TitleEdit','Kombinini Seçemedin Mi?');
  clComponent.SetupComponent(TitleEdit,'{"Align" : "MostTop", "Height":55,"RoundHeight":13,
  "RoundWidth":13,"BorderColor":"#f5f5f5","BorderWidth":4,"MarginLeft":30, "MarginRight":30}');
  TitleEdit.enabled:=False;
end;

  
  function GenerateRandomHexColor: string;
  var
    Red, Green, Blue: Byte;
  begin
    Red := clMath.GenerateRandom(0,256);
    Green := clMath.GenerateRandom(0,256);
    Blue := clMath.GenerateRandom(0,256);
    //Result := Format('#%.2x%.2x%.2x', [Red, Green, Blue]);
    Result := '#' + IntToHex(Red, 2) + IntToHex(Green, 2) + IntToHex(Blue, 2); // Convert each value to a 2-digit hexadecimal string and concatenate them
  end;

  Procedure color1PnlOnClick;
  var
    rndmColor:string;
  begin
    
    rndmColor := GenerateRandomHexColor;
    firstColor := rndmColor;
    clComponent.SetupComponent(color1Pnl,'{"BackgroundColor":"'+rndmColor+'"}');
    color1Lbl.Text := rndmColor; 
    clComponent.SetupComponent(color1Lbl,'{"TextColor":"'+rndmColor+'"}');
    
    
  end;
  Procedure color2PnlOnClick;
  var
    rndmColor:string;
  begin
    rndmColor := GenerateRandomHexColor;
    clComponent.SetupComponent(color2Pnl,'{"BackgroundColor":"'+rndmColor+'"}');
    color2Lbl.Text := rndmColor;
    clComponent.SetupComponent(color2Lbl,'{"TextColor":"'+rndmColor+'"}');
  end;
  Procedure color3PnlOnClick;
  var
    rndmColor:string;
  begin
    rndmColor := GenerateRandomHexColor;
    lastColor := rndmColor;
    clComponent.SetupComponent(color3Pnl,'{"BackgroundColor":"'+rndmColor+'"}');
    color3Lbl.Text := rndmColor;
    clComponent.SetupComponent(color3Lbl,'{"TextColor":"'+rndmColor+'"}');
  end;
  //her labelin kendi renk kodu kopyalansın!!!!
  procedure copy;
  begin
    clUtils.SaveToClipBoard(myObject.Text);
    ShowMessage ('Kopyalandı');
    
  
  end;
  Procedure color1LblOnClick;
begin
    myObject:=color1Lbl ;
    copy;
  end;
    Procedure color2LblOnClick;
  begin
    myObject:=color2Lbl ;
    copy;
  end;
    Procedure color3LblOnClick;
  begin
    myObject:=color3Lbl ;
    copy;
  end;
  
  
  procedure genderdetermination;
  begin
  if genderState=1 then
              begin
              clComponent.SetupComponent(FirstImg,'{"ImgUrl":"https://clomosy.com/illustration/erkekust.png"}');
              clComponent.SetupComponent(SecondImg,'{"ImgUrl":"https://clomosy.com/illustration/erkekalt.png"}');
              clComponent.SetupComponent(ThirdImg,'{"ImgUrl":"https://clomosy.com/illustration/erkekayakkabi.png"}');
              end
              else
              begin
              clComponent.SetupComponent(FirstImg,'{"ImgUrl":"https://clomosy.com/illustration/kizust.png"}');
              clComponent.SetupComponent(SecondImg,'{"ImgUrl":"https://clomosy.com/illustration/kizalt.png"}');
              clComponent.SetupComponent(ThirdImg,'{"ImgUrl":"https://clomosy.com/illustration/kizayakkabi.png"}');
              
              end;
  end;
  Procedure MaleBtnOnClick;
  begin
              genderState:=1;
              genderdetermination;
              
             
  end;
       Procedure FemaleBtnOnClick;
  begin
        genderState:=0;
        genderdetermination;
        
  end;
  

begin
  MyForm := TclForm.Create(Self);
  SetEdit;
  
//...........Layout.............//

OnlyLayout := MyForm.AddNewLayout(MyForm,'OnlyLayout');
OnlyLayout.Align:=alClient;
OnlyLayout.Margins.Top:=50;
OnlyLayout.Margins.Bottom:=100;


//............Paneller..........//

  firstColor := '#5e61ff';
  color1Pnl:=MyForm.AddNewProPanel(OnlyLayout,'color1Pnl');
  clComponent.SetupComponent(color1Pnl,'{"Align" : "MostTop",
  "Height":140,"BackgroundColor":"#5e61ff"}');
  MyForm.AddNewEvent(color1Pnl,tbeOnClick,'color1PnlOnClick');
  
  color1Lbl := MyForm.AddNewProLabel(color1Pnl,'color1Lbl','#5e61ff');
  clComponent.SetupComponent(color1Lbl,'{"Align" : "Right","MarginTop":80,"RoundHeight":10,
  "RoundWidth":10,"BorderColor":"null","BorderWidth":2,"BackgroundColor":"#ffffff",
  "TextColor":"#AF1B3F","TextSize":20,"TextHorizontalAlign":"center","TextBold":"yes"}');
  MyForm.AddNewEvent(color1Lbl,tbeOnClick,'color1LblOnClick');
  
  
  FirstImg := MyForm.AddNewProImage(color1Pnl,'FirstImg');
  clComponent.SetupComponent(FirstImg,'{"Align" : "Client","BorderColor":"null","BackgroundColor":"null",
  "ImgUrl":"https://clomosy.com/illustration/erkekust.png"}');
  //MyForm.AddNewEvent(FirstImg,tbeOnClick,'color1LblOnClick');
  
  //---------------------------------------------------------------------------
  
  
  color2Pnl:=MyForm.AddNewProPanel(OnlyLayout,'color2Pnl');
  clComponent.SetupComponent(color2Pnl,'{"Align" : "Top",
  "Height":140,"BackgroundColor":"#AF1B3F"}');
  MyForm.AddNewEvent(color2Pnl,tbeOnClick,'color2PnlOnClick');
  
  color2Lbl := MyForm.AddNewProLabel(color2Pnl,'color2Lbl','#AF1B3F');
  clComponent.SetupComponent(color2Lbl,'{"Align" : "Right","MarginTop":80,"RoundHeight":10,
  "RoundWidth":10,"BorderColor":"null","BorderWidth":2,"BackgroundColor":"#ffffff",
  "TextColor":"#AF1B3F","TextSize":20,"TextHorizontalAlign":"center","TextBold":"yes"}');
  MyForm.AddNewEvent(color2Lbl,tbeOnClick,'color2LblOnClick');
  
  SecondImg := MyForm.AddNewProImage(color2Pnl,'SecondImg');
  clComponent.SetupComponent(SecondImg,'{"Align" : "Client","BorderColor":"null",
  "BackgroundColor":"null","ImgUrl":"https://clomosy.com/illustration/erkekalt.png"}');
  
  //---------------------------------------------------------------------------
  
  color3Pnl:=MyForm.AddNewProPanel(OnlyLayout,'color3Pnl');
  clComponent.SetupComponent(color3Pnl,'{"Align" : "Top",
  "Height":140,
  "BackgroundColor":"#01FDF6"}');
  MyForm.AddNewEvent(color3Pnl,tbeOnClick,'color3PnlOnClick');
  lastColor := '#01FDF6';
  
  color3Lbl := MyForm.AddNewProLabel(color3Pnl,'color3Lbl','#01FDF6');
  clComponent.SetupComponent(color3Lbl,'{"Align" : "Right","MarginTop":80,"RoundHeight":10,
  "RoundWidth":10,"BorderColor":"null","BorderWidth":2,"BackgroundColor":"#ffffff",
  "TextColor":"#AF1B3F","TextSize":20,"TextHorizontalAlign":"center","TextBold":"yes"}');
  MyForm.AddNewEvent(color3Lbl,tbeOnClick,'color3LblOnClick');
  
    ThirdImg := MyForm.AddNewProImage(color3Pnl,'ThirdImg');
  clComponent.SetupComponent(ThirdImg,'{"Align" : "Client","BorderColor":"null","BackgroundColor":"null",
  "ImgUrl":"https://clomosy.com/illustration/erkekayakkabi.png"}');
 
 //..............................................................................//
  
   
    genderLyt := MyForm.AddNewLayout(MyForm,'testLayout');
    genderLyt.Align:=alBottom;
    genderLyt.Height := 65;
    genderLyt.Width := 270;
    genderLyt.Margins.Top := 20;
    genderLyt.Margins.Left := 90;
    genderLyt.Margins.Right := 90;
    genderLyt.Margins.Bottom := 40;
 
    MaleBtn := MyForm.AddNewProButton(genderLyt,'MaleBtn','');
   clComponent.SetupComponent(MaleBtn,'{"Align" : "left","Width" :80, 
  "Height":50,"BorderColor":"#ffffff","BackgroundColor":"#689bca", "BorderWidth":1,"RoundHeight":10,"RoundWidth":10,
  "ImgUrl":"https://clomosy.com/educa/male.png", "ImgFit":"yes"}');
  

 
  MyForm.AddNewEvent(MaleBtn,tbeOnClick,'MaleBtnOnClick');
 
  femaleBtn := MyForm.AddNewProImage(genderLyt,'femaleBtn');
  clComponent.SetupComponent(femaleBtn,'{"Align" : "right","Width" :80,
 "Height":50,"BorderColor":"#ffffff","BackgroundColor":"#cd5c5c", "BorderWidth":1,"RoundHeight":10,"RoundWidth":10,
    
  "ImgUrl":"https://clomosy.com/educa/female.png", "ImgFit":"yes"}');
    
  MyForm.AddNewEvent(femaleBtn,tbeOnClick,'FemaleBtnOnClick');
  
  
  MyForm.SetFormBGImage('https://clomosy.com/educa/bg1.png');
  
 MyForm.Run;
end;
