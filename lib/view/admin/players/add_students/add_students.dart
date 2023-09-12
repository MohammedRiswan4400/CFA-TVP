import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../model/colors/colors.dart';
import '../../../../model/const/const.dart';
import '../../../../model/student/student_widgets.dart';

class ScreenAddStudents extends StatefulWidget {
  const ScreenAddStudents({super.key});

  @override
  State<ScreenAddStudents> createState() => _ScreenAddStudentsState();
}

class _ScreenAddStudentsState extends State<ScreenAddStudents> {
  // String? imageUrlDownload;
  PlatformFile? pickedFile;
  String? imageUrlDownload;
  UploadTask? uploadTask;
  String profilePicture =
      'https://imgs.search.brave.com/jgS5uhrhK9WmK5GOPlozNP8HFnESxIYQeKgNFhFB8X0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1pY29uL3Vz/ZXJfMzE4LTU2MzY0/Mi5qcGc_c2l6ZT02/MjYmZXh0PWpwZw';

  @override
  Widget build(BuildContext context) {
    final batchController = TextEditingController();
    final uIdController = TextEditingController();
    final nameController = TextEditingController();
    final dobController = TextEditingController();
    final yearController = TextEditingController();
    final phoneController = TextEditingController();
    final dribblingAttackCampController = TextEditingController();
    final passingAttackCampController = TextEditingController();
    final receivingAttackCampController = TextEditingController();
    final headingAttackCampController = TextEditingController();
    final finishingAttackController = TextEditingController();
    final supportAttackingController = TextEditingController();
    final widthAttackingController = TextEditingController();
    final depthAttackingController = TextEditingController();
    final mobilityAttackingController = TextEditingController();
    final pressureDefendingController = TextEditingController();
    final delayDefendingController = TextEditingController();
    final tacklingDefendingController = TextEditingController();
    final headingDefendingController = TextEditingController();
    final clearenceDefendingController = TextEditingController();
    final coverDefendingController = TextEditingController();
    final balanceDefendingController = TextEditingController();
    final markingDefendingController = TextEditingController();
    final interceptionDefendingController = TextEditingController();
    final attitudeMentalController = TextEditingController();
    final toughnessMentalController = TextEditingController();
    final commitmentMentalController = TextEditingController();
    final preseveranceMentalController = TextEditingController();
    final confidenceMentalController = TextEditingController();
    final mentalTotalController = TextEditingController();
    final agilityPhysicalController = TextEditingController();
    final balancePhysicalController = TextEditingController();
    final flexibilityPhysicalController = TextEditingController();
    final strengthPhysicalController = TextEditingController();
    final speedPhysicalController = TextEditingController();
    final powerPhysicalController = TextEditingController();
    final endurencePhysicalController = TextEditingController();
    final reflexesPhysicalController = TextEditingController();
    final desciplinPhysicalController = TextEditingController();
    final physicalTotalController = TextEditingController();
    final totalAVGController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
        centerTitle: true,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    // color: Colors.amber,
                  ),
                  height: 100,
                  width: 100,
                  child: pickedFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            File(
                              pickedFile!.path!,
                            ),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            profilePicture,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    selectFile();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                      color: kField,
                    ),
                    height: 40,
                    width: 80,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kids,Under 13,Under 15,Under 18,Under 20",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      // toolbarOptions: ,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 2
                          ? "Enter [Kids,Under 13,Under 15,Under 18,Under 20,GK]"
                          : null,
                      // validator: (value) =>
                      //     value != null && value.length < 4 ? "Enter a valid Name" : null,
                      controller: batchController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kField,
                        hintText: 'Batch: Kids,Under __,GK',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                StudentFormField(
                  action: TextInputAction.next,
                  controller: uIdController,
                  type: TextInputType.name,
                  title: 'CFA ID',
                ),
                StudentFormField(
                  action: TextInputAction.next,
                  controller: nameController,
                  type: TextInputType.name,
                  title: 'Name',
                ),
                StudentFormField(
                  action: TextInputAction.next,
                  controller: dobController,
                  type: TextInputType.datetime,
                  title: 'Date of Birth',
                ),
                StudentFormField(
                  action: TextInputAction.next,
                  controller: yearController,
                  type: TextInputType.number,
                  title: 'Year of Birth',
                ),
                StudentFormField(
                  action: TextInputAction.next,
                  controller: phoneController,
                  type: TextInputType.phone,
                  title: 'Phone Number',
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const MatchOrCamp(
                          startColor: kMCBlue,
                          endColor: kMCViolet,
                          title: 'Camp',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CampMatchSecondTitle(title: "Attacking W/Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: dribblingAttackCampController,
                          type: TextInputType.number,
                          title: 'Dribbling',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: passingAttackCampController,
                          type: TextInputType.number,
                          title: 'Passing',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: receivingAttackCampController,
                          type: TextInputType.number,
                          title: 'Receiving',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: headingAttackCampController,
                          type: TextInputType.number,
                          title: 'Heading',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: finishingAttackController,
                          type: TextInputType.number,
                          title: 'finishing',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Attacking W/O Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: supportAttackingController,
                          type: TextInputType.number,
                          title: 'Support',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: widthAttackingController,
                          type: TextInputType.number,
                          title: 'Width',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: depthAttackingController,
                          type: TextInputType.number,
                          title: 'Depth',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: mobilityAttackingController,
                          type: TextInputType.number,
                          title: 'Mobility',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Defending W/Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: pressureDefendingController,
                          type: TextInputType.number,
                          title: 'Pressure',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: delayDefendingController,
                          type: TextInputType.number,
                          title: 'Delay',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: tacklingDefendingController,
                          type: TextInputType.number,
                          title: 'Tackling',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: headingDefendingController,
                          type: TextInputType.number,
                          title: 'Heading',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: clearenceDefendingController,
                          type: TextInputType.number,
                          title: 'Clearence',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Defending W/O Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: coverDefendingController,
                          type: TextInputType.number,
                          title: 'Cover',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: balanceDefendingController,
                          type: TextInputType.number,
                          title: 'Balance',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: markingDefendingController,
                          type: TextInputType.number,
                          title: 'Marking',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: interceptionDefendingController,
                          type: TextInputType.number,
                          title: 'Interception',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Mental"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: attitudeMentalController,
                          type: TextInputType.number,
                          title: 'Attitude',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: toughnessMentalController,
                          type: TextInputType.number,
                          title: 'Toughness',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: commitmentMentalController,
                          type: TextInputType.number,
                          title: 'Commitment',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: preseveranceMentalController,
                          type: TextInputType.number,
                          title: 'Perseverance',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: confidenceMentalController,
                          type: TextInputType.number,
                          title: 'Confidence',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: mentalTotalController,
                          type: TextInputType.number,
                          title: 'Total Mental',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Physical"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: agilityPhysicalController,
                          type: TextInputType.number,
                          title: 'Agility',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: balancePhysicalController,
                          type: TextInputType.number,
                          title: 'Balance',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: flexibilityPhysicalController,
                          type: TextInputType.number,
                          title: 'Flexibilty',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: strengthPhysicalController,
                          type: TextInputType.number,
                          title: 'Strength',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: speedPhysicalController,
                          type: TextInputType.number,
                          title: 'Speed',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: powerPhysicalController,
                          type: TextInputType.number,
                          title: 'Power',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: endurencePhysicalController,
                          type: TextInputType.number,
                          title: 'Endurence',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: reflexesPhysicalController,
                          type: TextInputType.number,
                          title: 'Reflexes',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: desciplinPhysicalController,
                          type: TextInputType.number,
                          title: 'Disciplin',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: physicalTotalController,
                          type: TextInputType.number,
                          title: 'Total Physical',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Total AVG"),
                        StudentFormField(
                          action: TextInputAction.done,
                          controller: totalAVGController,
                          type: TextInputType.number,
                          title: 'Total AVG',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (pickedFile != null) {
                      await uploadFile();
                    }
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: const Center(
                          child: Text(
                            "Adding......",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        width: 200,
                      ),
                    );
                    await addStudents(
                      batch: batchController.text.trim(),
                      uId: uIdController.text.trim(),
                      name: nameController.text.trim(),
                      dob: dobController.text.trim(),
                      year: yearController.text.trim(),
                      phone: phoneController.text.trim(),
                      image: pickedFile != null
                          ? imageUrlDownload!
                          : profilePicture,
                      /////////////////////////////////////////////
                      dribblingAttackCamp: double.parse(
                          dribblingAttackCampController.text.trim()),
                      passingAttackCamp:
                          double.parse(passingAttackCampController.text.trim()),
                      receivingAttackCamp: double.parse(
                          receivingAttackCampController.text.trim()),
                      headAttaackCamp:
                          double.parse(headingAttackCampController.text.trim()),
                      finishingAtackCamp:
                          double.parse(finishingAttackController.text.trim()),
                      /////////////////////////////////////////////
                      supportAtackCamp:
                          double.parse(supportAttackingController.text.trim()),
                      widthAtackCamp:
                          double.parse(widthAttackingController.text.trim()),
                      depthAtackCamp:
                          double.parse(depthAttackingController.text.trim()),
                      mobilityAtackCamp:
                          double.parse(mobilityAttackingController.text.trim()),
                      /////////////////////////////////////////////
                      pressureDefendingCamp:
                          double.parse(pressureDefendingController.text.trim()),
                      delayDefendingCamp:
                          double.parse(delayDefendingController.text.trim()),
                      tacklingDefendingCamp:
                          double.parse(tacklingDefendingController.text.trim()),
                      headingDefendingCamp:
                          double.parse(headingDefendingController.text.trim()),
                      clearenceDefendingCamp: double.parse(
                          clearenceDefendingController.text.trim()),
                      /////////////////////////////////////////////
                      coverDefendingCamp:
                          double.parse(coverDefendingController.text.trim()),
                      balanceDefendingCamp:
                          double.parse(balanceDefendingController.text.trim()),
                      markingDefendingCamp:
                          double.parse(markingDefendingController.text.trim()),
                      interceptionDefendingCamp: double.parse(
                          interceptionDefendingController.text.trim()),
                      /////////////////////////////////////////////
                      atitudeMentalCamp:
                          double.parse(attitudeMentalController.text.trim()),
                      toghnessMentalCamp:
                          double.parse(toughnessMentalController.text.trim()),
                      commitmentMentalCamp:
                          double.parse(commitmentMentalController.text.trim()),
                      preseveranceMentalCamp: double.parse(
                          preseveranceMentalController.text.trim()),
                      confidenceMentalCamp:
                          double.parse(confidenceMentalController.text.trim()),
                      totalMentalCamp:
                          double.parse(mentalTotalController.text.trim()),
                      /////////////////////////////////////////////
                      agilityPhysicalkCamp:
                          double.parse(agilityPhysicalController.text.trim()),
                      balancePhysicalkCamp:
                          double.parse(balancePhysicalController.text.trim()),
                      flexibilityPhysicalkCamp: double.parse(
                          flexibilityPhysicalController.text.trim()),
                      strengthPhysicalkCamp:
                          double.parse(strengthPhysicalController.text.trim()),
                      speedPhysicalkCamp:
                          double.parse(speedPhysicalController.text.trim()),
                      powerPhysicalkCamp:
                          double.parse(powerPhysicalController.text.trim()),
                      endurencePhysicalkCamp:
                          double.parse(endurencePhysicalController.text.trim()),
                      reflexedPhysicalkCamp:
                          double.parse(reflexesPhysicalController.text.trim()),
                      desciplinPhysicalkCamp:
                          double.parse(desciplinPhysicalController.text.trim()),
                      totalPhysicalkCamp:
                          double.parse(physicalTotalController.text.trim()),
                      /////////////////////////////////////////////
                      totalAVGCamp:
                          double.parse(totalAVGController.text.trim()),
                    );

                    // ignore: use_build_context_synchronously
                    popNow(context);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: const Center(
                          child: Text(
                            "Student Added",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        width: 200,
                      ),
                    );
                  },
                  child: const MatchOrCamp(
                    startColor: Color.fromARGB(33, 86, 86, 86),
                    endColor: Color.fromARGB(255, 0, 0, 0),
                    title: 'Uplaod',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          // Text("Name")
        ],
      ),
    );
  }

  Future uploadFile() async {
    final path = "files/${pickedFile!.name}";
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});

    imageUrlDownload = await snapshot.ref.getDownloadURL();
    if (kDebugMode) {
      print("Download Link: $imageUrlDownload");
    }

    setState(() {
      uploadTask = null;
    });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }
}

