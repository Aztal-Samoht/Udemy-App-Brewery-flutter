import 'package:flutter/material.dart';
import 'package:project_j_todo/provider_example/providers/updating_text_provider.dart';
import 'package:provider/provider.dart';

class TextDisplayer extends StatelessWidget {
  const TextDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.watch<UpdatingTextProvider>().text),
    );
  }
}
