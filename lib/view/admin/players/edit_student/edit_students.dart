import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trappra_chat/model/colors/colors.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_students.dart';

import '../../../../model/const/const.dart';
import '../../../../model/student/student_widgets.dart';

class EditStudents extends StatefulWidget {
  const EditStudents({
    super.key,
    required this.studentModel,
  });
  final ModelStudents studentModel;
  @override
  State<EditStudents> createState() => _EditStudentsState();
}

class _EditStudentsState extends State<EditStudents> {
  @override
  void initState() {
    uIdController = TextEditingController(text: widget.studentModel.uId);
    nameController = TextEditingController(text: widget.studentModel.name);
    dobController = TextEditingController(text: widget.studentModel.dob);
    yearController = TextEditingController(text: widget.studentModel.year);
    phoneContrller = TextEditingController(text: widget.studentModel.phone);
    //////////////////////////////////////////////////////////////////////
    dribblingAttaackCampController = TextEditingController(
        text: widget.studentModel.dribblingAttackCamp.toString());
    passingAttackCampController = TextEditingController(
        text: widget.studentModel.passingAttackCamp.toString());
    receivingAttackCampController = TextEditingController(
        text: widget.studentModel.receivingAttackCamp.toString());
    headingAttackCampcontroller = TextEditingController(
        text: widget.studentModel.headAttackCamp.toString());
    finishingAttackCcampController = TextEditingController(
        text: widget.studentModel.finishingAttackCamp.toString());
    //////////////////////////////////////////////////////////////////////
    supportAttackController = TextEditingController(
        text: widget.studentModel.supportAttackingCamp.toString());
    widthAttackCotroller = TextEditingController(
        text: widget.studentModel.widthAttackingCamp.toString());
    depthAttackController = TextEditingController(
        text: widget.studentModel.depthAttackingCamp.toString());
    mobilityAttackingController = TextEditingController(
        text: widget.studentModel.mobilityAttackingCamp.toString());
    //////////////////////////////////////////////////////////////////////
    pressureDefendingController = TextEditingController(
        text: widget.studentModel.pressureDefendingCamp.toString());
    delayDefendingController = TextEditingController(
        text: widget.studentModel.delayDefendingCamp.toString());
    tacklingDefendingController = TextEditingController(
        text: widget.studentModel.tacklingDefendingCamp.toString());
    headingDefendingController = TextEditingController(
        text: widget.studentModel.headingDefendingCamp.toString());
    clearenceDefendingController = TextEditingController(
        text: widget.studentModel.clearenceDefendingCamp.toString());
    //////////////////////////////////////////////////////////////////////
    coverAttackController = TextEditingController(
        text: widget.studentModel.coverDefendingCamp.toString());
    balenceDefendingController = TextEditingController(
        text: widget.studentModel.balenceDefendingCamp.toString());
    markingDefendingController = TextEditingController(
        text: widget.studentModel.markingDefendingCamp.toString());
    interceptionDefendingController = TextEditingController(
        text: widget.studentModel.interceptionDefendingCamp.toString());
    //////////////////////////////////////////////////////////////////////
    atitudeMentalController = TextEditingController(
        text: widget.studentModel.atitudeMentalCamp.toString());
    toughnessMentalController = TextEditingController(
        text: widget.studentModel.toughnessMentalCamp.toString());
    commitmentMentalController = TextEditingController(
        text: widget.studentModel.commitmentMentalCamp.toString());
    perseveranceMentalController = TextEditingController(
        text: widget.studentModel.perseveranceMentalCamp.toString());
    confidenceMentalController = TextEditingController(
        text: widget.studentModel.confidenceMentalCamp.toString());
    totalMentalController = TextEditingController(
        text: widget.studentModel.totalMentalCamp.toString());
    //////////////////////////////////////////////////////////////////////
    agilityPhysicalController = TextEditingController(
        text: widget.studentModel.agilityPhysicalCamp.toString());
    balancePhysicalController = TextEditingController(
        text: widget.studentModel.balancePhysicalCamp.toString());
    flexibilityPhysicalController = TextEditingController(
        text: widget.studentModel.flexibilityPhysicalCamp.toString());
    strengthPhysicalController = TextEditingController(
        text: widget.studentModel.strengthPhysicalCamp.toString());
    speedPhysicalController = TextEditingController(
        text: widget.studentModel.speedPhysicalCamp.toString());
    powerPhysicalController = TextEditingController(
        text: widget.studentModel.powerPhysicalCamp.toString());
    endurencePhysicalController = TextEditingController(
        text: widget.studentModel.endurencePhysicalCamp.toString());
    reflexesPhysicalController = TextEditingController(
        text: widget.studentModel.reflexesPhysicalCamp.toString());
    disciplinPhysicalController = TextEditingController(
        text: widget.studentModel.disciplinPhysicalCamp.toString());
    totalPhysicalController = TextEditingController(
        text: widget.studentModel.totalPhysicalCamp.toString());
    //////////////////////////////////////////////////////////////////////
    totalAVGController = TextEditingController(
        text: widget.studentModel.totalAVGCamp.toString());
    super.initState();
  }

