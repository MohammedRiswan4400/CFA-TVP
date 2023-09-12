import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trappra_chat/model/const/const.dart';

import '../home/admin_home.dart';

class AdminBanner extends StatefulWidget {
  const AdminBanner({super.key});

  @override
  State<AdminBanner> createState() => _AdminBannerState();
}

class _AdminBannerState extends State<AdminBanner> {
  UploadTask? uploadTask;
  List<File> pickedFileImages = [];
  final picker = ImagePicker();

  Future<List<String>> uploadFile() async {
    List<String> imageUrlList = [];
    for (var imageFile in pickedFileImages) {
      final path = "files/${imageFile.path}";
      final file = File(imageFile.path);
      final ref = FirebaseStorage.instance.ref().child(path);

      setState(() {
        uploadTask = ref.putFile(file);
      });
      final snapshot = await uploadTask!.whenComplete(() {});

      final urlDownload = await snapshot.ref.getDownloadURL();
      // ignore: avoid_print
      print("Download Link: $urlDownload");

      setState(() {
        uploadTask = null;
      });
      imageUrlList.add(urlDownload);
    }
    return imageUrlList;
  }

  Future uploaFile() async {
    List<String> imageUrlList = [];
    for (var imageFile in pickedFileImages) {
      final path = "files/${imageFile.path}";
      final file = File(imageFile.path);
      final ref = FirebaseStorage.instance.ref().child(path);

      setState(() {
        uploadTask = ref.putFile(file);
      });
      final snapshot = await uploadTask!.whenComplete(() {});

      final urlDownload = await snapshot.ref.getDownloadURL();
      // ignore: avoid_print
      print("Download Link: $urlDownload");

      setState(() {
        uploadTask = null;
      });
      imageUrlList.add(urlDownload);
    }
    return imageUrlList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Banner"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              height: 200,
              // width: double.infinity,
              child: pickedFileImages.isEmpty
                  ? const Center(
                      child: Text(
                        "Add Image",
                      ),
                    )
                  : GridView.builder(
                      itemCount: pickedFileImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  FileImage(File(pickedFileImages[index].path)),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            TextButton(
              onPressed: () {
                chooseImage();
              },
              child: const Text(
                "Select image",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final imageUrlPath = await uploaFile();
                await addBanners(bannersPath: imageUrlPath);
                // buildProgress();
                // ignore: use_build_context_synchronously
                popNow(context);
              },
              child: const Text("Upload"),
            ),
            buildProgress()
          ],
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() {
      pickedFileImages.add(File(pickedFile.path));
    });
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;
            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    color: const Color.fromARGB(71, 0, 255, 132),
                  ),
                  Center(
                    child: Text(
                      "${(100 * progress).roundToDouble()}%",
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      );
}

// class BannerModel {
//   final List<dynamic> bannerImages;

//   BannerModel({
//     required this.bannerImages,
//   });

//   Map<String, dynamic> toJson() => {
//         "bannerImages": bannerImages,
//       };

//   static BannerModel fromJson(Map<String, dynamic> json) => BannerModel(
//         bannerImages: json["bannerImages"],
//       );
// }

Future addBanners({
  required List<String> bannersPath,
}) async {
  final docBanners =
      FirebaseFirestore.instance.collection("CFC").doc("Challengers Banners");

  final banners = BannerModel(
    bannerImages: bannersPath,
  );
  final json = banners.toJson();
  await docBanners.set(
    json,
  );
}
