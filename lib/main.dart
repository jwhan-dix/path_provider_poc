import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FilePickerApp());
}

class FilePickerApp extends StatefulWidget {
  const FilePickerApp({super.key});

  @override
  State<FilePickerApp> createState() => _FilePickerAppState();
}

class _FilePickerAppState extends State<FilePickerApp> {
  String os = '';
  String path = 'C:\\Users\\\${username}\\Downloads';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (kIsWeb) {
      os = 'web';
    } else {
      // os = Platform.operatingSystem;
    }
  }

  void setPath(String value) {
    setState(() {
      path = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: const Center(
              child: Text('local file I/O PoC in only web'),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'OS : $os',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Path : $path',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // local storage에 저장되어 있던 녹음 내용을 base64 형태로 변환
                          // 문제가 끝난 후 다음 문제로 넘어갈 때 다운로드 진행
                          // anchor 태그 click을 트리거 강제 실행

                          final blob = html.Blob(['base64 string 형식의 녹음 파일 내용']);

                          final url = html.Url.createObjectUrlFromBlob(blob);

                          html.AnchorElement(href: url)
                            ..setAttribute('download', 'example.txt')
                            ..click();

                          html.Url.revokeObjectUrl(url);

                          // 시험을 제출할 때
                        },
                        child: const Text('save file'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('upload file when complete of exam'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
