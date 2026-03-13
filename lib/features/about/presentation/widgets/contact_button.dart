import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucky_wheel_clean_architecture/core/services/url_launcher_service.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    required this.label,
    required this.foregroundColor,
    required this.backgroundColor,
    this.height,
    this.icon,
    this.svgPictureName,
    this.url,
    this.email,
  });

  final String label;
  final String? url;
  final String? email;
  final IconData? icon;
  final String? svgPictureName;
  final Color foregroundColor;
  final Color backgroundColor;
  final double? height;

  Future<void> _handlePress() async {
    if (url != null) {
      await UrlLauncherService.openUrl(url!);
    } else if (email != null) {
      await UrlLauncherService.openEmail(email!);
    } else {
      () {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      onPressed: () async {
        try {
          await _handlePress();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              backgroundColor: theme.colorScheme.secondary,
              content: Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  e
                      .toString()
                      .replaceAll('Exception: ', '')
                      .replaceAll('"', ''),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "mont",
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: email!)).then((_) {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              backgroundColor: theme.colorScheme.secondary,
              content: Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  "почта скопирована",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "mont",
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        minimumSize: Size.fromHeight(height ?? 65),
      ),
      icon: icon != null
          ? Icon(icon, size: 45, color: foregroundColor)
          : SvgPicture.asset('assets/icons/$svgPictureName.svg', width: 45),
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          fontFamily: "mont",
          color: foregroundColor,
        ),
      ),
    );
  }
}
