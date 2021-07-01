' [�Q�l] https://tonari-it.com/excel-vba-utf8n-bom/

Sub output_utf8_1()
    ' [�Q�Ɛݒ�] Microsoft ActiveX Data Objects 6.1 Library\
    Dim p_stream As ADODB.Stream
    Set p_stream = New ADODB.Stream
    
    ' �����ݒ�
    With p_stream
        .Charset = "UTF-8" ' ���ꂾ������ UTF-8BOM�t�� �ɂȂ�c
        .Type = ADODB.StreamTypeEnum.adTypeText
        .LineSeparator = LineSeparatorEnum.adLF
    End With
    
    ' ��������
    With p_stream
        .Open
        .WriteText "abc", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "1234", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "����������", ADODB.StreamWriteEnum.adWriteLine
        .SaveToFile "C:\temp\UTF-8BOM�t��.txt", ADODB.SaveOptionsEnum.adSaveCreateOverWrite
        .Close
    End With
End Sub

Sub output_utf8_2()
    ' [�Q�Ɛݒ�] Microsoft ActiveX Data Objects 6.1 Library\
    Dim p_stream As ADODB.Stream
    Set p_stream = New ADODB.Stream
    
    ' �����ݒ�
    With p_stream
        .Charset = "UTF-8" ' ���ꂾ������ UTF-8BOM�t�� �ɂȂ�c
        .Type = ADODB.StreamTypeEnum.adTypeText
        .LineSeparator = LineSeparatorEnum.adLF
    End With
    
    ' ��������
    With p_stream
        .Open
        .WriteText "abc", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "1234", ADODB.StreamWriteEnum.adWriteLine
        .WriteText "����������", ADODB.StreamWriteEnum.adWriteLine
        
        ' �^�C�v���o�C�i���ɂ��āA�擪��3�o�C�g���X�L�b�v
        .Position = 0
        .Type = ADODB.StreamTypeEnum.adTypeBinary ' �^�C�v�ύX����ɂ�Position = 0�ł���K�v������
        .Position = 3
        ' �ꎞ�i�[�p
        Dim p_byteData() As Byte
        p_byteData = .Read
        .Close ' ��U����
        .Open ' �ēx�J����
        .Write p_byteData ' �X�g���[���ɏ�������
        
        .SaveToFile "C:\temp\UTF-8BOM�Ȃ�.txt", ADODB.SaveOptionsEnum.adSaveCreateOverWrite
        .Close
    End With
End Sub
