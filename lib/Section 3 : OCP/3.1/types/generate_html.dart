import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_generator.dart';
import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_model.dart';

class GenerateHTML implements ReportGenerator {
  @override
  String generate(ReportData data) {
    return '<html><h1>${data.title}</h1><ul>${data.items.map((item) => '<li>$item</li>').join()}</ul></html>';
  }

  @override
  String get formatName => 'HTML';
}
