import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_generator.dart';
import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_model.dart';

class GeneratePDF implements ReportGenerator {
  @override
  String generate(ReportData data) {
    return 'PDF Report: ${data.title}\n${data.items.join('\n')}';
  }

  @override
  String get formatName => "PDF";
}
