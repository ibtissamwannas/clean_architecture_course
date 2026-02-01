abstract class DocumentProcessor {
  bool processDocument(String filePath, String content) {
    if (!validateInput(filePath, content)) {
      return false;
    }
    print('Processing PDF document...');

    bool result = convertContent(filePath, content);

    print('Saving to: $filePath');
    return true;
  }

  bool validateInput(String filePath, String content) {
    if (filePath.isEmpty) {
      print('Error: File path is empty');
      return false;
    }

    if (content.isEmpty) {
      print('Error: Content is empty');
      return false;
    }
    return true;
  }

  convertContent(String filePath, String content);
}
