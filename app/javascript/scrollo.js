$(document).ready(function() {
  // ページが読み込まれたらスクロール位置を一番下に設定
  scrollToBottom();
});

// メッセージを追加した後、スクロール位置を一番下に設定
function scrollToBottom() {
  var messagesContainer = $("#messages-container");
  var scrollHeight = messagesContainer[0].scrollHeight;
  messagesContainer.scrollTop(scrollHeight);
}