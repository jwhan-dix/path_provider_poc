import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const PathProviderApp());
}

class PathProviderApp extends StatefulWidget {
  const PathProviderApp({super.key});

  @override
  State<PathProviderApp> createState() => _PathProviderAppState();
}

class _PathProviderAppState extends State<PathProviderApp> {
  String os = 'Web';
  String path = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (kIsWeb) {
      os = 'web';
    } else {
      os = Platform.operatingSystem;
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
              child: Text('path_provider PoC'),
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
                        onPressed: () async {
                          if (kIsWeb) {
                            setPath('Unsupported in Web.');
                            return;
                          }

                          final getAppCache = await getApplicationCacheDirectory();
                          setPath(getAppCache.path);
                        },
                        child: const Text(
                          'getAppCache',
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            setPath('Unsupported in Web.');
                            return;
                          }

                          final getAppDocu = await getApplicationDocumentsDirectory();
                          setPath(getAppDocu.path);
                        },
                        child: const Text('getAppDocument'),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            setPath('Unsupported in Web.');
                            return;
                          }

                          final getAppSupport = await getApplicationSupportDirectory();
                          setPath(getAppSupport.path);
                        },
                        child: const Text('getAppSupport'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            setPath('Unsupported in Web.');
                            return;
                          }

                          final downloads = await getDownloadsDirectory();
                          if (downloads != null) {
                            setPath(downloads.path);
                          } else {
                            setPath('there is no direcotry.');
                          }
                        },
                        child: const Text('getDownloads'),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            setPath('Unsupported in web.');
                            return;
                          }

                          if (Platform.isAndroid) {
                            setPath('Unsupported in android.');
                            return;
                          }
                          final library = await getLibraryDirectory();
                          setPath(library.path);
                        },
                        child: const Text('getLibrary'),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            setPath('Unsupported in Web.');
                            return;
                          }

                          final temporary = await getTemporaryDirectory();
                          setPath(temporary.path);
                        },
                        child: const Text('getTemporary'),
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
