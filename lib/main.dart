import 'package:flutter/material.dart';
import 'package:path_provider_poc/module/recording_mobile.dart' if (dart.library.html) 'package:path_provider_poc/module/recording_web.dart';

void main() {
  runApp(const FilePickerApp());
}

class FilePickerApp extends StatefulWidget {
  const FilePickerApp({super.key});

  @override
  State<FilePickerApp> createState() => _FilePickerAppState();
}

class _FilePickerAppState extends State<FilePickerApp> {
  String? os;
  String? path;
  List<String>? fileList = [''];

  @override
  void initState() {
    super.initState();
    initEnv();
  }

  void initEnv() async {
    os = getOS();
    path = await getSavePath();
    setState(() {
      os;
      path;
    });
  }

  void getFileList() async {
    fileList = await searchFileList();
    setState(() {
      fileList;
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
              child: Text('local file I/O PoC'),
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
              const IconButton(
                onPressed: recording,
                icon: Icon(
                  Icons.mic,
                  size: 60,
                ),
              ),
              Text(fileList!.isNotEmpty ? fileList!.first : ''),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: getFileList,
                        child: const Text('search file list'),
                      ),
                      const TextButton(
                        onPressed: stop,
                        child: Text('stop'),
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