class ModelStudents {
  final String batch;
  final String uId;
  final String name;
  final dynamic image;
  final String dob;
  final String year;
  final String phone;
  /////////////////////////////////////////////
  final double dribblingAttackCamp;
  final double passingAttackCamp;
  final double receivingAttackCamp;
  final double headAttackCamp;
  final double finishingAttackCamp;
  /////////////////////////////////////////////
  final double supportAttackingCamp;
  final double widthAttackingCamp;
  final double depthAttackingCamp;
  final double mobilityAttackingCamp;
  /////////////////////////////////////////////
  final double pressureDefendingCamp;
  final double delayDefendingCamp;
  final double tacklingDefendingCamp;
  final double headingDefendingCamp;
  final double clearenceDefendingCamp;
  /////////////////////////////////////////////
  final double coverDefendingCamp;
  final double balenceDefendingCamp;
  final double markingDefendingCamp;
  final double interceptionDefendingCamp;
  /////////////////////////////////////////////
  final double atitudeMentalCamp;
  final double toughnessMentalCamp;
  final double commitmentMentalCamp;
  final double perseveranceMentalCamp;
  final double confidenceMentalCamp;
  final double totalMentalCamp;
  /////////////////////////////////////////////
  final double agilityPhysicalCamp;
  final double balancePhysicalCamp;
  final double flexibilityPhysicalCamp;
  final double strengthPhysicalCamp;
  final double speedPhysicalCamp;
  final double powerPhysicalCamp;
  final double endurencePhysicalCamp;
  final double reflexesPhysicalCamp;
  final double disciplinPhysicalCamp;
  final double totalPhysicalCamp;
  /////////////////////////////////////////////
  final double totalAVGCamp;
  ModelStudents({
    required this.batch,
    required this.uId,
    required this.name,
    required this.image,
    required this.dob,
    required this.year,
    required this.phone,
    /////////////////////////////////////////////
    required this.dribblingAttackCamp,
    required this.passingAttackCamp,
    required this.receivingAttackCamp,
    required this.headAttackCamp,
    required this.finishingAttackCamp,
    /////////////////////////////////////////////
    required this.supportAttackingCamp,
    required this.widthAttackingCamp,
    required this.depthAttackingCamp,
    required this.mobilityAttackingCamp,
    /////////////////////////////////////////////
    required this.pressureDefendingCamp,
    required this.delayDefendingCamp,
    required this.tacklingDefendingCamp,
    required this.headingDefendingCamp,
    required this.clearenceDefendingCamp,
    /////////////////////////////////////////////
    required this.coverDefendingCamp,
    required this.balenceDefendingCamp,
    required this.markingDefendingCamp,
    required this.interceptionDefendingCamp,
    /////////////////////////////////////////////
    required this.atitudeMentalCamp,
    required this.toughnessMentalCamp,
    required this.commitmentMentalCamp,
    required this.perseveranceMentalCamp,
    required this.confidenceMentalCamp,
    required this.totalMentalCamp,
    /////////////////////////////////////////////
    required this.agilityPhysicalCamp,
    required this.balancePhysicalCamp,
    required this.flexibilityPhysicalCamp,
    required this.strengthPhysicalCamp,
    required this.speedPhysicalCamp,
    required this.powerPhysicalCamp,
    required this.endurencePhysicalCamp,
    required this.reflexesPhysicalCamp,
    required this.disciplinPhysicalCamp,
    required this.totalPhysicalCamp,
    /////////////////////////////////////////////
    required this.totalAVGCamp,
  });

