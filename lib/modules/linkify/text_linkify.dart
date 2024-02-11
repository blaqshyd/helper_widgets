import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkifyExample extends StatelessWidget {
  const LinkifyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_linkify example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Linkify(
                  onOpen: _onOpen,
                  text: "Made by https://cretezy.com",
                ),
                const SizedBox(height: 64),
                SelectableLinkify(
                  onOpen: _onOpen,
                  text: "Mail: example@gmail.com",
                ),
                const SizedBox(height: 64),
                const Linkify(
                  onOpen: print,
                  text: "@Cretezy +123456789",
                  linkifiers: [
                    UserTagLinkifier(),
                    PhoneNumberLinkifier(),
                    EmailLinkifier(),
                    UrlLinkifier()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }
}
