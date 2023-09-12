import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trappra_chat/model/colors/colors.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_gk.dart';

import '../../../../model/const/const.dart';
import '../../../../model/student/student_widgets.dart';

class ScreenEditGK extends StatefulWidget {
  const ScreenEditGK({
    super.key,
    required this.studentModel,
  });
  final ModelGK studentModel;
  @override
  State<ScreenEditGK> createState() => _ScreenEditGKState();
}

class _ScreenEditGKState extends State<ScreenEditGK> {
  @override
  void initState() {
    uIdController = TextEditingController(text: widget.studentModel.uId);
    nameController = TextEditingController(text: widget.studentModel.name);
    dobController = TextEditingController(text: widget.studentModel.dob);
    yearController = TextEditingController(text: widget.studentModel.year);
    phoneContrller = TextEditingController(text: widget.studentModel.phone);
    //////////////////////////////////////////////////////////////////////
    underArmController = TextEditingController(
        text: widget.studentModel.underArmAttacking.toString());
    overHeadController = TextEditingController(
        text: widget.studentModel.overHeadAttacking.toString());
    javelController = TextEditingController(
        text: widget.studentModel.javelAttacking.toString());
    passAttackController = TextEditingController(
        text: widget.studentModel.passAttacking.toString());
    kickAttackController = TextEditingController(
        text: widget.studentModel.kickAttacking.toString());
    communicateAttackController = TextEditingController(
        text: widget.studentModel.communicateAttacking.toString());
    /////////////////////////////////////////////////////////////////////
    positionAttackController = TextEditingController(
        text: widget.studentModel.positionAttacking.toString());
    communicationAttackController = TextEditingController(
        text: widget.studentModel.communicationAttacking.toString());
    leadingAndSupportingController = TextEditingController(
        text: widget.studentModel.leadingSupportAttacking.toString());
    /////////////////////////////////////////////////////////////////////
    oneVSoneDefendingController = TextEditingController(
        text: widget.studentModel.oneVSoneDefending.toString());
    highDiveDefendingController = TextEditingController(
        text: widget.studentModel.highDiveDefending.toString());
    lowDiveController = TextEditingController(
        text: widget.studentModel.lowDiveDefending.toString());
    cupingDefendingController = TextEditingController(
        text: widget.studentModel.cupingDefending.toString());
    wshapeDefendingController = TextEditingController(
        text: widget.studentModel.wShapeDefending.toString());
    scoopingDefendingController = TextEditingController(
        text: widget.studentModel.scoopingDefending.toString());
    shortSteppingController = TextEditingController(
        text: widget.studentModel.shortstepingDefending.toString());
    ///////////////////////////////////////////////////////////////////
    setPositionDefendingController = TextEditingController(
        text: widget.studentModel.setPositionDefending.toString());
    startPositionDefendingController = TextEditingController(
        text: widget.studentModel.startPositionDefending.toString());
    movmentsDefendingController = TextEditingController(
        text: widget.studentModel.movmentsDefending.toString());
    defenceOrganisingController = TextEditingController(
        text: widget.studentModel.defenceOrgnizationDefending.toString());
    communicationDefendingController = TextEditingController(
        text: widget.studentModel.communicationDefending.toString());
    ///////////////////////////////////////////////////////////////////
    passTransitionController = TextEditingController(
        text: widget.studentModel.passTransition.toString());
    recieveTransitionController = TextEditingController(
        text: widget.studentModel.reciveTransition.toString());
    movmentsTransitionController = TextEditingController(
        text: widget.studentModel.movmentsTransition.toString());
    ///////////////////////////////////////////////////////////////////
    positionTransitionController = TextEditingController(
        text: widget.studentModel.positionTransition.toString());
    communicationTransitionController = TextEditingController(
        text: widget.studentModel.communicationTransition.toString());
    ///////////////////////////////////////////////////////////////////
    totalAVGController =
        TextEditingController(text: widget.studentModel.totalAvg.toString());
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
  TextEditingController? underArmController;
  TextEditingController? overHeadController;
  TextEditingController? javelController;
  TextEditingController? passAttackController;
  TextEditingController? kickAttackController;
  TextEditingController? communicateAttackController;

  //////////////////////////////////////////////////////////////////////
  TextEditingController? positionAttackController;
  TextEditingController? communicationAttackController;
  TextEditingController? leadingAndSupportingController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? oneVSoneDefendingController;
  TextEditingController? highDiveDefendingController;
  TextEditingController? lowDiveController;
  TextEditingController? cupingDefendingController;
  TextEditingController? wshapeDefendingController;
  TextEditingController? scoopingDefendingController;
  TextEditingController? shortSteppingController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? setPositionDefendingController;
  TextEditingController? startPositionDefendingController;
  TextEditingController? movmentsDefendingController;
  TextEditingController? defenceOrganisingController;
  TextEditingController? communicationDefendingController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? passTransitionController;
  TextEditingController? recieveTransitionController;
  TextEditingController? movmentsTransitionController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? positionTransitionController;
  TextEditingController? communicationTransitionController;
  //////////////////////////////////////////////////////////////////////
  TextEditingController? totalAVGController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        title: const Text(
          "Edit GK",
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
                          controller: underArmController,
                          title: "Under Arm",
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        EditingTextField(
                          controller: overHeadController,
                          title: "Over Head ",
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        EditingTextField(
                          controller: javelController,
                          title: "Javel",
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        EditingTextField(
                          controller: passAttackController,
                          title: "Pass",
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        EditingTextField(
                          controller: kickAttackController,
                          title: "Kick",
                          type: TextInputType.number,
                          action: TextInputAction.done,
                        ),
                        EditingTextField(
                          controller: communicateAttackController,
                          title: "Communicate",
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
                          controller: positionAttackController!,
                          type: TextInputType.number,
                          title: 'Position',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: communicationAttackController!,
                          type: TextInputType.number,
                          title: 'Communication',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: leadingAndSupportingController!,
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
                          controller: oneVSoneDefendingController!,
                          type: TextInputType.number,
                          title: 'ONE vs ONE',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: highDiveDefendingController!,
                          type: TextInputType.number,
                          title: 'High Dive',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: lowDiveController!,
                          type: TextInputType.number,
                          title: 'Low Dive',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: cupingDefendingController!,
                          type: TextInputType.number,
                          title: 'Cuping',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: wshapeDefendingController!,
                          type: TextInputType.number,
                          title: 'W shape',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: scoopingDefendingController!,
                          type: TextInputType.number,
                          title: 'Scooping',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: shortSteppingController!,
                          type: TextInputType.number,
                          title: 'Short Stepping',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Defending W/O Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: setPositionDefendingController!,
                          type: TextInputType.number,
                          title: 'Set Position',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: startPositionDefendingController!,
                          type: TextInputType.number,
                          title: 'Start Position',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: movmentsDefendingController!,
                          type: TextInputType.number,
                          title: 'Movments',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: defenceOrganisingController!,
                          type: TextInputType.number,
                          title: 'Defence Organisation',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: communicationDefendingController!,
                          type: TextInputType.number,
                          title: 'Communication',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(title: "Transition W/ Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: passTransitionController!,
                          type: TextInputType.number,
                          title: 'Pass',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: recieveTransitionController!,
                          type: TextInputType.number,
                          title: 'Recive',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: movmentsTransitionController!,
                          type: TextInputType.number,
                          title: 'Movments',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////
                        const CampMatchSecondTitle(
                            title: "Transotion W/O Ball"),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: positionTransitionController!,
                          type: TextInputType.number,
                          title: 'Position',
                        ),
                        StudentFormField(
                          action: TextInputAction.next,
                          controller: communicationTransitionController!,
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

                    await editGK(
                      uId: uIdController!.text.trim(),
                      name: nameController!.text.trim(),
                      dob: dobController!.text.trim(),
                      year: yearController!.text.trim(),
                      phone: phoneContrller!.text.trim(),
                      image: pickedFile != null
                          ? imageUrlDownload
                          : widget.studentModel.image,
                      ///////////////////////////////////////////
                      underArmAttacking:
                          double.parse(underArmController!.text.trim()),
                      overHeadAttacking:
                          double.parse(overHeadController!.text.trim()),
                      javelAttacking:
                          double.parse(javelController!.text.trim()),
                      passAttacking:
                          double.parse(passAttackController!.text.trim()),
                      kickAttacking:
                          double.parse(kickAttackController!.text.trim()),
                      communicateAttacking: double.parse(
                          communicateAttackController!.text.trim()),
                      ///////////////////////////////////////////
                      positionAttacking:
                          double.parse(positionAttackController!.text.trim()),
                      communicationAttacking: double.parse(
                          communicationAttackController!.text.trim()),
                      leadingSupportAttacking: double.parse(
                          leadingAndSupportingController!.text.trim()),
                      ///////////////////////////////////////////
                      oneVSoneDefending: double.parse(
                          oneVSoneDefendingController!.text.trim()),
                      highDiveDefending: double.parse(
                          highDiveDefendingController!.text.trim()),
                      lowDiveDefending:
                          double.parse(lowDiveController!.text.trim()),
                      cupingDefending:
                          double.parse(cupingDefendingController!.text.trim()),
                      wShapeDefending:
                          double.parse(wshapeDefendingController!.text.trim()),
                      scoopingDefending: double.parse(
                          scoopingDefendingController!.text.trim()),
                      shortstepingDefending:
                          double.parse(shortSteppingController!.text.trim()),
                      ///////////////////////////////////////////
                      setPositionDefending: double.parse(
                          setPositionDefendingController!.text.trim()),
                      startPositionDefending: double.parse(
                          startPositionDefendingController!.text.trim()),
                      movmentsDefending: double.parse(
                          movmentsDefendingController!.text.trim()),
                      defenceOrgnizationDefending: double.parse(
                          defenceOrganisingController!.text.trim()),
                      communicationDefending: double.parse(
                          communicateAttackController!.text.trim()),
                      ///////////////////////////////////////////
                      passTransition:
                          double.parse(passTransitionController!.text.trim()),
                      reciveTransition: double.parse(
                          recieveTransitionController!.text.trim()),
                      movmentsTransition: double.parse(
                          movmentsTransitionController!.text.trim()),
                      ///////////////////////////////////////////
                      positionTransition: double.parse(
                          positionTransitionController!.text.trim()),
                      communicationTransition: double.parse(
                          communicationTransitionController!.text.trim()),
                      ///////////////////////////////////////////
                      totalAvg: double.parse(totalAVGController!.text.trim()),
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
