import 'package:clean_architecture_course/Section%203%20:%20OCP/3.3/document_processor.dart';

// ignore: camel_case_types
mixin compress on DocumentProcessor {
  bool isCompressed = false;

  void enableCompression() {
    isCompressed = true;
    print('Compression enabled.');
  }

  void disableCompression() {
    isCompressed = false;
    print('Compression disabled.');
  }

  @override
  bool convertContent(String filePath, String content) {
    if (isCompressed) {
      print('Compressing content...');
      content = 'COMPRESSED: $content';
    }

    print('Converting to PDF format: $content');
    print('Saving to: $filePath');
    return true;
  }
}
