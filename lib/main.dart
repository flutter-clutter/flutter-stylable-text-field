import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stylable_text_field_parts/models/text_part_style_definition.dart';
import 'package:stylable_text_field_parts/models/text_part_style_definitions.dart';
import 'package:stylable_text_field_parts/stylable_text_field_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        StyleableTextFieldController(
      styles: TextPartStyleDefinitions(
        definitionList: <TextPartStyleDefinition>[
          TextPartStyleDefinition(
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            pattern: '[\.,\?\!]',
          ),
          TextPartStyleDefinition(
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            pattern: '(?:(the|a|an) +)',
          ),
        ],
      ),
    );

    return Scaffold(
      body: Center(
        child: TextField(
          controller: textEditingController,
          autocorrect: false,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.none,
        ),
      ),
    );
  }
}
