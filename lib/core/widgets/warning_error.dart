import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';

class WarningError extends StatelessWidget {
  const WarningError({
    super.key,
    required this.warningLabel,
    this.onTapOk,
    this.onTapCancel,
  });

  final String warningLabel;
  final VoidCallback? onTapOk;
  final VoidCallback? onTapCancel;

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
                  'предупреждение!',
                  style: TextStyle(
                    color: Colors.amber,
                    fontFamily: "Soyuz",
                    fontSize: 34,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                warningLabel,
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontFamily: "Soyuz",
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      onPressed: () => context.router.maybePop(false),
                      height: 50,
                      label: 'отмена',
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CommonButton(
                      onPressed: () => context.router.maybePop(true),
                      height: 50,
                      label: 'да',
                      foregroundColor: Colors.white,
                      backgroundColor: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
