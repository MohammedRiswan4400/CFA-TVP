import 'package:flutter/material.dart';
import 'package:trappra_chat/model/colors/colors.dart';

import '../../../model/const/const.dart';
import '../../../model/user/rules/rules_widget.dart';

class ScreenRules extends StatelessWidget {
  const ScreenRules({super.key});

  @override
  Widget build(BuildContext context) {
    var divider = const Divider(
      thickness: 2,
    );
    var icon = const Icon(
      Icons.sports_soccer_sharp,
    );
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: kField2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              const RulesRow(
                                text:
                                    "Children in our camp should not play anywhere without  permission from the coach",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "Do not cut your classes (School/Madrasa) to attend the camp",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "Parents should not give unnecessary money to their children while coming to the camp",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "Please ensure that parents try to provide them with home-cooked food while sending them to matches",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "If anyone have any problem with participating in the match, they should contact coach or message our camp group before that particular match time",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "Please make sure to pay the camp fee on time",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "Violation of any of the above provisions shall be a punishable offence",
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icon,
                          icon,
                          icon,
                          icon,
                          icon,
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: kField2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            12.0,
                          ),
                          child: Column(
                            children: [
                              const RulesRow(
                                text:
                                    "ക്യാമ്പിൽ ഉള്ള കുട്ടികൾ കോച്ച് ന്റെ അനുവാദം ഇല്ലാതെ മറ്റെവിടെയും കളിക്കാൻ പാടില്ല",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "സ്കൂൾ/മദ്രസ മുടക്കി ക്യാമ്പ് ന് വരാൻ പാടില്ല",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "അനാവശ്യമായി കുട്ടികളുടെ കയ്യിൽ രക്ഷിതാക്കൾ പൈസ കൊടുത്തയക്കരുത്",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "കളികൾക്ക് പോവുമ്പോൾ പരമാവതി വീട്ടിൽ ഉണ്ടാക്കുന്ന ഭക്ഷണം കൊടുത്തയക്കുക",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "ക്യാമ്പ് /കളിക്ക് വരാൻ കഴിയില്ലെങ്കിൽ നിർബന്ധമായും ക്യാമ്പിന്റെ സമയത്തിന് മുൻപ് ഗ്രൂപ്പിലോ കോച്ച് ന് നേരിട്ടോ സന്ദേശം അയക്കേണ്ടതാണ്",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "ക്യാമ്പ് ഫീസ് കൃത്യസമയത്ത് തന്നെ അടക്കുക",
                              ),
                              divider,
                              const RulesRow(
                                text:
                                    "മുകളിൽ പറഞ്ഞ കാര്യങ്ങൾ തെറ്റിച്ചാൽ കൃത്യമായ നടപടികൾ എടുക്കുന്നതാണ്",
                              ),
                            ],
                          ),
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
            Container(
              color: kBackground,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () => popNow(context),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Rules & Regulations",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
