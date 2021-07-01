' [参考] https://tonari-it.com/excel-vba-utf8n-bom/

Sub output_utf8_1()
    ' [参照設定] Microsoft ActiveX Data Objects 6.1 Library\
    Dim p_stream As ADODB.Stream
    Set p_stream = New ADODB.Stream
    
    ' 初期設定
    With p_stream
        .Charset = "UTF-8" ' これだけだと UTF-8BOM付き になる…
        .Type = ADODB.StreamTypeEnum.adTypeText
        .LineSeparator = LineSeparatorEnum.adLF
    End With
    
    ' 書き込み
    With p_stream
        .Open
        .WriteText "abc", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "1234", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "あいうえお", ADODB.StreamWriteEnum.adWriteLine
        .SaveToFile "C:\temp\UTF-8BOM付き.txt", ADODB.SaveOptionsEnum.adSaveCreateOverWrite
        .Close
    End With
End Sub

Sub output_utf8_2()
    ' [参照設定] Microsoft ActiveX Data Objects 6.1 Library\
    Dim p_stream As ADODB.Stream
    Set p_stream = New ADODB.Stream
    
    ' 初期設定
    With p_stream
        .Charset = "UTF-8" ' これだけだと UTF-8BOM付き になる…
        .Type = ADODB.StreamTypeEnum.adTypeText
        .LineSeparator = LineSeparatorEnum.adLF
    End With
    
    ' 書き込み
    With p_stream
        .Open
        .WriteText "abc", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "1234", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "あいうえお", ADODB.StreamWriteEnum.adWriteLine
        
        ' タイプをバイナリにして、先頭の3バイトをスキップ
        .Position = 0
        .Type = ADODB.StreamTypeEnum.adTypeBinary ' タイプ変更するにはPosition = 0である必要がある
        .Position = 3
        ' 一時格納用
        Dim p_byteData() As Byte
        p_byteData = .Read
        .Close ' 一旦閉じて
        .Open ' 再度開いて
        .Write p_byteData ' ストリームに書き込む
        
        .SaveToFile "C:\temp\UTF-8BOMなし.txt", ADODB.SaveOptionsEnum.adSaveCreateOverWrite
        .Close
    End With
End Sub
