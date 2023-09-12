import 'package:flutter/material.dart';

import '../../../view/admin/players/add_students/add_gk.dart';
import '../../colors/colors.dart';
import '../../student/student_widgets.dart';

class MatchFullGkContainer extends StatelessWidget {
  const MatchFullGkContainer({
    super.key,
    required this.under15,
  });
  final ModelGK under15;
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
                      value: under15.totalAvg,
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
                      "${(under15.totalAvg * 100).toInt()}%",
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

class GkFullContaine extends StatelessWidget {
  const GkFullContaine({
    super.key,
    required this.under15,
  });
  final ModelGK under15;
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
                        title: 'Under Arm',
                        percentage:
                            "${(under15.underArmAttacking * 100).toInt()}",
                        value: under15.underArmAttacking),
                    DataLinearGraph(
                      title: 'Over Head',
                      percentage:
                          "${(under15.overHeadAttacking * 100).toInt()}",
                      value: under15.overHeadAttacking,
                    ),
                    DataLinearGraph(
                      title: 'Javel',
                      percentage: "${(under15.javelAttacking * 100).toInt()}",
                      value: under15.javelAttacking,
                    ),
                    DataLinearGraph(
                      title: 'Pass',
                      percentage: "${(under15.passAttacking * 100).toInt()}",
                      value: under15.passAttacking,
                    ),
                    DataLinearGraph(
                      title: 'Kick',
                      percentage: " ${(under15.kickAttacking * 100).toInt()}",
                      value: under15.kickAttacking,
                    ),
                    DataLinearGraph(
                      title: 'Communication',
                      percentage:
                          " ${(under15.communicateAttacking * 100).toInt()}",
                      value: under15.communicateAttacking,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Divider(),
                    const CampMatchSecondTitle(title: "Attacking W/O Ball"),
                    DataLinearGraph(
                      title: 'Position',
                      percentage:
                          '${(under15.positionAttacking * 100).toInt()}',
                      value: under15.positionAttacking,
                    ),
                    DataLinearGraph(
                      title: 'Communication',
                      percentage:
                          '${(under15.communicationAttacking * 100).toInt()}',
                      value: under15.communicationAttacking,
                    ),
                    DataLinearGraph(
                      title: 'Leading & Supporting',
                      percentage:
                          '${(under15.leadingSupportAttacking * 100).toInt()}',
                      value: under15.leadingSupportAttacking,
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    const CampMatchSecondTitle(title: "Defending W/Ball"),
                    DataLinearGraph(
                      title: 'One vs One',
                      percentage:
                          '${(under15.oneVSoneDefending * 100).toInt()}',
                      value: under15.oneVSoneDefending,
                    ),
                    DataLinearGraph(
                      title: 'High Dive',
                      percentage:
                          '${(under15.highDiveDefending * 100).toInt()}',
                      value: under15.highDiveDefending,
                    ),
                    DataLinearGraph(
                      title: 'Low Dive',
                      percentage: '${(under15.lowDiveDefending * 100).toInt()}',
                      value: under15.lowDiveDefending,
                    ),
                    DataLinearGraph(
                      title: 'Cuping',
                      percentage: '${(under15.cupingDefending * 100).toInt()}',
                      value: under15.cupingDefending,
                    ),
                    DataLinearGraph(
                      title: 'W Shape',
                      percentage: '${(under15.wShapeDefending * 100).toInt()}',
                      value: under15.wShapeDefending,
                    ),
                    DataLinearGraph(
                      title: 'Scooping',
                      percentage:
                          '${(under15.scoopingDefending * 100).toInt()}',
                      value: under15.scoopingDefending,
                    ),
                    DataLinearGraph(
                      title: 'Short Stoping',
                      percentage:
                          '${(under15.shortstepingDefending * 100).toInt()}',
                      value: under15.shortstepingDefending,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CampMatchSecondTitle(title: "Defending W/O Ball"),
                    DataLinearGraph(
                      title: 'Set Position',
                      percentage:
                          '${(under15.setPositionDefending * 100).toInt()}',
                      value: under15.setPositionDefending,
                    ),
                    DataLinearGraph(
                      title: 'Start Position',
                      percentage:
                          '${(under15.startPositionDefending * 100).toInt()}',
                      value: under15.startPositionDefending,
                    ),
                    DataLinearGraph(
                      title: 'Movments',
                      percentage:
                          '${(under15.movmentsDefending * 100).toInt()}',
                      value: under15.movmentsDefending,
                    ),
                    DataLinearGraph(
                      title: 'Defence Oganising',
                      percentage:
                          '${(under15.defenceOrgnizationDefending * 100).toInt()}',
                      value: under15.defenceOrgnizationDefending,
                    ),
                    DataLinearGraph(
                      title: 'Communication',
                      percentage:
                          '${(under15.communicationDefending * 100).toInt()}',
                      value: under15.communicationDefending,
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    const CampMatchSecondTitle(title: "Transotion W/Ball"),
                    const SizedBox(
                      height: 20,
                    ),
                    DataLinearGraph(
                      title: 'Pass',
                      percentage: '${(under15.passTransition * 100).toInt()}',
                      value: under15.passTransition,
                    ),
                    DataLinearGraph(
                      title: 'Recive',
                      percentage: '${(under15.reciveTransition * 100).toInt()}',
                      value: under15.reciveTransition,
                    ),
                    DataLinearGraph(
                      title: 'Movments',
                      percentage:
                          '${(under15.movmentsDefending * 100).toInt()}',
                      value: under15.movmentsDefending,
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    const CampMatchSecondTitle(title: "Transition W/O Ball"),
                    const SizedBox(
                      height: 20,
                    ),
                    DataLinearGraph(
                      title: 'Position',
                      percentage:
                          '${(under15.positionTransition * 100).toInt()}',
                      value: under15.positionTransition,
                    ),
                    DataLinearGraph(
                      title: 'Communication',
                      percentage:
                          '${(under15.communicationTransition * 100).toInt()}',
                      value: under15.communicationTransition,
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
