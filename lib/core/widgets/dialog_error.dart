import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';

class DialogError extends StatelessWidget {
  const DialogError({super.key, required this.errorLabel});

  final String errorLabel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Dialog(
        backgroundColor: theme.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ошибка!',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: "Soyuz",
                    fontSize: 34,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                errorLabel,
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontFamily: "Soyuz",
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 10),
              CommonButton(
                onPressed: () {
                  context.router.maybePop();
                },
                height: 50,
                label: 'понятно',
                foregroundColor: Colors.white,
                backgroundColor: theme.colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