  PlatformFile? pickedFile;
  String? imageUrlDownload;
  UploadTask? uploadTask;

  TextEditingController? uIdController;
  TextEditingController? nameController;
  TextEditingController? dobController;
  TextEditingController? yearController;
  TextEditingController? phoneContrller;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? dribblingAttaackCampController;
  TextEditingController? passingAttackCampController;
  TextEditingController? receivingAttackCampController;
  TextEditingController? headingAttackCampcontroller;
  TextEditingController? finishingAttackCcampController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? supportAttackController;
  TextEditingController? widthAttackCotroller;
  TextEditingController? depthAttackController;
  TextEditingController? mobilityAttackingController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? pressureDefendingController;
  TextEditingController? delayDefendingController;
  TextEditingController? tacklingDefendingController;
  TextEditingController? headingDefendingController;
  TextEditingController? clearenceDefendingController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? coverAttackController;
  TextEditingController? balenceDefendingController;
  TextEditingController? markingDefendingController;
  TextEditingController? interceptionDefendingController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? atitudeMentalController;
  TextEditingController? toughnessMentalController;
  TextEditingController? commitmentMentalController;
  TextEditingController? perseveranceMentalController;
  TextEditingController? confidenceMentalController;
  TextEditingController? totalMentalController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? agilityPhysicalController;
  TextEditingController? balancePhysicalController;
  TextEditingController? flexibilityPhysicalController;
  TextEditingController? strengthPhysicalController;
  TextEditingController? speedPhysicalController;
  TextEditingController? powerPhysicalController;
  TextEditingController? endurencePhysicalController;
  TextEditingController? reflexesPhysicalController;
  TextEditingController? disciplinPhysicalController;
  TextEditingController? totalPhysicalController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? totalAVGController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          "Edit ${widget.studentModel.batch}",
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
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
                            widget.studentModel.image,
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
                EditingTextField(
                  controller: nameController,
                  title: "Name",
                  type: TextInputType.name,
                  action: TextInputAction.next,
                ),
                EditingTextField(
                  controller: dobController,
                  title: "Date of Birth",
                  type: TextInputType.datetime,
                  action: TextInputAction.next,
                ),
                EditingTextField(
                  controller: yearController,
                  title: "Year of Birth",
                  type: TextInputType.datetime,
                  action: TextInputAction.next,
                ),
                EditingTextField(
                  controller: phoneContrller,
                  type: TextInputType.phone,
                  title: "Phone",
                  action: TextInputAction.next,
                ),
                /////////////////////////////////////////////////////////////
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
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
                        EditingTextField(
                          controller: dribblingAttaackCampController,
                          title: "Dribbling",
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        EditingTextField(
                          controller: passingAttackCampController,
                          title: "Passing",
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        EditingTextField(
                          controller: receivingAttackCampController,
                          title: "Receiving",
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        EditingTextField(
                          controller: headingAttackCampcontroller,
                          title: "Heading",
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        EditingTextField(
                          controller: finishingAttackCcampController,
                          title: "Finishing",
                          type: TextInputType.number,
                          action: TextInputAction.done,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Attacking W/O Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: supportAttackController!,
                          type: TextInputType.number,
                          title: 'Support',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: widthAttackCotroller!,
                          type: TextInputType.number,
                          title: 'Width',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: depthAttackController!,
                          type: TextInputType.number,
                          title: 'Depth',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: mobilityAttackingController!,
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
                          controller: pressureDefendingController!,
                          type: TextInputType.number,
                          title: 'Pressure',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: delayDefendingController!,
                          type: TextInputType.number,
                          title: 'Delay',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: tacklingDefendingController!,
                          type: TextInputType.number,
                          title: 'Tackling',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: headingAttackCampcontroller!,
                          type: TextInputType.number,
                          title: 'Heading',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: clearenceDefendingController!,
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
                          controller: coverAttackController!,
                          type: TextInputType.number,
                          title: 'Cover',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: balenceDefendingController!,
                          type: TextInputType.number,
                          title: 'Balance',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: markingDefendingController!,
                          type: TextInputType.number,
                          title: 'Marking',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: interceptionDefendingController!,
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
                          controller: atitudeMentalController!,
                          type: TextInputType.number,
                          title: 'Attitude',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: toughnessMentalController!,
                          type: TextInputType.number,
                          title: 'Toughness',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: commitmentMentalController!,
                          type: TextInputType.number,
                          title: 'Commitment',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: perseveranceMentalController!,
                          type: TextInputType.number,
                          title: 'Perseverance',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: confidenceMentalController!,
                          type: TextInputType.number,
                          title: 'Confidence',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: totalMentalController!,
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
                          controller: agilityPhysicalController!,
                          type: TextInputType.number,
                          title: 'Agility',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: balancePhysicalController!,
                          type: TextInputType.number,
                          title: 'Balance',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: flexibilityPhysicalController!,
                          type: TextInputType.number,
                          title: 'Flexibilty',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: strengthPhysicalController!,
                          type: TextInputType.number,
                          title: 'Strength',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: speedPhysicalController!,
                          type: TextInputType.number,
                          title: 'Speed',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: powerPhysicalController!,
                          type: TextInputType.number,
                          title: 'Power',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: endurencePhysicalController!,
                          type: TextInputType.number,
                          title: 'Endurence',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: reflexesPhysicalController!,
                          type: TextInputType.number,
                          title: 'Reflexes',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: disciplinPhysicalController!,
                          type: TextInputType.number,
                          title: 'Disciplin',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: totalPhysicalController!,
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
                          controller: totalAVGController!,
                          type: TextInputType.number,
                          title: 'Total AVG',
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: const Center(
                          child: Text(
                            "Editing......",
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
                    if (pickedFile != null) {
                      await uploadFile();
                    }
                    // ignore: use_build_context_synchronously

                    await editStudentsStudents(
                      batch: widget.studentModel.batch,
                      uId: uIdController!.text.trim(),
                      name: nameController!.text.trim(),
                      dob: dobController!.text.trim(),
                      year: yearController!.text.trim(),
                      phone: phoneContrller!.text.trim(),
                      image: pickedFile != null
                          ? imageUrlDownload
                          : widget.studentModel.image,
                      ///////////////////////////////////////////
                      dribblingAttackCamp: double.parse(
                          dribblingAttaackCampController!.text.trim()),
                      finishingAtackCamp: double.parse(
                          finishingAttackCcampController!.text.trim()),
                      headAttaackCamp: double.parse(
                          headingAttackCampcontroller!.text.trim()),
                      passingAttackCamp: double.parse(
                          passingAttackCampController!.text.trim()),
                      receivingAttackCamp: double.parse(
                          receivingAttackCampController!.text.trim()),
                      ///////////////////////////////////////////
                      supportAtackCamp:
                          double.parse(supportAttackController!.text.trim()),
                      widthAtackCamp:
                          double.parse(widthAttackCotroller!.text.trim()),
                      depthAtackCamp:
                          double.parse(depthAttackController!.text.trim()),
                      mobilityAtackCamp: double.parse(
                          mobilityAttackingController!.text.trim()),
                      /////////////////////////////////////////////
                      pressureDefendingCamp: double.parse(
                          pressureDefendingController!.text.trim()),
                      delayDefendingCamp:
                          double.parse(delayDefendingController!.text.trim()),
                      tacklingDefendingCamp: double.parse(
                          tacklingDefendingController!.text.trim()),
                      headingDefendingCamp:
                          double.parse(headingDefendingController!.text.trim()),
                      clearenceDefendingCamp: double.parse(
                          clearenceDefendingController!.text.trim()),
                      /////////////////////////////////////////////
                      coverDefendingCamp:
                          double.parse(coverAttackController!.text.trim()),
                      balanceDefendingCamp:
                          double.parse(balenceDefendingController!.text.trim()),
                      markingDefendingCamp:
                          double.parse(markingDefendingController!.text.trim()),
                      interceptionDefendingCamp: double.parse(
                          interceptionDefendingController!.text.trim()),
                      /////////////////////////////////////////////
                      atitudeMentalCamp:
                          double.parse(atitudeMentalController!.text.trim()),
                      toghnessMentalCamp:
                          double.parse(toughnessMentalController!.text.trim()),
                      commitmentMentalCamp:
                          double.parse(commitmentMentalController!.text.trim()),
                      preseveranceMentalCamp: double.parse(
                          perseveranceMentalController!.text.trim()),
                      confidenceMentalCamp:
                          double.parse(confidenceMentalController!.text.trim()),
                      totalMentalCamp:
                          double.parse(totalMentalController!.text.trim()),
                      /////////////////////////////////////////////
                      agilityPhysicalkCamp:
                          double.parse(agilityPhysicalController!.text.trim()),
                      balancePhysicalkCamp:
                          double.parse(balancePhysicalController!.text.trim()),
                      flexibilityPhysicalkCamp: double.parse(
                          flexibilityPhysicalController!.text.trim()),
                      strengthPhysicalkCamp:
                          double.parse(strengthPhysicalController!.text.trim()),
                      speedPhysicalkCamp:
                          double.parse(speedPhysicalController!.text.trim()),
                      powerPhysicalkCamp:
                          double.parse(powerPhysicalController!.text.trim()),
                      endurencePhysicalkCamp: double.parse(
                          endurencePhysicalController!.text.trim()),
                      reflexedPhysicalkCamp:
                          double.parse(reflexesPhysicalController!.text.trim()),
                      desciplinPhysicalkCamp: double.parse(
                          disciplinPhysicalController!.text.trim()),
                      totalPhysicalkCamp:
                          double.parse(totalPhysicalController!.text.trim()),
                      /////////////////////////////////////////////
                      totalAVGCamp:
                          double.parse(totalAVGController!.text.trim()),
                    );
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: const Center(
                          child: Text(
                            "Edited",
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
                    // ignore: use_build_context_synchronously
                    popNow(context);
                  },
                  child: const MatchOrCamp(
                    startColor: Color.fromARGB(33, 86, 86, 86),
                    endColor: Color.fromARGB(255, 0, 0, 0),
                    title: 'Uplaod',
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
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

Future editStudentsStudents({
  required String batch,
  required String uId,
  required String name,
  required String dob,
  required String image,
  required String year,
  required String phone,
  //////////////////////////////////////////
  required double dribblingAttackCamp,
  required double passingAttackCamp,
  required double receivingAttackCamp,
  required double headAttaackCamp,
  required double finishingAtackCamp,
  //////////////////////////////////////////
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
  final docUnder15 = FirebaseFirestore.instance
      .collection("CFC")
      .doc("Students")
      .collection(batch)
      .doc(uId);

  final under15 = ModelStudents(
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

  final json = under15.toJson();
  await docUnder15.update(json);
}

class EditingTextField extends StatelessWidget {
  const EditingTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.type,
    required this.action,
  });

  final TextEditingController? controller;
  final String title;
  final TextInputType type;
  final TextInputAction action;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          keyboardType: type,
          textInputAction: action,
          decoration: InputDecoration(
            filled: true,
            fillColor: kField,
            // hintText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
