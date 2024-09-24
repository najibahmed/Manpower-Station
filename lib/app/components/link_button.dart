import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/theme/light_theme_colors.dart';
import '../../config/theme/my_fonts.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({super.key, required this.urlLabel, required this.url});

  final String urlLabel;
  final String url;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        minimumSize: const Size(0, 0),
        textStyle: TextStyle(
          color: LightThemeColors.primaryColor,
          fontSize: MyFonts.bodySmallTextSize
        ),
      ),
      onPressed: () {
        _launchUrl(url);
      },
      child: Text(urlLabel),
    );
  }
}