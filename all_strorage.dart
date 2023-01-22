import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    MaterialApp(
      // home: FF(),
      home: allstorage(),
    ),
  );
}

class allstorage extends StatefulWidget {
  const allstorage({super.key});

  @override
  State<allstorage> createState() => _allstorageState();
}

class _allstorageState extends State<allstorage> {
  @override
  void initState() {
    // TODO: implement initState

    getStorageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 600,
              child: FutureBuilder(
                future: getStorageData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image(image: FileImage(snapshot.data[index]));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }

  getStorageData() async {
    //store file images
    List<File> imagesr = [];
    //permiton requst
    final status = await Permission.storage.status;
    if (status.isDenied) {
      final result = await Permission.storage.request();
      if (result != PermissionStatus.granted) {
        throw Exception('Storage permission not granted');
      }
    }

    final statust = await Permission.storage.status;
    if (statust == PermissionStatus.granted) {
      // access the directory

      try {
        try {
          List<FileSystemEntity> files =
              Directory('/storage/emulated/0/Download').listSync();

          for (FileSystemEntity file in files) {
            if (file is File &&
                (file.path.endsWith(".jpg") ||
                    file.path.endsWith(".jpeg") ||
                    file.path.endsWith(".png") ||
                    file.path.endsWith(".gif") ||
                    file.path.endsWith(".webp"))) {
              imagesr.add(file);
            }
          }
          print(imagesr);
        } on FileSystemException catch (e) {
          print("Error: $e");
        }
        setState(() {});
      } on FileSystemException catch (e) {
        print("Error: $e");
      }
    } else {
      // display an error message or request the permission again
    }

    return imagesr;
  }

}
