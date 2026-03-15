import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.2/file_reader.dart';
import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.2/secure_file_reader.dart';
import 'package:clean_architecture_course/Section%204%20:%20LSP%20/4.2/standart_file.dart';

void main() {
  final FileReader normalReader = StandartFile();
  final FileReader secureReader = SecureFileReader();

  final paths = ['/public/data.txt', '/private/secret.txt'];

  print('Using normal reader:');
  processFile(normalReader, paths);

  print('\nUsing secure reader:');
  processFile(secureReader, paths);
}

void processFile(FileReader reader, List<String> paths) {
  for (var path in paths) {
    if (reader.canRead(path)) {
      final content = reader.readFile(path);
      print('Processing: $content');
    } else {
      print('🚫 Access denied: $path is not in allowed paths');
    }
  }
}
