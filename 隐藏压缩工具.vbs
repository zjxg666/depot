Set ars = WScript.Arguments
If ars.Count=0 Then Msgbox "直接把需要压缩的文件拖动到这个上面吧- -！" : WScript.Quit
If ars.Count<2 Then Msgbox "必须要给我两个文件我才能开始压缩嘛TVT" : WScript.Quit
If ars.Count>2 Then Msgbox "我只需要两个文件就够了哦，多了浪费呀～～" : WScript.Quit
With CreateObject("ADODB.Stream")
   .Type = 1
   .Mode = 3
   .Open
   .LoadFromFile(ars(0))
   f1 = .Read
   .LoadFromFile(ars(1))
   f2 = .Read
   .Position = 0
   ft1 = GFT(f1)
   ft2 = GFT(f2)
   If ft1<>ft2 And (ft1="RAR" Or ft2="RAR") And ft1<>"" And ft2<>"" Then
     If ft1<>"RAR" Then
       .Write f1
       .Write f2
       .SaveToFile ars(1) & "." & CLng(Time*10^6) & "." & ft1
     Else
       .Write f2
       .Write f1
       .SaveToFile ars(0) & "." & CLng(Time*10^6) & "." & ft2
     End If
   Else
     Msgbox "我需要的是一个图片文件(GIF PNG JPG BMP)和一个压缩包(RAR)哦。。。如果您传入的类型没错的话，可以试着换一张图片试试。。" : WScript.Quit
   End If
End With
Msgbox "压缩完成！。。。"

Function GFT(ByVal t1)
   t1 = LeftB(t1,1)
   Select Case AscB(t1)
     Case &H47
       GFT = "gif"
     Case &H89
       GFT = "png"
     Case &H42
       GFT = "bmp"
     Case &HFF
       GFT = "jpg"
     Case &H52
       GFT = "RAR"
   End Select
End Function
