import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../model/colors/colors.dart';
import '../../../../model/const/const.dart';
import '../../../../model/student/student_widgets.dart';

class ScreenAddGK extends StatefulWidget {
  const ScreenAddGK({super.key});

  @override
  State<ScreenAddGK> createState() => _ScreenAddGKState();
}

class _ScreenAddGKState extends State<ScreenAddGK> {
  // String? imageUrlDownload;
  PlatformFile? pickedFile;
  String? imageUrlDownload;
  UploadTask? uploadTask;
  String profilePicture =
      'https://imgs.search.brave.com/jgS5uhrhK9WmK5GOPlozNP8HFnESxIYQeKgNFhFB8X0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1pY29uL3Vz/ZXJfMzE4LTU2MzY0/Mi5qcGc_c2l6ZT02/MjYmZXh0PWpwZw';

  @override
  Widget build(BuildContext context) {
    final uIdController = TextEditingController();
    final nameController = TextEditingController();
    final dobController = TextEditingController();
    final yearController = TextEditingController();
    final phoneController = TextEditingController();
    /////////////////////////////////////////////////
    final underArmAttackingController = TextEditingController();
    final overHeadAttackingcontroller = TextEditingController();
    final javelAttackingController = TextEditingController();
    final passAttackingController = TextEditingController();
    final kickAttackingController = TextEditingController();
    final communicateAttackinController = TextEditingController();
    /////////////////////////////////////////////////
    final positionAttackingcontroller = TextEditingController();
    final cmAttackingController = TextEditingController();
    // final communicationNumberAttackingCntroller = TextEditingController();
    final leadingAndSuportAttackingController = TextEditingController();
    /////////////////////////////////////////////////
    final oneVsOneDefendingController = TextEditingController();
    final highDiveDefendingController = TextEditingController();
    final lowDivedefendingcintriiller = TextEditingController();
    final cupingdefendingContriller = TextEditingController();
    final wShapedefendingController = TextEditingController();
    final scoopingDefendingController = TextEditingController();
    final shortSteppingDefendingController = TextEditingController();
    /////////////////////////////////////////////////
    final setPositionDefendingController = TextEditingController();
    final startPosdintionDefendingController = TextEditingController();
    final movmentsDefendingcontroller = TextEditingController();
    final defenceOrgenisationDefendingController = TextEditingController();
    final communicationDefenceController = TextEditingController();
    /////////////////////////////////////////////////
    final passtransitionController = TextEditingController();
    final reciveTransitionController = TextEditingController();
    final movmentsTransitionController = TextEditingController();
    /////////////////////////////////////////////////
    final positionTransitionController = TextEditingController();
    final communicationTransitionController = TextEditingController();
    /////////////////////////////////////////////////
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
                          controller: underArmAttackingController,
                          type: TextInputType.number,
                          title: 'Under Arm',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: overHeadAttackingcontroller,
                          type: TextInputType.number,
                          title: 'Over Head',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: javelAttackingController,
                          type: TextInputType.number,
                          title: 'Javel',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: passAttackingController,
                          type: TextInputType.number,
                          title: 'Pass',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: kickAttackingController,
                          type: TextInputType.number,
                          title: 'Kick',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: communicateAttackinController,
                          type: TextInputType.number,
                          title: 'Communicate',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Attacking W/O Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: positionAttackingcontroller,
                          type: TextInputType.number,
                          title: 'Position',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: cmAttackingController,
                          type: TextInputType.number,
                          title: 'Communication',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: leadingAndSuportAttackingController,
                          type: TextInputType.number,
                          title: 'Leading & Supporting',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Defending W/Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: oneVsOneDefendingController,
                          type: TextInputType.number,
                          title: '1 vs 1',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: highDiveDefendingController,
                          type: TextInputType.number,
                          title: 'Highdive',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: lowDivedefendingcintriiller,
                          type: TextInputType.number,
                          title: 'Lowdive',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: cupingdefendingContriller,
                          type: TextInputType.number,
                          title: 'Cuping',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: wShapedefendingController,
                          type: TextInputType.number,
                          title: 'W Shape',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: scoopingDefendingController,
                          type: TextInputType.number,
                          title: 'Scooping',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: shortSteppingDefendingController,
                          type: TextInputType.number,
                          title: 'Short Steping',
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Defending W/O Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: setPositionDefendingController,
                          type: TextInputType.number,
                          title: 'Set Position',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: startPosdintionDefendingController,
                          type: TextInputType.number,
                          title: 'Start Position',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: movmentsDefendingcontroller,
                          type: TextInputType.number,
                          title: 'Movments',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: defenceOrgenisationDefendingController,
                          type: TextInputType.number,
                          title: 'Defence Organising',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: communicationDefenceController,
                          type: TextInputType.number,
                          title: 'Communication',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Transition W/Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: passtransitionController,
                          type: TextInputType.number,
                          title: 'Pass',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: reciveTransitionController,
                          type: TextInputType.number,
                          title: 'Recive',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: movmentsTransitionController,
                          type: TextInputType.number,
                          title: 'Movments',
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(
                            title: "Transition W/O Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: positionTransitionController,
                          type: TextInputType.number,
                          title: 'Position',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: communicationTransitionController,
                          type: TextInputType.number,
                          title: 'Communication',
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
                    await addGK(
                      uId: uIdController.text.trim(),
                      name: nameController.text.trim(),
                      dob: dobController.text.trim(),
                      year: yearController.text.trim(),
                      phone: phoneController.text.trim(),
                      image: pickedFile != null
                          ? imageUrlDownload!
                          : profilePicture,
                      /////////////////////////////////////////////
                      underArmAttacking:
                          double.parse(underArmAttackingController.text.trim()),
                      overHeadAttacking:
                          double.parse(overHeadAttackingcontroller.text.trim()),
                      javelAttacking:
                          double.parse(javelAttackingController.text.trim()),
                      passAttacking:
                          double.parse(passAttackingController.text.trim()),
                      kickAttacking:
                          double.parse(kickAttackingController.text.trim()),
                      communicateAttacking: double.parse(
                          communicateAttackinController.text.trim()),
                      /////////////////////////////////////////////
                      positionAttacking:
                          double.parse(positionAttackingcontroller.text.trim()),
                      communicationAttacking:
                          double.parse(cmAttackingController.text.trim()),
                      leadingSupportAttacking: double.parse(
                          leadingAndSuportAttackingController.text.trim()),
                      /////////////////////////////////////////////
                      oneVSoneDefending:
                          double.parse(oneVsOneDefendingController.text.trim()),
                      highDiveDefending:
                          double.parse(highDiveDefendingController.text.trim()),
                      lowDiveDefending:
                          double.parse(lowDivedefendingcintriiller.text.trim()),
                      cupingDefending:
                          double.parse(cupingdefendingContriller.text.trim()),
                      wShapeDefending:
                          double.parse(wShapedefendingController.text.trim()),
                      scoopingDefending:
                          double.parse(scoopingDefendingController.text.trim()),
                      shortstepingDefending: double.parse(
                          shortSteppingDefendingController.text.trim()),
                      /////////////////////////////////////////////
                      setPositionDefending: double.parse(
                          setPositionDefendingController.text.trim()),
                      startPositionDefending: double.parse(
                          startPosdintionDefendingController.text.trim()),
                      movmentsDefending: double.parse(
                          movmentsTransitionController.text.trim()),
                      defenceOrgnizationDefending: double.parse(
                          defenceOrgenisationDefendingController.text.trim()),
                      communicationDefending: double.parse(
                          communicationDefenceController.text.trim()),
                      /////////////////////////////////////////////

                      passTransition:
                          double.parse(passtransitionController.text.trim()),
                      reciveTransition:
                          double.parse(reciveTransitionController.text.trim()),
                      movmentsTransition: double.parse(
                          movmentsTransitionController.text.trim()),
                      /////////////////////////////////////////////
                      positionTransition: double.parse(
                          positionTransitionController.text.trim()),
                      communicationTransition: double.parse(
                          communicationTransitionController.text.trim()),

                      /////////////////////////////////////////////
                      totalAvg: double.parse(totalAVGController.text.trim()),
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

class ModelGK {
  final String uId;
  final String name;
  final dynamic image;
  final String dob;
  final String year;
  final String phone;
  /////////////////////////////////////////////
  final double underArmAttacking;
  final double overHeadAttacking;
  final double javelAttacking;
  final double passAttacking;
  final double kickAttacking;
  final double communicateAttacking;
  /////////////////////////////////////////////
  final double positionAttacking;
  final double communicationAttacking;
  final double leadingSupportAttacking;
  /////////////////////////////////////////////
  final double oneVSoneDefending;
  final double highDiveDefending;
  final double lowDiveDefending;
  final double cupingDefending;
  final double wShapeDefending;
  final double scoopingDefending;
  final double shortstepingDefending;
  /////////////////////////////////////////////
  final double setPositionDefending;
  final double startPositionDefending;
  final double movmentsDefending;
  final double defenceOrgnizationDefending;
  final double communicationDefending;
  /////////////////////////////////////////////
  final double passTransition;
  final double reciveTransition;
  final double movmentsTransition;
  /////////////////////////////////////////////
  final double positionTransition;
  final double communicationTransition;
  /////////////////////////////////////////////
  final double totalAvg;

  ModelGK({
    required this.uId,
    required this.name,
    required this.image,
    required this.dob,
    required this.year,
    required this.phone,
    /////////////////////////////////////////////
    required this.underArmAttacking,
    required this.overHeadAttacking,
    required this.javelAttacking,
    required this.passAttacking,
    required this.kickAttacking,
    required this.communicateAttacking,
    /////////////////////////////////////////////
    required this.positionAttacking,
    required this.communicationAttacking,
    required this.leadingSupportAttacking,
    /////////////////////////////////////////////
    required this.oneVSoneDefending,
    required this.highDiveDefending,
    required this.lowDiveDefending,
    required this.cupingDefending,
    required this.wShapeDefending,
    required this.scoopingDefending,
    required this.shortstepingDefending,
    /////////////////////////////////////////////
    required this.setPositionDefending,
    required this.startPositionDefending,
    required this.movmentsDefending,
    required this.defenceOrgnizationDefending,
    required this.communicationDefending,
    /////////////////////////////////////////////
    required this.passTransition,
    required this.reciveTransition,
    required this.movmentsTransition,
    /////////////////////////////////////////////
    required this.positionTransition,
    required this.communicationTransition,
    /////////////////////////////////////////////
    required this.totalAvg,
  });
  Map<String, dynamic> toJson() => {
        // "Batch": batch,
        "Student Id": uId,
        "Name": name,
        "Image": image,
        "DOB": dob,
        "Year": year,
        "Phone": phone,
        /////////////////////////////////////////////
        "Attack UnderArm": underArmAttacking,
        "Attack Overhead": overHeadAttacking,
        "Attack Javel": javelAttacking,
        "Attack Pass": passAttacking,
        "Attack Kick": kickAttacking,
        "Attack Communicate": communicateAttacking,
        /////////////////////////////////////////////
        "Attack Position": positionAttacking,
        "Attack communication": communicationAttacking,
        "Attack LeadingAndSupporing": leadingSupportAttacking,
        /////////////////////////////////////////////
        "Defending 1vs1": oneVSoneDefending,
        "Defending HighDive": highDiveDefending,
        "Defending LowDive": lowDiveDefending,
        "Defending Cuping": cupingDefending,
        "Defending Wshape": wShapeDefending,
        "Defending Scooping": scoopingDefending,
        "Defending ShortSteping": shortstepingDefending,
        /////////////////////////////////////////////
        "Defending SetPosition": setPositionDefending,
        "Defending StrtPosition": startPositionDefending,
        "Defending Movments": movmentsDefending,
        "Defending DefenceOrganisaton": defenceOrgnizationDefending,
        "Defending communication": communicationDefending,
        /////////////////////////////////////////////
        "Transition Pass": passTransition,
        "Transition recieve": reciveTransition,
        "Transition Movments": movmentsTransition,
        /////////////////////////////////////////////
        "Transition Position": positionTransition,
        "Transition Communication": communicationTransition,
        /////////////////////////////////////////////
        "Total AVG": totalAvg,
      };
  static ModelGK fromJson(Map<String, dynamic> json) => ModelGK(
        uId: json["Student Id"],
        name: json["Name"],
        image: json["Image"],
        dob: json["DOB"],
        year: json["Year"],
        phone: json["Phone"],
        /////////////////////////////////////////////
        underArmAttacking: json["Attack UnderArm"],
        overHeadAttacking: json["Attack Overhead"],
        javelAttacking: json["Attack Javel"],
        passAttacking: json["Attack Pass"],
        kickAttacking: json["Attack Kick"],
        communicateAttacking: json["Attack Communicate"],
        /////////////////////////////////////////////
        positionAttacking: json["Attack Position"],
        communicationAttacking: json["Attack communication"],
        leadingSupportAttacking: json["Attack LeadingAndSupporing"],
        /////////////////////////////////////////////
        oneVSoneDefending: json["Defending 1vs1"],
        highDiveDefending: json["Defending HighDive"],
        lowDiveDefending: json["Defending LowDive"],
        cupingDefending: json["Defending Cuping"],
        wShapeDefending: json["Defending Wshape"],
        scoopingDefending: json["Defending Scooping"],
        shortstepingDefending: json["Defending ShortSteping"],
        /////////////////////////////////////////////
        setPositionDefending: json["Defending SetPosition"],
        startPositionDefending: json["Defending StrtPosition"],
        movmentsDefending: json["Defending Movments"],
        defenceOrgnizationDefending: json["Defending DefenceOrganisaton"],
        communicationDefending: json["Defending communication"],
        /////////////////////////////////////////////
        passTransition: json["Transition Pass"],
        reciveTransition: json["Transition recieve"],
        movmentsTransition: json["Transition Movments"],
        /////////////////////////////////////////////
        positionTransition: json["Transition Position"],
        communicationTransition: json["Transition Communication"],

        /////////////////////////////////////////////
        totalAvg: json["Total AVG"],
      );
}

Future addGK({
  // required String batch,
  required String uId,
  required String name,
  required String dob,
  required String image,
  required String year,
  required String phone,
  /////////////////////////////////////////////
  required double underArmAttacking,
  required double overHeadAttacking,
  required double javelAttacking,
  required double passAttacking,
  required double kickAttacking,
  required double communicateAttacking,
  /////////////////////////////////////////////
  required double positionAttacking,
  required double communicationAttacking,
  required double leadingSupportAttacking,
  /////////////////////////////////////////////
  required double oneVSoneDefending,
  required double highDiveDefending,
  required double lowDiveDefending,
  required double cupingDefending,
  required double wShapeDefending,
  required double scoopingDefending,
  required double shortstepingDefending,
  /////////////////////////////////////////////
  required double setPositionDefending,
  required double startPositionDefending,
  required double movmentsDefending,
  required double defenceOrgnizationDefending,
  required double communicationDefending,
  /////////////////////////////////////////////
  required double passTransition,
  required double reciveTransition,
  required double movmentsTransition,
  /////////////////////////////////////////////
  required double positionTransition,
  required double communicationTransition,
  /////////////////////////////////////////////
  required double totalAvg,
}) async {
  final docStudents = FirebaseFirestore.instance
      .collection("CFC")
      .doc("Students")
      .collection("GK")
      .doc(uId);
  final student = ModelGK(
    uId: uId,
    name: name,
    image: image,
    dob: dob,
    year: year,
    phone: phone,
    underArmAttacking: underArmAttacking,
    overHeadAttacking: overHeadAttacking,
    javelAttacking: javelAttacking,
    passAttacking: passAttacking,
    kickAttacking: kickAttacking,
    communicateAttacking: communicateAttacking,
    positionAttacking: positionAttacking,
    communicationAttacking: communicationAttacking,
    leadingSupportAttacking: leadingSupportAttacking,
    oneVSoneDefending: oneVSoneDefending,
    highDiveDefending: highDiveDefending,
    lowDiveDefending: lowDiveDefending,
    cupingDefending: cupingDefending,
    wShapeDefending: wShapeDefending,
    scoopingDefending: scoopingDefending,
    shortstepingDefending: shortstepingDefending,
    setPositionDefending: setPositionDefending,
    startPositionDefending: startPositionDefending,
    movmentsDefending: movmentsDefending,
    defenceOrgnizationDefending: defenceOrgnizationDefending,
    communicationDefending: communicationDefending,
    passTransition: passTransition,
    reciveTransition: reciveTransition,
    movmentsTransition: movmentsTransition,
    positionTransition: positionTransition,
    communicationTransition: communicationTransition,
    totalAvg: totalAvg,
  );
  final json = student.toJson();
  await docStudents.set(json);
}

Future editGK({
  // required String batch,
  required String uId,
  required String name,
  required String dob,
  required String image,
  required String year,
  required String phone,
  /////////////////////////////////////////////
  required double underArmAttacking,
  required double overHeadAttacking,
  required double javelAttacking,
  required double passAttacking,
  required double kickAttacking,
  required double communicateAttacking,
  /////////////////////////////////////////////
  required double positionAttacking,
  required double communicationAttacking,
  required double leadingSupportAttacking,
  /////////////////////////////////////////////
  required double oneVSoneDefending,
  required double highDiveDefending,
  required double lowDiveDefending,
  required double cupingDefending,
  required double wShapeDefending,
  required double scoopingDefending,
  required double shortstepingDefending,
  /////////////////////////////////////////////
  required double setPositionDefending,
  required double startPositionDefending,
  required double movmentsDefending,
  required double defenceOrgnizationDefending,
  required double communicationDefending,
  /////////////////////////////////////////////
  required double passTransition,
  required double reciveTransition,
  required double movmentsTransition,
  /////////////////////////////////////////////
  required double positionTransition,
  required double communicationTransition,
  /////////////////////////////////////////////
  required double totalAvg,
}) async {
  final docStudents = FirebaseFirestore.instance
      .collection("CFC")
      .doc("Students")
      .collection("GK")
      .doc(uId);

  final student = ModelGK(
    // batch: batch,
    uId: uId,
    name: name,
    image: image,
    dob: dob,
    year: year,
    phone: phone,
    underArmAttacking: underArmAttacking,
    overHeadAttacking: overHeadAttacking,
    javelAttacking: javelAttacking,
    passAttacking: passAttacking,
    kickAttacking: kickAttacking,
    communicateAttacking: communicateAttacking,
    positionAttacking: positionAttacking,
    communicationAttacking: communicationAttacking,
    leadingSupportAttacking: leadingSupportAttacking,
    oneVSoneDefending: oneVSoneDefending,
    highDiveDefending: highDiveDefending,
    lowDiveDefending: lowDiveDefending,
    cupingDefending: cupingDefending,
    wShapeDefending: wShapeDefending,
    scoopingDefending: scoopingDefending,
    shortstepingDefending: shortstepingDefending,
    setPositionDefending: setPositionDefending,
    startPositionDefending: startPositionDefending,
    movmentsDefending: movmentsDefending,
    defenceOrgnizationDefending: defenceOrgnizationDefending,
    communicationDefending: communicationDefending,
    passTransition: passTransition,
    reciveTransition: reciveTransition,
    movmentsTransition: movmentsTransition,
    positionTransition: positionTransition,
    communicationTransition: communicationTransition,
    totalAvg: totalAvg,
  );

  final json = student.toJson();
  await docStudents.update(json);
}
