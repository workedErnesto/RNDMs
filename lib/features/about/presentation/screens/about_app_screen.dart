import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/core/widgets/widgets.dart';
import 'package:lucky_wheel_clean_architecture/features/about/presentation/widgets/widgets.dart';

@RoutePage()
class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(label: 'о приложении', actionLeading: BackButton()),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(children: [AboutUsBlock(), MyContactsBlock(), PSBlock()]),
      ),
    );
  }
}
