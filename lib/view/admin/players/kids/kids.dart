import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:trappra_chat/model/colors/colors.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_students.dart';

import '../../../../controller/goto_admin.dart';
import '../../../../model/const/const.dart';
import '../edit_student/edit_students.dart';

class ScreenKids extends StatelessWidget {
  const ScreenKids({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kids"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                gotoAddingStudents(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        kLightBlack,
                        kField,
                      ],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add Students",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.bar_chart_rounded,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder(
              stream: readKids(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  const Center(
                    child: Text("Error"),
                  );
                }
                if (snapshot.hasData) {
                  final students = snapshot.data;
                  if (students!.isEmpty) {
                    return LottieBuilder.network(
                      "https://lottie.host/83704717-c94d-4c29-bc89-96ce363ba719/i03SmNptvE.json",
                      fit: BoxFit.contain,
                    );
                  } else {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];
                        return KidsSlidableWidget(student: student);
                      },
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // const Text("data")
        ],
      ),
    );
  }

  // Slidable buildWidget({required ModelStudents student}) {
  //   return Slidable(
  //     endActionPane: ActionPane(
  //       motion: const StretchMotion(),
  //       children: [
  //         SlidableAction(
  //           onPressed: (context) {
  //             Navigator.of(context).push(
  //               MaterialPageRoute(
  //                 builder: (context) => EditStudents(
  //                   studentModel: student,
  //                   // Under15Model: student,
  //                 ),
  //               ),
  //             );
  //           },
  //           backgroundColor: kBlue,
  //           borderRadius: const BorderRadius.only(
  //               bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
  //           icon: Icons.edit_document,
  //           label: "Edit",
  //         ),
  //         SlidableAction(
  //           onPressed: (context) {
  //             showModalBottomSheet(
  //               context: context,
  //               builder: (context) => Container(
  //                 decoration: const BoxDecoration(
  //                   color: kWhite,
  //                   borderRadius: BorderRadius.vertical(
  //                     top: Radius.circular(
  //                       20,
  //                     ),
  //                   ),
  //                 ),
  //                 height: 202,
  //                 width: double.infinity,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(10.0),
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           color: kHint,
  //                           borderRadius: BorderRadius.circular(310),
  //                         ),
  //                         height: 7,
  //                         width: 30,
  //                       ),
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       const Text(
  //                         "Delete",
  //                         style: TextStyle(
  //                             fontFamily: "Ubuntu",
  //                             fontSize: 14,
  //                             color: kred,
  //                             fontWeight: FontWeight.bold),
  //                       ),
  //                       const SizedBox(height: 40),
  //                       const Text(
  //                         "Are you sure you want to Delete",
  //                         style: TextStyle(
  //                             fontFamily: "Ubuntu",
  //                             fontSize: 14,
  //                             fontWeight: FontWeight.bold),
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           ElevatedButton(
  //                             onPressed: () {
  //                               popNow(context);
  //                             },
  //                             style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all(
  //                                 kField,
  //                               ),
  //                             ),
  //                             child: const Text(
  //                               "Cancel",
  //                               style: TextStyle(
  //                                   fontFamily: "Ubuntu",
  //                                   fontSize: 12,
  //                                   color: kBlack),
  //                             ),
  //                           ),
  //                           const SizedBox(width: 50),
  //                           ElevatedButton(
  //                             onPressed: () {
  //                               final docUnder15 = FirebaseFirestore.instance
  //                                   .collection("CFC")
  //                                   .doc("Students")
  //                                   .collection("Under 20")
  //                                   .doc(student.uId);
  //                               docUnder15.delete();
  //                               popNow(context);
  //                             },
  //                             style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all(
  //                                 kField,
  //                               ),
  //                             ),
  //                             child: const Text(
  //                               "Yes",
  //                               style: TextStyle(
  //                                 color: kBlack,
  //                                 fontFamily: "Ubuntu",
  //                                 fontSize: 12,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //           backgroundColor: kred,
  //           icon: Icons.delete_rounded,
  //           label: "Delete",
  //         ),
  //       ],
  //     ),
  //     child: ListTile(
  //       title: Text(student.name),
  //       subtitle: Text(student.phone),
  //       trailing: Text(student.dob),
  //       leading: CircleAvatar(
  //         // backgroundColor: Colors.amber,
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(
  //             100,
  //           ),
  //           child: Image.network(
  //             student.image,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Stream<List<ModelStudents>> readKids() => FirebaseFirestore.instance
      .collection("CFC")
      .doc("Students")
      .collection("Kids")
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => ModelStudents.fromJson(
                doc.data(),
              ),
            )
            .toList(),
      );
}

class KidsSlidableWidget extends StatelessWidget {
  const KidsSlidableWidget({
    super.key,
    required this.student,
  });
  final ModelStudents student;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditStudents(
                    studentModel: student,
                    // Under15Model: student,
                  ),
                ),
              );
            },
            backgroundColor: kBlue,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
            icon: Icons.edit_document,
            label: "Edit",
          ),
          SlidableAction(
            onPressed: (context) {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  height: 202,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kHint,
                            borderRadius: BorderRadius.circular(310),
                          ),
                          height: 7,
                          width: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Delete",
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              color: kred,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Are you sure you want to Delete",
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                popNow(context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  kField,
                                ),
                              ),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontFamily: "Ubuntu",
                                    fontSize: 12,
                                    color: kBlack),
                              ),
                            ),
                            const SizedBox(width: 50),
                            ElevatedButton(
                              onPressed: () {
                                final docUnder15 = FirebaseFirestore.instance
                                    .collection("CFC")
                                    .doc("Students")
                                    .collection("Kids")
                                    .doc(student.uId);
                                docUnder15.delete();
                                popNow(context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  kField,
                                ),
                              ),
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                  color: kBlack,
                                  fontFamily: "Ubuntu",
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            backgroundColor: kred,
            icon: Icons.delete_rounded,
            label: "Delete",
          ),
        ],
      ),
      child: ListTile(
        title: Text(student.name),
        subtitle: Text(student.phone),
        trailing: Text(student.dob),
        leading: CircleAvatar(
          // backgroundColor: Colors.amber,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              100,
            ),
            child: Image.network(
              student.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
