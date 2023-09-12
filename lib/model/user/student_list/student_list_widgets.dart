import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/goto_user.dart';
import '../../../view/admin/players/add_students/add_gk.dart';
import '../../../view/admin/players/add_students/add_students.dart';
import '../../colors/colors.dart';

class GkListContainer extends StatelessWidget {
  const GkListContainer({
    super.key,
    required this.student,
    required this.context,
    // required this.progressValue,
  });
  final ModelGK student;
  final BuildContext context;
  // final double progressValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        top: 10,
        right: 5,
        bottom: 10,
      ),
      child: GestureDetector(
        onTap: () {
          gotoGkStudentDetils(
            context: context,
            student: student,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                kWhite,
                Color.fromARGB(97, 0, 0, 0),
              ],
              end: Alignment.bottomLeft,
              begin: Alignment.topRight,
            ),
            // boxShadow: [
            //   BoxShadow(color: Color.fromARGB(255, 97, 97, 97))
            // ],
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                      width: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      height: 50,
                      width: 50,
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
                    // CircleAvatar(
                    //   radius: 25,
                    //   backgroundColor: const Color.fromARGB(255, 255, 200, 36),
                    //   child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(
                    //         100,
                    //       ),
                    //       child: Image.network(
                    //         student.image,
                    //         fit: BoxFit.cover,
                    //       )),
                    // ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        student.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    student.uId,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 55, 55, 55),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    student.year,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 55, 55, 55),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total AVG:-",
                        style: TextStyle(
                            color: Color.fromARGB(255, 55, 55, 55),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Stack(
                        children: [
                          CircularProgressIndicator(
                            value: student.totalAvg,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 55, 55, 55),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            right: 5,
                            top: 12,
                            bottom: 10,
                            child: Text(
                              '${(student.totalAvg * 100).toInt()}%',
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // height: 50,
        ),
      ),
    );
  }
}

class ShimmerStudentList extends StatelessWidget {
  const ShimmerStudentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5),
        padding: const EdgeInsets.all(10),
        children: [
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(
                255, 222, 222, 222), // Color when not shimmering
            highlightColor: kHighlight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kWhite,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              // Color of the content
            ),
          ),
          // si
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(
                255, 222, 222, 222), // Color when not shimmering
            highlightColor: kHighlight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kWhite,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              // Color of the content
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(
                    255, 222, 222, 222), // Color when not shimmering
                highlightColor: kHighlight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                  ),
                  width: double.infinity,
                  height: 8,
                  // Color of the content
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(
                    255, 222, 222, 222), // Color when not shimmering
                highlightColor: kHighlight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                  ),
                  width: 100,
                  height: 8,
                  // Color of the content
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(
                    255, 222, 222, 222), // Color when not shimmering
                highlightColor: kHighlight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                  ),
                  width: 150,
                  height: 8,
                  // Color of the content
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(
                    255, 222, 222, 222), // Color when not shimmering
                highlightColor: kHighlight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                  ),
                  width: double.infinity,
                  height: 8,
                  // Color of the content
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(
                    255, 222, 222, 222), // Color when not shimmering
                highlightColor: kHighlight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                  ),
                  width: 100,
                  height: 8,
                  // Color of the content
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(
                    255, 222, 222, 222), // Color when not shimmering
                highlightColor: kHighlight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                  ),
                  width: 150,
                  height: 8,
                  // Color of the content
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StudentListContainer extends StatelessWidget {
  const StudentListContainer({
    super.key,
    required this.student,
    required this.context,
    // required this.progressValue,
  });
  final ModelStudents student;
  final BuildContext context;
  // final double progressValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        top: 10,
        right: 5,
        bottom: 10,
      ),
      child: GestureDetector(
        onTap: () {
          gotoUnder15StudentDetils(
            context: context,
            student: student,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                kWhite,
                Color.fromARGB(97, 0, 0, 0),
              ],
              end: Alignment.bottomLeft,
              begin: Alignment.topRight,
            ),
            // boxShadow: [
            //   BoxShadow(color: Color.fromARGB(255, 97, 97, 97))
            // ],
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                      width: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      height: 50,
                      width: 50,
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
                    // CircleAvatar(
                    //   radius: 25,
                    //   backgroundColor: const Color.fromARGB(255, 255, 200, 36),
                    //   child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(
                    //         100,
                    //       ),
                    //       child: Image.network(
                    //         student.image,
                    //         fit: BoxFit.cover,
                    //       )),
                    // ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        student.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    student.uId,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 55, 55, 55),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    student.year,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 55, 55, 55),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total AVG:-",
                        style: TextStyle(
                            color: Color.fromARGB(255, 55, 55, 55),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Stack(
                        children: [
                          CircularProgressIndicator(
                            value: student.totalAVGCamp,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 55, 55, 55),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            right: 5,
                            top: 12,
                            bottom: 10,
                            child: Text(
                              '${(student.totalAVGCamp * 100).toInt()}%',
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // height: 50,
        ),
      ),
    );
  }
}
