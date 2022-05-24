import 'package:flutter/material.dart';
import 'package:project_j_todo/provider_example/providers/updating_text_provider.dart';
import 'package:provider/provider.dart';

class TextUpdater extends StatelessWidget {
  const TextUpdater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        onChanged: (value) {
          print(value);
          context.read<UpdatingTextProvider>().update(value);
        },
      ),
    );
  }
}