  Map<String, dynamic> toJson() => {
        "Batch": batch,
        "Student Id": uId,
        "Name": name,
        "Image": image,
        "DOB": dob,
        "Year": year,
        "Phone": phone,
        /////////////////////////////////////////////
        "Camp Attack Dribbling": dribblingAttackCamp,
        "Camp Attack Passing": passingAttackCamp,
        "Camp Attack Receiving": receivingAttackCamp,
        "Camp Attack Heading": headAttackCamp,
        "Camp Attack Finish": finishingAttackCamp,
        /////////////////////////////////////////////
        "Camp Attack Support": supportAttackingCamp,
        "Camp Attack Width": widthAttackingCamp,
        "Camp Attack Depth": depthAttackingCamp,
        "Camp Attack Mobility": mobilityAttackingCamp,
        /////////////////////////////////////////////
        "Camp Defending Pressure": pressureDefendingCamp,
        "Camp Defending Delay": delayDefendingCamp,
        "Camp Defending Tackling": tacklingDefendingCamp,
        "Camp Defending Heading": headingDefendingCamp,
        "Camp Defending Clearence": clearenceDefendingCamp,
        /////////////////////////////////////////////
        "Camp Defending Cover": coverDefendingCamp,
        "Camp Defending Balance": balenceDefendingCamp,
        "Camp Defending Marking": markingDefendingCamp,
        "Camp Defending Interception": interceptionDefendingCamp,
        /////////////////////////////////////////////
        "Camp Mental Attitude": atitudeMentalCamp,
        "Camp Mental Toghness": toughnessMentalCamp,
        "Camp Mental Commitment": commitmentMentalCamp,
        "Camp Mental Perseverance": perseveranceMentalCamp,
        "Camp Mental Confidence": confidenceMentalCamp,
        "Camp Mental Total": totalMentalCamp,
        /////////////////////////////////////////////
        "Camp Physical Agility": agilityPhysicalCamp,
        "Camp Physical Balance": balancePhysicalCamp,
        "Camp Physical Flexibility": flexibilityPhysicalCamp,
        "Camp Physical Strength": strengthPhysicalCamp,
        "Camp Physical Speed": speedPhysicalCamp,
        "Camp Physical Power": powerPhysicalCamp,
        "Camp Physical Endurence": endurencePhysicalCamp,
        "Camp Physical Reflexes": reflexesPhysicalCamp,
        "Camp Physical Disciplin": disciplinPhysicalCamp,
        "Camp Physical Total": agilityPhysicalCamp,
        /////////////////////////////////////////////
        "Camp Total AVG": totalAVGCamp,
      };

