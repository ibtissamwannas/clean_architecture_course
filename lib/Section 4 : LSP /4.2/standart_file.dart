import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.2/file_reader.dart';

class StandartFile implements FileReader {
  @override
  String readFile(String? path) {
    return 'File content from $path';
  }

  @override
  bool canRead(String? path) {
    return true;
  }
}
