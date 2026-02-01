import 'dart:io';

import 'package:clean_architecture_course/Section%203%20:%20OCP/3.2/logger.dart';

class FileLogger implements Logger {
  final String filePath;
  FileLogger(this.filePath);
  @override
  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = '[$timestamp] $message\n';

    File(filePath).writeAsStringSync(logEntry, mode: FileMode.append);
    print('Logged to file: $logEntry');
  }
}
