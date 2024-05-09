import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:helper/services/remote/url_launch_service.dart';

class AnylinkPrew extends StatefulWidget {
  const AnylinkPrew({super.key});

  @override
  AnylinkPrewState createState() => AnylinkPrewState();
}

class AnylinkPrewState extends State<AnylinkPrew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnyLinkPreview(
          link: "https://www.youtube.com/watch?v=9l-YlR1GMiI",
          displayDirection: UIDirection.uiDirectionHorizontal,
          showMultimedia: true,
          bodyMaxLines: 5,
          bodyTextOverflow: TextOverflow.ellipsis,
          titleStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          bodyStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          errorBody: 'Show my custom error body',
          errorTitle: 'Show my custom error title',
          errorWidget: Container(
            color: Colors.grey[300],
            child: const Text('Oops!'),
          ),
          errorImage: "https://google.com/",
          cache: const Duration(days: 7),
          // backgroundColor: Colors.grey[300],
          borderRadius: 12,
          removeElevation: true,
          boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
          onTap: () => UrlLauncher.openUrl(
            url: "youtube.com/watch?v=9l-YlR1GMiI",
          ), // This disables tap event
        ),
      ),
    );
  }
}
