import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileExtensionFormatter extends TextInputFormatter {
  FileExtensionFormatter({
    required this.fileExtension,
  });

  final String fileExtension;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '.$fileExtension');
    }

    if (newValue.text.compareTo(oldValue.text) != 0) {
      List<String> split = newValue.text.split('.$fileExtension');

      if (split.isEmpty) {
        return newValue;
      }

      if (split.last == '') {
        return newValue;
      }

      int selectionIndexFromTheRight = newValue.text.length -
          newValue.selection.end -
          '.$fileExtension'.length;

      final newString = newValue.text + '.$fileExtension';

      return newValue.copyWith(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    }

    return newValue;
  }
}
