import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:nimbus/values/values.dart';

class PortfolioPdfGenerator {
  static Future<void> generateAndShare() async {
    final pdf = pw.Document();

    // Add all projects
    for (var entry in Data.projectDetails.entries) {
      final details = entry.value;

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  details.title,
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  details.company,
                  style: pw.TextStyle(
                    fontSize: 12,
                    color: PdfColors.grey700,
                  ),
                ),
                pw.SizedBox(height: 16),
                pw.Text(
                  details.shortDescription,
                  style: pw.TextStyle(fontSize: 14),
                ),
                pw.SizedBox(height: 12),
                pw.Text(
                  details.detailedDescription,
                  style: pw.TextStyle(fontSize: 11),
                ),
                pw.SizedBox(height: 16),
                pw.Text(
                  'Key Features:',
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                ...details.keyFeatures.map((f) {
                  return pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12, top: 4),
                    child: pw.Text('• $f', style: pw.TextStyle(fontSize: 10)),
                  );
                }),
                pw.SizedBox(height: 12),
                pw.Text(
                  'Impact:',
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                ...details.impact.map((i) {
                  return pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12, top: 4),
                    child: pw.Text('✓ $i', style: pw.TextStyle(fontSize: 10)),
                  );
                }),
                pw.SizedBox(height: 12),
                pw.Text(
                  'Technologies: ${details.technologies.join(", ")}',
                  style: pw.TextStyle(fontSize: 10),
                ),
                pw.SizedBox(height: 30),
              ],
            );
          },
        ),
      );
    }

    // Share PDF
    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'Rohitashwa_Portfolio.pdf',
    );
  }
}
