import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_model.dart';

abstract class ReportGenerator {
  String get formatName;

  String generate(ReportData data);
}