  static ModelStudents fromJson(Map<String, dynamic> json) => ModelStudents(
        batch: json["Batch"],
        uId: json["Student Id"],
        name: json["Name"],
        image: json["Image"],
        dob: json["DOB"],
        year: json["Year"],
        phone: json["Phone"],
        /////////////////////////////////////////////
        dribblingAttackCamp: json["Camp Attack Dribbling"],
        passingAttackCamp: json["Camp Attack Passing"],
        receivingAttackCamp: json["Camp Attack Receiving"],
        headAttackCamp: json["Camp Attack Heading"],
        finishingAttackCamp: json["Camp Attack Finish"],
        /////////////////////////////////////////////
        supportAttackingCamp: json["Camp Attack Support"],
        widthAttackingCamp: json["Camp Attack Width"],
        depthAttackingCamp: json["Camp Attack Depth"],
        mobilityAttackingCamp: json["Camp Attack Mobility"],
        /////////////////////////////////////////////
        pressureDefendingCamp: json["Camp Defending Pressure"],
        delayDefendingCamp: json["Camp Defending Delay"],
        tacklingDefendingCamp: json["Camp Defending Tackling"],
        headingDefendingCamp: json["Camp Defending Heading"],
        clearenceDefendingCamp: json["Camp Defending Clearence"],
        /////////////////////////////////////////////
        coverDefendingCamp: json["Camp Defending Cover"],
        balenceDefendingCamp: json["Camp Defending Balance"],
        markingDefendingCamp: json["Camp Defending Marking"],
        interceptionDefendingCamp: json["Camp Defending Interception"],
        /////////////////////////////////////////////
        atitudeMentalCamp: json["Camp Mental Attitude"],
        toughnessMentalCamp: json["Camp Mental Toghness"],
        commitmentMentalCamp: json["Camp Mental Commitment"],
        perseveranceMentalCamp: json["Camp Mental Perseverance"],
        confidenceMentalCamp: json["Camp Mental Confidence"],
        totalMentalCamp: json["Camp Mental Total"],
        /////////////////////////////////////////////
        agilityPhysicalCamp: json["Camp Physical Agility"],
        balancePhysicalCamp: json["Camp Physical Balance"],
        flexibilityPhysicalCamp: json["Camp Physical Flexibility"],
        strengthPhysicalCamp: json["Camp Physical Strength"],
        speedPhysicalCamp: json["Camp Physical Speed"],
        powerPhysicalCamp: json["Camp Physical Power"],
        endurencePhysicalCamp: json["Camp Physical Endurence"],
        reflexesPhysicalCamp: json["Camp Physical Reflexes"],
        disciplinPhysicalCamp: json["Camp Physical Disciplin"],
        totalPhysicalCamp: json["Camp Physical Total"],
        /////////////////////////////////////////////
        totalAVGCamp: json["Camp Total AVG"],
      );
}

