import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_generator.dart';
import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_model.dart';

class ReportService {
  final List<ReportGenerator> _reportGenerators;

  ReportService(this._reportGenerators);

  String generateReport(ReportData data, String format) {
    final generator = _reportGenerators.firstWhere(
      (e) => e.formatName == format,
    );

    return generator.generate(data);
  }
}
