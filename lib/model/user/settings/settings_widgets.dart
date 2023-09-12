import 'package:flutter/material.dart';
import 'package:trappra_chat/model/colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectUsRow extends StatelessWidget {
  const ConnectUsRow({
    super.key,
  });

  Future<void> _launchUrl({required Uri url}) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            final Uri url = Uri.parse(
                "https://www.facebook.com/search/top?q=challengersfootballacademythiruvegappura");
            await _launchUrl(url: url);
          },
          child: CircleAvatar(
            child: Image.asset("assets/facebook.jpg"),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () async {
            final Uri url =
                Uri.parse("https://www.instagram.com/cfc_fa_thiruvegappura/");
            await _launchUrl(url: url);
          },
          child: CircleAvatar(
            backgroundColor: kBackground,
            child: Image.asset(
              "assets/Instagram-logo.jpg",
              // scale: 25,
            ),
          ),
        ),
      ],
    );
  }
}
