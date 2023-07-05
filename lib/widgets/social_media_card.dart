import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.github,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    _launchUrl('https://github.com/Arun-Prakash-Dev'),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    _launchUrl('https://www.instagram.com/_.arun._.prakash._/'),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    _launchUrl('https://www.facebook.com/arun.edappal.35/'),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    _launchUrl('https://twitter.com/ARUNPRA52454514'),
              ),
              IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.youtube,
                    color: Colors.grey,
                  ),
                  onPressed: () =>
                      _launchUrl('https://www.youtube.com/@theartist317')),
            ],
          ),
        ),
      ),
    );
  }
}
