import 'dart:io';
import 'package:cleanapp/common/sort.dart';
import 'package:cleanapp/utils/file_utils.dart';
import 'package:cleanapp/utils/logger.dart';
import 'package:path/path.dart';
import 'package:cleanapp/common/template/template.dart';

// File handleFileCreate(String name, String command, String on, bool extraFolder,
//     Template sample, String folderName,
//     [String sep = '_']) {
//   folderName = folderName;
//   /* if (folderName.isNotEmpty) {
//     extraFolder = PubspecUtils.extraFolder ?? extraFolder;
//   } */
//   final fileModel = Structure.model(name, command, extraFolder,
//       on: on, folderName: folderName);
//   var path = '${fileModel.path}$sep${fileModel.commandName}.dart';
//   sample.path = path;
//   return sample.create();
// }

/// Create or edit the contents of a file
File writeFile(String path, String content,
    {bool overwrite = false,
    bool skipFormatter = false,
    bool logger = true,
    bool skipRename = false,
    bool useRelativeImport = false}) {
  var newFile = File(FileUtils.replaceAsExpected(path: path));

  if (!newFile.existsSync() || overwrite) {
    if (!skipFormatter) {
      if (path.endsWith('.dart')) {
        try {
          // content = sortImports(
          //   content,
          //   renameImport: !skipRename,
          //   filePath: path,
          //   useRelative: useRelativeImport,
          // );
        } on Exception catch (_) {
          if (newFile.existsSync()) {
            // LogService.info(
            //     LocaleKeys.error_invalid_dart.trArgs([newFile.path]));
            Logger.error("Invalid dart file: ${newFile.path}");
          }
          rethrow;
        }
      }
    }
    // if (!skipRename && newFile.path != 'pubspec.yaml') {
    //   var separatorFileType = PubspecUtils.separatorFileType!;
    //   if (separatorFileType.isNotEmpty) {
    //     newFile = newFile.existsSync()
    //         ? newFile = newFile
    //             .renameSync(replacePathTypeSeparator(path, separatorFileType))
    //         : File(replacePathTypeSeparator(path, separatorFileType));
    //   }
    // }

    newFile.createSync(recursive: true);
    newFile.writeAsStringSync(content);
    if (logger) {
      Logger.success(
          "File created: ${basename(newFile.path)} in ${newFile.path}");
    }
  }
  return newFile;
}

/// Replace the file name separator
String replacePathTypeSeparator(String path, String separator) {
  if (separator.isNotEmpty) {
    var index = path.indexOf(RegExp(r'controller.dart|model.dart|provider.dart|'
        'binding.dart|view.dart|screen.dart|widget.dart|repository.dart'));
    if (index != -1) {
      var chars = path.split('');
      index--;
      chars.removeAt(index);
      if (separator.length > 1) {
        chars.insert(index, separator[0]);
      } else {
        chars.insert(index, separator);
      }
      return chars.join();
    }
  }

  return path;
}