Future addStudents({
  required String batch,
  required String uId,
  required String name,
  required String dob,
  required String image,
  required String year,
  required String phone,
  /////////////////////////////////////////////
  required double dribblingAttackCamp,
  required double passingAttackCamp,
  required double receivingAttackCamp,
  required double headAttaackCamp,
  required double finishingAtackCamp,
  /////////////////////////////////////////////
  required double supportAtackCamp,
  required double widthAtackCamp,
  required double depthAtackCamp,
  required double mobilityAtackCamp,
  /////////////////////////////////////////////
  required double pressureDefendingCamp,
  required double delayDefendingCamp,
  required double tacklingDefendingCamp,
  required double headingDefendingCamp,
  required double clearenceDefendingCamp,
  /////////////////////////////////////////////
  required double coverDefendingCamp,
  required double balanceDefendingCamp,
  required double markingDefendingCamp,
  required double interceptionDefendingCamp,
  /////////////////////////////////////////////
  required double atitudeMentalCamp,
  required double toghnessMentalCamp,
  required double commitmentMentalCamp,
  required double preseveranceMentalCamp,
  required double confidenceMentalCamp,
  required double totalMentalCamp,
  /////////////////////////////////////////////
  required double agilityPhysicalkCamp,
  required double balancePhysicalkCamp,
  required double flexibilityPhysicalkCamp,
  required double strengthPhysicalkCamp,
  required double speedPhysicalkCamp,
  required double powerPhysicalkCamp,
  required double endurencePhysicalkCamp,
  required double reflexedPhysicalkCamp,
  required double desciplinPhysicalkCamp,
  required double totalPhysicalkCamp,
  /////////////////////////////////////////////
  required double totalAVGCamp,
}) async {
  final docStudents = FirebaseFirestore.instance
      .collection("CFC")
      .doc("Students")
      .collection(batch)
      .doc(uId);

  final student = ModelStudents(
    batch: batch,
    uId: uId,
    name: name,
    dob: dob,
    year: year,
    phone: phone,
    image: image,
    /////////////////////////////////////////////
    dribblingAttackCamp: dribblingAttackCamp,
    passingAttackCamp: passingAttackCamp,
    receivingAttackCamp: receivingAttackCamp,
    headAttackCamp: headAttaackCamp,
    finishingAttackCamp: finishingAtackCamp,
    /////////////////////////////////////////////
    supportAttackingCamp: supportAtackCamp,
    widthAttackingCamp: widthAtackCamp,
    depthAttackingCamp: depthAtackCamp,
    mobilityAttackingCamp: mobilityAtackCamp,
    /////////////////////////////////////////////
    pressureDefendingCamp: pressureDefendingCamp,
    delayDefendingCamp: delayDefendingCamp,
    tacklingDefendingCamp: tacklingDefendingCamp,
    headingDefendingCamp: headingDefendingCamp,
    clearenceDefendingCamp: clearenceDefendingCamp,
    /////////////////////////////////////////////
    coverDefendingCamp: coverDefendingCamp,
    balenceDefendingCamp: balanceDefendingCamp,
    markingDefendingCamp: markingDefendingCamp,
    interceptionDefendingCamp: interceptionDefendingCamp,
    /////////////////////////////////////////////
    atitudeMentalCamp: atitudeMentalCamp,
    toughnessMentalCamp: toghnessMentalCamp,
    commitmentMentalCamp: commitmentMentalCamp,
    perseveranceMentalCamp: preseveranceMentalCamp,
    confidenceMentalCamp: confidenceMentalCamp,
    totalMentalCamp: totalMentalCamp,
    /////////////////////////////////////////////
    agilityPhysicalCamp: agilityPhysicalkCamp,
    balancePhysicalCamp: balancePhysicalkCamp,
    flexibilityPhysicalCamp: flexibilityPhysicalkCamp,
    strengthPhysicalCamp: strengthPhysicalkCamp,
    speedPhysicalCamp: speedPhysicalkCamp,
    powerPhysicalCamp: powerPhysicalkCamp,
    endurencePhysicalCamp: endurencePhysicalkCamp,
    reflexesPhysicalCamp: reflexedPhysicalkCamp,
    disciplinPhysicalCamp: desciplinPhysicalkCamp,
    totalPhysicalCamp: totalPhysicalkCamp,
    /////////////////////////////////////////////
    totalAVGCamp: totalAVGCamp,
  );

  final json = student.toJson();
  await docStudents.set(json);
}

