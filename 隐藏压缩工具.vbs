Set ars = WScript.Arguments
If ars.Count=0 Then Msgbox "ֱ�Ӱ���Ҫѹ�����ļ��϶�����������- -��" : WScript.Quit
If ars.Count<2 Then Msgbox "����Ҫ���������ļ��Ҳ��ܿ�ʼѹ����TVT" : WScript.Quit
If ars.Count>2 Then Msgbox "��ֻ��Ҫ�����ļ��͹���Ŷ�������˷�ѽ����" : WScript.Quit
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
     Msgbox "����Ҫ����һ��ͼƬ�ļ�(GIF PNG JPG BMP)��һ��ѹ����(RAR)Ŷ��������������������û��Ļ����������Ż�һ��ͼƬ���ԡ���" : WScript.Quit
   End If
End With
Msgbox "ѹ����ɣ�������"

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
