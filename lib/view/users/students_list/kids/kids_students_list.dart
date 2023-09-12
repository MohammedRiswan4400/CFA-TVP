import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trappra_chat/view/admin/players/add_students/add_students.dart';
import '../../../../model/colors/colors.dart';
import '../../../../model/user/student_list/student_list_widgets.dart';

class ScreenKidsList extends StatelessWidget {
  const ScreenKidsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kBlack,
            )),
        automaticallyImplyLeading: false,
        title: const Text(
          'Kids',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: kBlack,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor:
            const Color.fromARGB(255, 231, 229, 229).withAlpha(400),
        shadowColor: kTransparent,
        toolbarHeight: 60,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: kBackground),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: kBackground,
          ),
          width: double.infinity,
          child: StreamBuilder(
            stream: readKidsStudents(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                const Center(child: Text("Error"));
              }
              if (snapshot.hasData) {
                final students = snapshot.data;
                if (students!.isEmpty) {
                  return Center(
                    child: LottieBuilder.network(
                      "https://lottie.host/83704717-c94d-4c29-bc89-96ce363ba719/i03SmNptvE.json",
                    ),
                  );
                } else {
                  return GestureDetector(
                    child: ListView(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: students.length,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            final student = students[index];
                            return StudentListContainer(
                              context: context,
                              student: student,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
              }
              return const ShimmerStudentList();
            },
          ),
        ),
      ),
    );
  }

  Stream<List<ModelStudents>> readKidsStudents() => FirebaseFirestore.instance
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
