import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_model.dart';
import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/report_service.dart';
import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/types/generate_html.dart';
import 'package:clean_architecture_course/Section%203%20:%20OCP/3.1/types/generate_pdf.dart';

void main() {
  // ReportGenerator reportGenerator = GeneratePDF();
  final data = ReportData(
    title: 'Sales Report',
    items: ['Product A: \$100', 'Product B: \$200', 'Product C: \$150'],
    generatedAt: DateTime.now(),
  );
  // final result = reportGenerator.generate(data);
  // print(result);

  final reportService = ReportService([GeneratePDF(), GenerateHTML()]);

  final result = reportService.generateReport(data, 'PDF');
}
