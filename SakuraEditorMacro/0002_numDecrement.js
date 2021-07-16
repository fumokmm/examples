var e = Editor;
var selectedString = e.GetSelectedString(0);
// ‘I‘ğó‘Ô‚È‚ç
if (e.IsTextSelected() == 1) {
  var num = Number(selectedString);
  num--;
  e.Delete();
  e.InsText(num);
  // ‘I‘ğ”ÍˆÍ‚Ì•œŒ³
  e.Left();
  e.SelectWord();
}
