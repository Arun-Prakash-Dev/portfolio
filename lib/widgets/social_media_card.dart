// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaCard extends StatefulWidget {
  const SocialMediaCard({
    Key? key,
  }) : super(key: key);

  @override
  State<SocialMediaCard> createState() => _SocialMediaCardState();
}

class _SocialMediaCardState extends State<SocialMediaCard> {
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
              InkWell(
                //widget.onLinkHovered,
                child: IconButton(
                  mouseCursor: SystemMouseCursors.none,
                  icon: const Icon(
                    FontAwesomeIcons.github,
                  ),
                  onPressed: () =>
                      _launchUrl('https://github.com/Arun-Prakash-Dev'),
                ),
              ),
              IconButton(
                mouseCursor: SystemMouseCursors.none,
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                ),
                onPressed: () =>
                    _launchUrl('https://www.instagram.com/_.arun._.prakash._/'),
              ),
              IconButton(
                mouseCursor: SystemMouseCursors.none,
                icon: const Icon(
                  FontAwesomeIcons.facebook,
                ),
                onPressed: () =>
                    _launchUrl('https://www.facebook.com/arun.edappal.35/'),
              ),
              IconButton(
                mouseCursor: SystemMouseCursors.none,
                icon: const Icon(
                  FontAwesomeIcons.twitter,
                ),
                onPressed: () =>
                    _launchUrl('https://twitter.com/ARUNPRA52454514'),
              ),
              IconButton(
                  mouseCursor: SystemMouseCursors.none,
                  icon: const Icon(
                    FontAwesomeIcons.youtube,
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
