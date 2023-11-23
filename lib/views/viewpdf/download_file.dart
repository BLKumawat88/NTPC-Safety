// import 'dart:io';
// import 'dart:ui';
// import 'dart:isolate';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class DownloadFiles {
//   static ReceivePort _port = ReceivePort();

//   static Future downlaodPDF(String url1) async {
//     var status = await Permission.storage.request();
//     if (status.isGranted) {
//       Directory directory;
//       final baseStorage = await getExternalStorageDirectory();
//       String newPath = "";
//       List<String> paths = baseStorage!.path.split("/");
//       for (int x = 1; x < paths.length; x++) {
//         String folder = paths[x];
//         if (folder != "Android") {
//           newPath += "/" + folder;
//         } else {
//           break;
//         }
//       }
//       newPath = newPath + "/Ntpdownload";
//       directory = Directory(newPath);
//       if (!await directory.exists()) {
//         await directory.create(recursive: true);
//       }
//       await FlutterDownloader.enqueue(
//         url: url1,
//         headers: {}, // optional: header send with url (auth token etc)
//         savedDir: directory.path,

//         showNotification:
//             true, // show download progress in status bar (for Android)
//         openFileFromNotification:
//             true, // click on notification to open downloaded file (for Android)
//       );
//     }
//   }

//   static void downloadImageAndPDF(urlOfPdf) {
//     IsolateNameServer.registerPortWithName(
//         _port.sendPort, 'downloader_send_port');
//     _port.listen((dynamic data) {
//       // String id = data[0];
//       DownloadTaskStatus status = data[1];
//       // int progress = data[2];
//       if (status == DownloadTaskStatus.complete) {}
//     });

//     FlutterDownloader.registerCallback(downloadCallback);
//     downlaodPDF(urlOfPdf);
//   }

//   // @override
//   // void dispose() {
//   //   IsolateNameServer.removePortNameMapping('downloader_send_port');
//   //   super.dispose();
//   // }

//   @pragma('vm:entry-point')
//   static void downloadCallback(
//       String id, DownloadTaskStatus status, int progress) {
//     final SendPort? send =
//         IsolateNameServer.lookupPortByName('downloader_send_port');
//     send!.send([id, status, progress]);
//   }
// }
