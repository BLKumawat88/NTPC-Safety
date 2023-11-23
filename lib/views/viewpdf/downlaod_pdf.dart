import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';

import '../../controller/all_in_provider.dart';

class DownloadingDialog extends StatefulWidget {
  final String urlOfPdf;
  final String pdfNameURl;
  const DownloadingDialog(
      {Key? key, required this.urlOfPdf, required this.pdfNameURl})
      : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  // Future<String> _getFilePath(String filename) async {
  //   final dir = await getApplicationSupportDirectory();
  //   return "${dir.path}/$filename";
  // }

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage) &&
            await _requestPermission(Permission.accessMediaLocation) &&
            await _requestPermission(Permission.manageExternalStorage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";

          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/NTPCAPP";

          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        // return false;
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
          });
        }).then((value) => Navigator.pop(context));
        // if (Platform.isIOS) {
        //   await ImageGallerySaver.saveFile(saveFile.path,
        //       isReturnPathOfIOS: true);
        // }
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _requestPermission(Permission pr) async {
    var status = await pr.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future downlaodPDF(String url1) async {
    // var status = await Permission.storage.request();

    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.storage) &&
          await _requestPermission(Permission.accessMediaLocation) &&
          await _requestPermission(Permission.manageExternalStorage)) {
        Directory directory;
        final baseStorage = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = baseStorage!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath + "/NTPCAPP";

        directory = Directory(newPath);
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        try {
          await FlutterDownloader.enqueue(
            url: url1,
            headers: {}, // optional: header send with url (auth token etc)
            savedDir: directory.path,
            showNotification:
                true, // show download progress in status bar (for Android)
            openFileFromNotification:
                true, // click on notification to open downloaded file (for Android)
          );
        } catch (error) {}
      }
    } else {
      Directory _path = await getApplicationDocumentsDirectory();

      String _localPath = _path.path + Platform.pathSeparator + 'Download';

      final savedDir = Directory(_localPath);
      bool hasExisted = await savedDir.exists();
      if (!hasExisted) {
        savedDir.create();
      }
      try {
        await FlutterDownloader.enqueue(
          url: url1,
          headers: {}, // optional: header send with url (auth token etc)
          savedDir: savedDir.path,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );
      } catch (error) {}
    }
  }

  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    try {
      IsolateNameServer.registerPortWithName(
          _port.sendPort, 'downloader_send_port');
      _port.listen((dynamic data) {
        // String id = data[0];
        DownloadTaskStatus status = data[1];
        progress = data[2].toDouble();
        AllInProvider provider =
            Provider.of<AllInProvider>(context, listen: false);
        if (progress == -1.0) {
          Navigator.pop(context);
          provider.showSnakeBar(
              "This file already exists in Storage/NTPCAPP ", context);
        }

        if (status == DownloadTaskStatus.complete) {
          provider.showSnakeBar(
              "Your Data has been successfully Downloaded", context);
          Navigator.pop(context);
        }
        setState(() {});
      });
    } catch (error) {}

    FlutterDownloader.registerCallback(downloadCallback);
    downlaodPDF(widget.urlOfPdf);

    // saveVideo(widget.urlOfPdf, widget.pdfNameURl);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    try {
      final SendPort? send =
          IsolateNameServer.lookupPortByName('downloader_send_port');
      send!.send([id, status, progress]);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    // String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $progress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
