Attribute VB_Name = "Module1"
Option Explicit

Sub ReplaceTexts()
    With ActiveWindow.Selection.Find
        .Text = "酸"
        .MatchFuzzy = False  ' ワイルドカードを利用するときはあいまい検索をオフにする
        .MatchWildcards = True  ' ワイルドカード指定で検索
        ' 検索を実行
        Do While .Execute
            Dim p_foundStr As String
            p_foundStr = ActiveWindow.Selection.Range.Text
            Debug.Print p_foundStr
            ' 置換を実行
            ActiveWindow.Selection.Range.Text = "●"
        Loop
    End With
End Sub

Sub ReplaceTextsInShapes()
    ' 全シェイプオブジェクトに対してループ
    Dim p_shape As Variant
    For Each p_shape In ActiveWindow.Document.Shapes
        ' シェイプオブジェクトが描画キャンバスの場合
        If p_shape.Type = msoCanvas Then
            ' 描画キャンバス内のすべてのアイテムに対してループ
            Dim p_canvasShape As Variant
            For Each p_canvasShape In p_shape.CanvasItems
                ' グループ化されている場合は再度ループ
                If p_canvasShape.Type = msoGroup Then
                    Dim p_canvasGroupShape As Variant
                    For Each p_canvasGroupShape In p_canvasShape.GroupItems
                        ReplaceShapeTexts p_canvasGroupShape
                    Next p_canvasGroupShape
                Else
                    ReplaceShapeTexts p_canvasShape
                End If
            Next p_canvasShape
        
        ' オートシェイプがグループ化されている場合
        ElseIf p_shape.Type = msoGroup Then
            Dim p_groupShape As Variant
            For Each p_groupShape In p_shape.GroupItems
                ReplaceShapeTexts p_groupShape
            Next p_groupShape
            
        ' オートシェイプが単なるシェイプオブジェクトの場合
        Else
            ReplaceShapeTexts p_shape
        End If
    Next p_shape
End Sub

Private Sub ReplaceShapeTexts(ByRef x_shapes As Variant)
    ' テキストが含まれないオートシェイプなら処理を抜ける
    If Not x_shapes.TextFrame.HasText Then
        Exit Sub
    End If
    
    Dim p_range As Word.Range
    Dim p_find As Word.Find

    ' [NOTE] Rangeオブジェジェクトから生成したFindは
    '        検索文字が見つかる度に範囲が再構築される
    Set p_range = x_shapes.TextFrame.TextRange
    Set p_find = p_range.Find
    
    p_find.Text = "酸"
    p_find.MatchFuzzy = False  ' ワイルドカードを利用するときはあいまい検索をオフにする
    p_find.MatchWildcards = True  ' ワイルドカード指定で検索
    ' 検索を実行
    If p_find.Execute Then
        ' 見つかった文字を取得
        Dim p_foundStr As String
        p_foundStr = p_range.Text
        
        ' 置換を実行
        p_range.Text = "★"
    End If
End Sub


