var e = Editor;
var selectedString = e.GetSelectedString(0);
// �I����ԂȂ�
if (e.IsTextSelected() == 1) {
  var num = Number(selectedString);
  num--;
  e.Delete();
  e.InsText(num);
  // �I��͈͂̕���
  e.Left();
  e.SelectWord();
}
