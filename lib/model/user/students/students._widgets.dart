import 'package:flutter/material.dart';

import '../../../view/admin/players/add_students/add_students.dart';
import '../../colors/colors.dart';
import '../../student/student_widgets.dart';

class MatchFullContainer extends StatelessWidget {
  const MatchFullContainer({
    super.key,
    required this.under15,
  });
  final ModelStudents under15;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.amber,
                border: Border.all(),
              ),
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CampMatchSecondTitle(title: "Total Average"),
                    const SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(
                      value: under15.totalAVGCamp,
                      strokeWidth: 8,
                      backgroundColor: const Color.fromARGB(141, 79, 78, 78),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${(under15.totalAVGCamp * 100).toInt()}%",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CampFullContainers extends StatelessWidget {
  const CampFullContainers({
    super.key,
    required this.under15,
  });
  final ModelStudents under15;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.amber,
                  border: Border.all()),
              // height: 400,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CampMatchSecondTitle(title: "Attacking W/Ball"),
                    DataLinearGraph(
                        title: 'Dribbling',
                        percentage:
                            "${(under15.dribblingAttackCamp * 100).toInt()}",
                        value: under15.dribblingAttackCamp),
                    DataLinearGraph(
                      title: 'Passing',
                      percentage:
                          "${(under15.passingAttackCamp * 100).toInt()}",
                      value: under15.passingAttackCamp,
                    ),
                    DataLinearGraph(
                      title: 'Receiving',
                      percentage:
                          "${(under15.receivingAttackCamp * 100).toInt()}",
                      value: under15.receivingAttackCamp,
                    ),
                    DataLinearGraph(
                      title: 'Heading',
                      percentage: "${(under15.headAttackCamp * 100).toInt()}",
                      value: under15.headAttackCamp,
                    ),
                    DataLinearGraph(
                      title: 'Finishing',
                      percentage:
                          " ${(under15.finishingAttackCamp * 100).toInt()}",
                      value: under15.finishingAttackCamp,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Divider(),
                    const CampMatchSecondTitle(title: "Attacking W/O Ball"),
                    DataLinearGraph(
                      title: 'Support',
                      percentage:
                          '${(under15.supportAttackingCamp * 100).toInt()}',
                      value: under15.supportAttackingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Width',
                      percentage:
                          '${(under15.widthAttackingCamp * 100).toInt()}',
                      value: under15.widthAttackingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Depth',
                      percentage:
                          '${(under15.depthAttackingCamp * 100).toInt()}',
                      value: under15.depthAttackingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Mobility',
                      percentage:
                          '${(under15.mobilityAttackingCamp * 100).toInt()}',
                      value: under15.mobilityAttackingCamp,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CampMatchSecondTitle(title: "Defending W/Ball"),
                    DataLinearGraph(
                      title: 'Pressure',
                      percentage:
                          '${(under15.pressureDefendingCamp * 100).toInt()}',
                      value: under15.pressureDefendingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Delay',
                      percentage:
                          '${(under15.delayDefendingCamp * 100).toInt()}',
                      value: under15.delayDefendingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Tackling',
                      percentage:
                          '${(under15.tacklingDefendingCamp * 100).toInt()}',
                      value: under15.tacklingDefendingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Heading',
                      percentage: '${(under15.headAttackCamp * 100).toInt()}',
                      value: under15.headAttackCamp,
                    ),
                    DataLinearGraph(
                      title: 'Clearence',
                      percentage:
                          '${(under15.clearenceDefendingCamp * 100).toInt()}',
                      value: under15.clearenceDefendingCamp,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CampMatchSecondTitle(title: "Defending W/O Ball"),
                    DataLinearGraph(
                      title: 'Cover',
                      percentage:
                          '${(under15.coverDefendingCamp * 100).toInt()}',
                      value: under15.coverDefendingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Balence',
                      percentage:
                          '${(under15.balenceDefendingCamp * 100).toInt()}',
                      value: under15.balenceDefendingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Marking',
                      percentage:
                          '${(under15.markingDefendingCamp * 100).toInt()}',
                      value: under15.markingDefendingCamp,
                    ),
                    DataLinearGraph(
                      title: 'Interception',
                      percentage:
                          '${(under15.interceptionDefendingCamp * 100).toInt()}',
                      value: under15.interceptionDefendingCamp,
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    const CampMatchSecondTitle(title: "Mental"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all()),
                            // ignore: prefer_const_constructors
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  DataLinearGraph(
                                    title: 'Atitude',
                                    percentage:
                                        '${(under15.atitudeMentalCamp * 100).toInt()}',
                                    value: under15.atitudeMentalCamp,
                                  ),
                                  DataLinearGraph(
                                    title: 'Toughness',
                                    percentage:
                                        '${(under15.toughnessMentalCamp * 100).toInt()}',
                                    value: under15.toughnessMentalCamp,
                                  ),
                                  DataLinearGraph(
                                    title: 'Commitment',
                                    percentage:
                                        '${(under15.commitmentMentalCamp * 100).toInt()}',
                                    value: under15.commitmentMentalCamp,
                                  ),
                                  DataLinearGraph(
                                    title: 'Perseverance',
                                    percentage:
                                        '${(under15.perseveranceMentalCamp * 100).toInt()}',
                                    value: under15.perseveranceMentalCamp,
                                  ),
                                  DataLinearGraph(
                                    title: 'Confidence',
                                    percentage:
                                        '${(under15.confidenceMentalCamp * 100).toInt()}',
                                    value: under15.confidenceMentalCamp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "=",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const CircularProgressIndicator(
                                strokeWidth: 5,
                                value: 0.20,
                                backgroundColor:
                                    Color.fromARGB(141, 79, 78, 78),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${(under15.totalMentalCamp * 100).toInt()}%",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    const CampMatchSecondTitle(title: "Physical"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const CircularProgressIndicator(
                                strokeWidth: 5,
                                value: 0.20,
                                backgroundColor:
                                    Color.fromARGB(141, 79, 78, 78),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  kBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${(under15.totalPhysicalCamp * 100).toInt()}%",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "=",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all()),
                            // ignore: prefer_const_constructors
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  DataLinearGraph(
                                      title: 'Agility',
                                      percentage:
                                          '${(under15.agilityPhysicalCamp * 100).toInt()}',
                                      value: under15.agilityPhysicalCamp),
                                  DataLinearGraph(
                                      title: 'Balance',
                                      percentage:
                                          '${(under15.balancePhysicalCamp * 100).toInt()}',
                                      value: under15.balancePhysicalCamp),
                                  DataLinearGraph(
                                      title: 'Flexibility',
                                      percentage:
                                          '${(under15.flexibilityPhysicalCamp * 100).toInt()}',
                                      value: under15.flexibilityPhysicalCamp),
                                  DataLinearGraph(
                                      title: 'Strength',
                                      percentage:
                                          '${(under15.strengthPhysicalCamp * 100).toInt()}',
                                      value: under15.strengthPhysicalCamp),
                                  DataLinearGraph(
                                      title: 'Speed',
                                      percentage:
                                          '${(under15.speedPhysicalCamp * 100).toInt()}',
                                      value: under15.speedPhysicalCamp),
                                  DataLinearGraph(
                                      title: 'Power',
                                      percentage:
                                          '${(under15.powerPhysicalCamp * 100).toInt()}',
                                      value: under15.powerPhysicalCamp),
                                  DataLinearGraph(
                                    title: 'Endurence',
                                    percentage:
                                        '${(under15.endurencePhysicalCamp * 100).toInt()}',
                                    value: under15.endurencePhysicalCamp,
                                  ),
                                  DataLinearGraph(
                                      title: 'Reflexes',
                                      percentage:
                                          '${(under15.reflexesPhysicalCamp * 100).toInt()}',
                                      value: under15.reflexesPhysicalCamp),
                                  DataLinearGraph(
                                    title: 'Discipline',
                                    percentage:
                                        '${(under15.disciplinPhysicalCamp * 100).toInt()}',
                                    value: under15.disciplinPhysicalCamp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Positioned(
          left: 0,
          right: 0,
          top: 10,
          child: Center(
            child: MatchOrCamp(
              startColor: kMCBlue,
              endColor: kMCViolet,
              title: 'Camp',
            ),
          ),
        ),
      ],
    );
  }
}
