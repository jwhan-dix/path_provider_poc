String getOS() {
  return 'web';
}

String getSavePath() {
  return 'C:\\Users\\\${username}\\Downloads';
}

List<String> searchFileList() {
  return ['C:\\Users\\\${username}\\Downloads'];
}

void recording() {
  // flutter_sound 사용 불가능
  // js구현체로 녹음 기능 사용?
  //

  print('call recording on web');
}

// 파일 다운로드
// print('call recording web');

// // local storage에 저장되어 있던 녹음 내용을 base64 형태로 변환
// // 문제가 끝난 후 다음 문제로 넘어갈 때 다운로드 진행
// // anchor 태그 click을 트리거 강제 실행

// final blob = html.Blob(['base64 string 형식의 녹음 파일 내용']);

// final url = html.Url.createObjectUrlFromBlob(blob);

// html.AnchorElement(href: url)
//   ..setAttribute('download', 'example.txt')
//   ..click();

// html.Url.revokeObjectUrl(url);

void stop() async {}
