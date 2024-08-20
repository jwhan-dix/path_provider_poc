import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

late FlutterSoundRecorder recorder;
late String path;

String getOS() {
  return Platform.operatingSystem;
}

Future<String> getSavePath() async {
  final downloadDir = await getDownloadsDirectory();
  path = downloadDir!.path;

  return path;
}

Future<List<String>> searchFileList() async {
  final tmpDir = await getDownloadsDirectory();

  List<FileSystemEntity> entities = tmpDir!.listSync();

  List<String> fileList = [];
  entities.toList().whereType<File>().forEach((element) {
    fileList.add(element.toString());
  });

  return fileList;
}

void recording() async {
  await Permission.microphone.request();
  await Permission.storage.request();

  recorder = FlutterSoundRecorder();

  await recorder.openRecorder();
  await recorder.startRecorder(
    toFile: '$path/recording234.aac',
    codec: Codec.aacADTS,
  );
}

void stop() async {
  await recorder.stopRecorder();
  await recorder.closeRecorder();

  print('success - $path');
}
