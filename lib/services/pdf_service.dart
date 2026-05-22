import 'package:nimbus/values/values.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFService {
  static Future<void> generateAndDownloadCV() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(0),
        build: (context) => [
          _buildColoredHeader(),
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildSummary(),
                pw.SizedBox(height: 25),
                _buildExperience(),
                pw.SizedBox(height: 25),
                _buildProjects(),
                pw.SizedBox(height: 25),
                _buildSkills(),
                pw.SizedBox(height: 25),
                _buildMetrics(),
                pw.SizedBox(height: 25),
                _buildEducation(),
              ],
            ),
          ),
        ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Rohitashwa_Singh_CV.pdf',
    );
  }

  static pw.Widget _buildColoredHeader() {
    return pw.Container(
      color: const PdfColor(0.1, 0.3, 0.7),
      padding: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 35),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            StringConst.FIRST_NAME + ' ' + StringConst.LAST_NAME,
            style: pw.TextStyle(
              fontSize: 36,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            'Mobile Engineering Lead | Flutter Specialist | 6+ Years Experience',
            style: const pw.TextStyle(fontSize: 14, color: PdfColor(0.95, 0.95, 0.95)),
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(StringConst.DEV_EMAIL_2,
                style: const pw.TextStyle(fontSize: 11, color: PdfColors.white)),
              pw.Text(StringConst.PHONE_NUMBER,
                style: const pw.TextStyle(fontSize: 11, color: PdfColors.white)),
              pw.Text('github.com/Jokerohit4',
                style: const pw.TextStyle(fontSize: 11, color: PdfColors.white)),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildSummary() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('PROFESSIONAL SUMMARY'),
        pw.SizedBox(height: 10),
        pw.Container(
          padding: const pw.EdgeInsets.all(15),
          decoration: pw.BoxDecoration(
            color: const PdfColor(0.95, 0.97, 1.0),
            border: pw.Border(
              left: pw.BorderSide(
                color: const PdfColor(0.1, 0.3, 0.7),
                width: 4,
              ),
            ),
          ),
          child: pw.Text(
            'Mobile Engineering Leader with 6+ years of experience building high-performance Flutter applications at scale. Expertise in architecting clean, scalable systems using BLoC pattern, optimizing app performance (99.8% crash-free rate, 4.8★ rating), and leading cross-functional teams. Track record of delivering products serving 173K+ active users with 52% startup performance improvement.',
            style: const pw.TextStyle(fontSize: 10, height: 1.6, color: PdfColors.grey800),
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildExperience() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('PROFESSIONAL EXPERIENCE'),
        pw.SizedBox(height: 12),
        _buildExperienceItem(
          'Mobile Engineering Lead',
          'OZi Platform (Quick-Commerce) | Jan 2023 - Present',
          [
            'Lead team of 5 mobile engineers delivering core consumer-facing features for quick-commerce platform serving 173K+ monthly active users',
            'Architected clean BLoC-based state management reducing memory leaks by 40% and improving app stability to 99.8% crash-free rate',
            'Optimized cold startup from 20-25s to 1.5s (94% improvement) through code splitting, lazy loading, and precise rebuilds',
            'Increased app rating from 4.2★ to 4.8★ (14% improvement) through performance optimization and user experience enhancements',
            'Executed 1,237+ commits in 4 months, driving major architectural refactors and establishing stability frameworks',
            'Implemented comprehensive error tracking via Firebase Crashlytics for real-time crash monitoring across 173K+ users',
          ],
        ),
        pw.SizedBox(height: 15),
        _buildExperienceItem(
          'Senior Flutter Developer',
          'Phool Gobhi (Short-Form Video Platform) | 2022 - 2023',
          [
            'Architected and shipped short-form video platform with custom high-performance media player using LRU caching',
            'Optimized real-time streaming to support smooth 60fps playback with custom media buffer management',
            'Engineered platform-specific UI implementations for iOS and Android with native code integration',
            'Built from MVP to production-ready app focusing on video playback performance and memory efficiency',
          ],
        ),
        pw.SizedBox(height: 15),
        _buildExperienceItem(
          'Flutter Developer',
          'Multiple Startups & Ventures | 2019 - 2022',
          [
            'WIOM: Built fintech application with real-time payment processing and secure transaction handling. Handled platform-specific banking integrations',
            'Real Solutions: Developed ed-tech learning platform with offline-first architecture supporting 10K+ concurrent users',
            'Neodocs: Engineered pregnancy detection app serving 500K+ downloads with AI integration and comprehensive counseling features',
            'Gmagica: Implemented custom UI components and animation systems for enhanced user engagement',
            'Shipped 5+ production apps across iOS, Android, Web, and macOS platforms with focus on performance and scalability',
          ],
        ),
      ],
    );
  }

  static pw.Widget _buildExperienceItem(
    String title,
    String subtitle,
    List<String> points,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(14),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: const PdfColor(0.85, 0.85, 0.85), width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
              color: const PdfColor(0.1, 0.3, 0.7),
            ),
          ),
          pw.Text(
            subtitle,
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
          ),
          pw.SizedBox(height: 8),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: points
                .map((point) => pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 5, left: 12),
                      child: pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('▸ ', style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
                          pw.Expanded(
                            child: pw.Text(
                              point,
                              style: const pw.TextStyle(fontSize: 9, height: 1.5, color: PdfColors.grey800),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildProjects() {
    final projects = [
      _ProjectInfo(
        'OZi Consumer App',
        'Flutter | BLoC | REST API | Firebase',
        'Architected and maintained core food delivery consumer application. Implemented multi-cubit state management with event-driven architecture (no cross-cubit state reads). Achieved 99.8% crash-free rate and 4.8★ rating.',
      ),
      _ProjectInfo(
        'Cart & Checkout System',
        'Flutter | BLoC | Repository Pattern | Firebase',
        'Refactored legacy cart module using clean architecture principles. Each layer has single responsibility: UI observes CartBloc, CartBloc receives events, Repository handles business logic, API layer manages HTTP.',
      ),
      _ProjectInfo(
        'Performance Optimization Initiative',
        'Flutter | Code Splitting | Lazy Loading | Profiling',
        'Reduced cold startup from 20-25s to 1.5s (94% faster) through: code splitting, lazy loading of features, precise rebuilds with RepaintBoundary. Improved user retention by 18%.',
      ),
    ];

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('KEY PROJECTS & ACHIEVEMENTS'),
        pw.SizedBox(height: 12),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: projects.asMap().entries.map((entry) {
            final index = entry.key;
            final project = entry.value;
            return pw.Padding(
              padding: pw.EdgeInsets.only(bottom: index < projects.length - 1 ? 12 : 0),
              child: pw.Container(
                padding: const pw.EdgeInsets.all(12),
                decoration: pw.BoxDecoration(
                  color: const PdfColor(0.98, 0.98, 0.99),
                  border: pw.Border.all(color: const PdfColor(0.9, 0.9, 0.95), width: 1),
                  borderRadius: const pw.BorderRadius.all(pw.Radius.circular(5)),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      project.title,
                      style: pw.TextStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor(0.1, 0.3, 0.7),
                      ),
                    ),
                    pw.Text(
                      project.technologies,
                      style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
                    ),
                    pw.SizedBox(height: 6),
                    pw.Text(
                      project.description,
                      style: const pw.TextStyle(fontSize: 9, height: 1.5, color: PdfColors.grey800),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  static pw.Widget _buildSkills() {
    final skillCategories = {
      'Languages': 'Dart, Java, Kotlin, C++, Python',
      'Frameworks & Libraries': 'Flutter, BLoC, GetX, Riverpod, Firebase, REST API',
      'Architecture': 'Clean Architecture, BLoC Pattern, Repository Pattern, MVVM',
      'Performance': 'Code Splitting, Lazy Loading, Memory Profiling, Startup Optimization',
      'Tools & Platforms': 'Android Studio, Xcode, Firebase, Crashlytics, Git, GitHub',
    };

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('TECHNICAL SKILLS'),
        pw.SizedBox(height: 12),
        pw.Container(
          padding: const pw.EdgeInsets.all(14),
          decoration: pw.BoxDecoration(
            color: const PdfColor(0.97, 0.98, 0.99),
            border: pw.Border.all(color: const PdfColor(0.85, 0.85, 0.85), width: 1),
            borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: skillCategories.entries
                .toList()
                .asMap()
                .entries
                .map((entry) {
                  final isLast = entry.key == skillCategories.length - 1;
                  return pw.Padding(
                    padding: pw.EdgeInsets.only(bottom: isLast ? 0 : 10),
                    child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(
                          width: 115,
                          child: pw.Text(
                            entry.value.key + ':',
                            style: pw.TextStyle(
                              fontSize: 9,
                              fontWeight: pw.FontWeight.bold,
                              color: const PdfColor(0.1, 0.3, 0.7),
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Text(
                            entry.value.value,
                            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey800),
                          ),
                        ),
                      ],
                    ),
                  );
                })
                .toList(),
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildMetrics() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('KEY METRICS & IMPACT'),
        pw.SizedBox(height: 12),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
          children: [
            _buildMetricCard('99.8%', 'Crash-Free Rate'),
            _buildMetricCard('4.8/5', 'App Rating'),
            _buildMetricCard('94%', 'Startup Improvement'),
            _buildMetricCard('173K+', 'Active Users'),
          ],
        ),
      ],
    );
  }

  static pw.Widget _buildMetricCard(String value, String label) {
    return pw.Container(
      width: 90,
      padding: const pw.EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: pw.BoxDecoration(
        color: const PdfColor(0.1, 0.3, 0.7),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
            textAlign: pw.TextAlign.center,
          ),
          pw.SizedBox(height: 6),
          pw.Text(
            label,
            style: const pw.TextStyle(fontSize: 8, color: PdfColor(0.95, 0.95, 0.95)),
            textAlign: pw.TextAlign.center,
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildEducation() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('EDUCATION & CERTIFICATIONS'),
        pw.SizedBox(height: 12),
        pw.Container(
          padding: const pw.EdgeInsets.all(12),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: const PdfColor(0.85, 0.85, 0.85), width: 1),
            borderRadius: const pw.BorderRadius.all(pw.Radius.circular(5)),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'B.Tech in Computer Science / IT',
                style: pw.TextStyle(
                  fontSize: 11,
                  fontWeight: pw.FontWeight.bold,
                  color: const PdfColor(0.1, 0.3, 0.7),
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                'Mobile Development Specialization | Flutter & Cross-Platform Architecture',
                style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildSectionTitle(String title) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        border: const pw.Border(
          bottom: pw.BorderSide(
            color: PdfColor(0.1, 0.3, 0.7),
            width: 2.5,
          ),
        ),
      ),
      padding: const pw.EdgeInsets.only(bottom: 8),
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: 13,
          fontWeight: pw.FontWeight.bold,
          color: const PdfColor(0.1, 0.3, 0.7),
        ),
      ),
    );
  }
}

class _ProjectInfo {
  final String title;
  final String technologies;
  final String description;

  _ProjectInfo(this.title, this.technologies, this.description);
}