Future editUnder15Students({
  required String batch,
  required String uId,
  required String name,
  required String dob,
  required String image,
  required String year,
  required String phone,
  /////////////////////////////////////////////
  required double dribblingAttackCamp,
  required double passingAttackCamp,
  required double receivingAttackCamp,
  required double headAttaackCamp,
  required double finishingAtackCamp,
  /////////////////////////////////////////////
  required double supportAtackCamp,
  required double widthAtackCamp,
  required double depthAtackCamp,
  required double mobilityAtackCamp,
  /////////////////////////////////////////////
  required double pressureDefendingCamp,
  required double delayDefendingCamp,
  required double tacklingDefendingCamp,
  required double headingDefendingCamp,
  required double clearenceDefendingCamp,
  /////////////////////////////////////////////
  required double coverDefendingCamp,
  required double balanceDefendingCamp,
  required double markingDefendingCamp,
  required double interceptionDefendingCamp,
  /////////////////////////////////////////////
  required double atitudeMentalCamp,
  required double toghnessMentalCamp,
  required double commitmentMentalCamp,
  required double preseveranceMentalCamp,
  required double confidenceMentalCamp,
  required double totalMentalCamp,
  /////////////////////////////////////////////
  required double agilityPhysicalkCamp,
  required double balancePhysicalkCamp,
  required double flexibilityPhysicalkCamp,
  required double strengthPhysicalkCamp,
  required double speedPhysicalkCamp,
  required double powerPhysicalkCamp,
  required double endurencePhysicalkCamp,
  required double reflexedPhysicalkCamp,
  required double desciplinPhysicalkCamp,
  required double totalPhysicalkCamp,
  /////////////////////////////////////////////
  required double totalAVGCamp,
}) async {
  final docStudents = FirebaseFirestore.instance
      .collection("CFC")
      .doc("Students")
      .collection(batch)
      .doc(uId);

  final student = ModelStudents(
    batch: batch,
    uId: uId,
    name: name,
    dob: dob,
    year: year,
    phone: phone,
    image: image,
    /////////////////////////////////////////////
    dribblingAttackCamp: dribblingAttackCamp,
    passingAttackCamp: passingAttackCamp,
    receivingAttackCamp: receivingAttackCamp,
    headAttackCamp: headAttaackCamp,
    finishingAttackCamp: finishingAtackCamp,
    /////////////////////////////////////////////
    supportAttackingCamp: supportAtackCamp,
    widthAttackingCamp: widthAtackCamp,
    depthAttackingCamp: depthAtackCamp,
    mobilityAttackingCamp: mobilityAtackCamp,
    /////////////////////////////////////////////
    pressureDefendingCamp: pressureDefendingCamp,
    delayDefendingCamp: delayDefendingCamp,
    tacklingDefendingCamp: tacklingDefendingCamp,
    headingDefendingCamp: headingDefendingCamp,
    clearenceDefendingCamp: clearenceDefendingCamp,
    /////////////////////////////////////////////
    coverDefendingCamp: coverDefendingCamp,
    balenceDefendingCamp: balanceDefendingCamp,
    markingDefendingCamp: markingDefendingCamp,
    interceptionDefendingCamp: interceptionDefendingCamp,
    /////////////////////////////////////////////
    atitudeMentalCamp: atitudeMentalCamp,
    toughnessMentalCamp: toghnessMentalCamp,
    commitmentMentalCamp: commitmentMentalCamp,
    perseveranceMentalCamp: preseveranceMentalCamp,
    confidenceMentalCamp: confidenceMentalCamp,
    totalMentalCamp: totalMentalCamp,
    /////////////////////////////////////////////
    agilityPhysicalCamp: agilityPhysicalkCamp,
    balancePhysicalCamp: balancePhysicalkCamp,
    flexibilityPhysicalCamp: flexibilityPhysicalkCamp,
    strengthPhysicalCamp: strengthPhysicalkCamp,
    speedPhysicalCamp: speedPhysicalkCamp,
    powerPhysicalCamp: powerPhysicalkCamp,
    endurencePhysicalCamp: endurencePhysicalkCamp,
    reflexesPhysicalCamp: reflexedPhysicalkCamp,
    disciplinPhysicalCamp: desciplinPhysicalkCamp,
    totalPhysicalCamp: totalPhysicalkCamp,
    /////////////////////////////////////////////
    totalAVGCamp: totalAVGCamp,
  );

  final json = student.toJson();
  await docStudents.update(json);
}
