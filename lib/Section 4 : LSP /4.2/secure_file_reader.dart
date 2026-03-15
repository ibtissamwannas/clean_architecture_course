import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.2/file_reader.dart';

class SecureFileReader implements FileReader {
  final List<String> allowedPaths = ['/public', '/shared'];

  @override
  bool canRead(String? path) {
    if (!allowedPaths.any((allowed) => path!.startsWith(allowed))) {
      return false;
    }
    return true;
  }

  @override
  String? readFile(String? path) {
    if (canRead(path)) null;
    return 'File content from $path';
  }
}
