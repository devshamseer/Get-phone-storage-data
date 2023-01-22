# Get phone Storage Data 📱

## get flutteer phone storage data
| S | H | A | M | S | E | E | R |
|-|-|-|-|-|-|-|-|

   <img src="https://devshamseer.github.io/Get-phone-storage-data/Screenshot_1674384360.png" alt="Logo" width="400" height="900"> 
   
   





1. Add dependency
  ```sh
dependencies:
  permission_handler: ^10.2.0
  ```
  2. import package

  ```sh
import 'package:permission_handler/permission_handler.dart';
   ```
 
3. Add storage permission code and set storage path
  ```sh

  Filesr() async {
    var path;
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
          files.forEach((element) {
            path = element.toString().replaceAll('/storage/emulated/0/', '');
            print(path);
          });

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
  


  }
  ```
# Storage paths 💿
4. Root path
  
 ```sh
 Directory('/storage/emulated/0/')
  ```
  
 5. Download path 
  
 ```sh
 Directory('/storage/emulated/0/Download')
  ```
6. Camara path 📷
  
 ```sh
Directory('/storage/emulated/0/DCIM/Camera')
 ```
7. Movie path
  
```sh
Directory('/storage/emulated/0/Movies')
```
8. Music path
  
 ```sh
Directory('/storage/emulated/0/Music')
```
  
# Storage get full code 
  
```sh
import 'dart:io';
import 'dart:ui';
import 'package:just_audio/just_audio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

List<File> imagesr = [];
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    MaterialApp(
      // home: FF(),
      home:  FF(),
    ),
  );
}

class FF extends StatefulWidget {
  const FF({super.key});

  @override
  State<FF> createState() => _FFState();
}

class _FFState extends State<FF> {
  @override
  void initState() {
    // TODO: implement initState
    Filesr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Text('data'),
          ElevatedButton(
              onPressed: () async {
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
                          Directory('/storage/emulated/0/').listSync();

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
                // final Directory _photoDir = Directory('/storage/emulated/0/');
                //   var _photoDir = a Directory(path);
                // _photoDir.listSync().forEach((element) {
                //   print(element);
                // });
                //        var imageList = _photoDir.listSync().map((item) => item.path).where((
                // item) => item.endsWith(".jpg")).toList(growable: false);
              },
              child: Text('Audio')),
          ElevatedButton(
              onPressed: () async {
                final player = AudioPlayer(); // Create a player
                final duration = await player.setUrl(// Load a URL
                    'https://devshamseer.github.io/all-audio-songs/allsongs/sonng1.mp3'); // Schemes: (https: | file: | asset: )
                player.play();
              },
              child: Text('datarr')),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: imagesr.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(imagesr[index]))),
                    ),
                  );
                })),
          )
        ],
      )),
    );
  }

  Filesr() async {
    var path;
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
              Directory('/storage/emulated/0/DCIM/Camera').listSync();
          files.forEach((element) {
            path = element.toString().replaceAll('/storage/emulated/0/', '');
            print(path);
          });

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
  


  }
}
 ```
  
  
# Show file image
 
```sh
     Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                image: DecorationImage(image: FileImage(-IMAGE-PATH-))),
          ),

 ```
  
 # Show file song
 
```sh
 final player = AudioPlayer(); // Create a player
 final duration = await player.setUrl(// Load a URL
 -SONG-FILE-PATH-); // Schemes: (https: | file: | asset: )
  player.play();
),

```


 # Show file vidoes
 
```sh
import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

class PlayVideoFromNetwork extends StatefulWidget {
  const PlayVideoFromNetwork({Key? key}) : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.file(
        -FILE-PATH-,
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: controller),
    );
  }
}

```
  
  
# End happy hacking 😄
