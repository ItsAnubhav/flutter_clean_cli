import 'dart:io';

import 'package:cleanapp/functions/create/create_single_file.dart';
import 'package:recase/recase.dart';

/// [Template] is the Base class in which the files for each command
/// will be built.
abstract class Template {
  String customContent = '';

  /// The path where the sample file will be added
  String path;

  Map<String, String> vars = {};

  /// If the file is found in the path, it can be ignored or
  /// overwritten. If overrite = false, the source file will not be changed.
  /// The default is [false].
  bool overwrite;

  /// Store the content that will be written to the file in a String or
  /// Future <String> in that variable. It is used to fill the file created
  /// by path.
  String get content;

  Template(this.path, {this.overwrite = false});

  /// This function will create the file in [path] with the
  /// content of [content].
  File create({bool skipFormatter = false}) {
    return writeFile(
      path,
      customContent.isNotEmpty ? customContent : content,
      overwrite: overwrite,
      skipFormatter: skipFormatter,
      useRelativeImport: true,
    );
  }

  File createDynamic({Map<String, String>? vars, bool skipFormatter = false}) {
    String filecontents = customContent.isNotEmpty ? customContent : content;
    if (vars != null) {
      final fileVars = getVars(vars);
      fileVars.forEach((key, value) {
        filecontents = filecontents.replaceAll('{{$key}}', value);
      });
    }
    return writeFile(
      path,
      filecontents,
      overwrite: overwrite,
      skipFormatter: skipFormatter,
      useRelativeImport: true,
    );
  }

  Map<String, String> getVars(Map<String, String> vars) {
    Map<String, String> newVars = {};
    vars.forEach((key, value) {
      newVars[key] = value;
      newVars['${key}_snake'] = ReCase(value).snakeCase;
      newVars['${key}_pascal'] = ReCase(value).pascalCase;
    });
    return newVars;
  }
}
