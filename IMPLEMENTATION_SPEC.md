# Implementation Spec: Project Showcase Features

## Task
Implement 4 interconnected features for detailed project showcasing:
1. Detail page for full project info
2. Hover tooltips showing key metrics
3. PDF export of portfolio
4. Clickable modal views

## Phase 1: Data Model Updates

### 1a. Modify ProjectData class
**File**: `lib/presentation/widgets/project_item.dart`
**Lines**: 7-27

Add `projectId` field to ProjectData:
```dart
class ProjectData {
  final String projectId;  // ADD THIS
  final String projectCoverUrl;
  final String title;
  final String category;
  final double width;
  final double height;
  final double mobileWidth;
  final double mobileHeight;
  final String link;

  ProjectData({
    required this.projectId,  // ADD THIS
    required this.projectCoverUrl,
    required this.title,
    required this.category,
    required this.width,
    this.mobileHeight = 0.5,
    this.mobileWidth = 1.0,
    this.height = 0.4,
    required this.link,
  });
}
```

### 1b. Update ALL ProjectData instantiations in data.dart
**File**: `lib/values/data.dart`
**Scope**: Lines 266-645 (all project lists)

For EACH ProjectData, add matching projectId:
- Partner V1 → projectId: 'partner_v1'
- Partner V2 → projectId: 'partner_v2'
- Expert → projectId: 'expert_app'
- Customer → projectId: 'customer_wiom'
- LMS → projectId: 'lms_wiom'
- Programming Hub → projectId: 'programming_hub'
- Grateful Diary → projectId: 'grateful_diary'
- Kidney Test → projectId: 'neodocs_kidney'
- Pregafaith → projectId: 'pregafaith'
- Malaria/Dengue → projectId: 'malaria_dengue'
- MOOV MONEY variants → projectId: 'moov_money'
- Jammerz → projectId: 'jammerz'
- OZi → projectId: 'ozi_user_app'

Format: Add `projectId: 'xxx',` as first parameter in each ProjectData constructor.

## Phase 2: Dependencies

### 2a. Update pubspec.yaml
Add after `flutter:` section:
```yaml
dependencies:
  # ... existing ...
  pdf: ^3.10.0
  printing: ^5.10.0
  intl: ^0.19.0
```

Then run: `flutter pub get`

## Phase 3: New Files - Routing

### 3a. Create detail page route
**File**: `lib/presentation/pages/project_detail/project_detail_page.dart` (NEW)

```dart
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class ProjectDetailPage extends StatefulWidget {
  final String projectId;

  const ProjectDetailPage({
    Key? key,
    required this.projectId,
  }) : super(key: key);

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  Widget build(BuildContext context) {
    final details = Data.getProjectDetails(widget.projectId);

    if (details == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Project Not Found')),
        body: const Center(child: Text('Project details not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(details.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getSidePadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(details.company,
                  style: Theme.of(context).textTheme.labelMedium),
              SpaceH16(),
              Text(details.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SpaceH16(),
              Text(details.shortDescription,
                  style: Theme.of(context).textTheme.titleMedium),
              SpaceH32(),

              // Detailed Description
              Text('Overview',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SpaceH16(),
              Text(details.detailedDescription,
                  style: Theme.of(context).textTheme.bodyMedium),
              SpaceH32(),

              // Key Features
              Text('Key Features',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SpaceH16(),
              ...details.keyFeatures.map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(feature,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  )),
              SpaceH32(),

              // Impact
              Text('Impact & Achievements',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SpaceH16(),
              ...details.impact.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('✓ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor)),
                        Expanded(
                          child: Text(item,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  )),
              SpaceH32(),

              // Technologies
              Text('Technologies',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SpaceH16(),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: details.technologies.map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(tech,
                        style: Theme.of(context).textTheme.labelMedium),
                  );
                }).toList(),
              ),
              SpaceH32(),

              // Download/Links
              Row(
                children: [
                  if (details.downloadLink != null)
                    ElevatedButton.icon(
                      onPressed: () =>
                          openUrlLink(details.downloadLink!, context),
                      icon: const Icon(Icons.download),
                      label: const Text('Download'),
                    ),
                  if (details.websiteLink != null) SpaceW16(),
                  if (details.websiteLink != null)
                    ElevatedButton.icon(
                      onPressed: () =>
                          openUrlLink(details.websiteLink!, context),
                      icon: const Icon(Icons.language),
                      label: const Text('Website'),
                    ),
                ],
              ),
              SpaceH40(),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3b. Modify router.dart
**File**: `lib/presentation/routes/router.dart`

Add import and new route:
```dart
import 'package:nimbus/presentation/pages/project_detail/project_detail_page.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: ProjectDetailRoute.page,
      path: '/project/:projectId',
    ),
  ];
}
```

Then run: `flutter pub run build_runner build --delete-conflicting-outputs`

## Phase 4: Modal Implementation

### 4a. Create modal widget
**File**: `lib/presentation/widgets/modals/project_detail_modal.dart` (NEW)

```dart
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:nimbus/utils/functions.dart';

class ProjectDetailModal extends StatefulWidget {
  final String projectId;

  const ProjectDetailModal({
    Key? key,
    required this.projectId,
  }) : super(key: key);

  @override
  _ProjectDetailModalState createState() => _ProjectDetailModalState();
}

class _ProjectDetailModalState extends State<ProjectDetailModal> {
  @override
  Widget build(BuildContext context) {
    final details = Data.getProjectDetails(widget.projectId);

    if (details == null) {
      return AlertDialog(
        title: const Text('Error'),
        content: const Text('Project details not found'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      );
    }

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header with close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(details.company,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: AppColors.primaryColor)),
                          Text(details.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SpaceH24(),

                // Short description
                Text(details.shortDescription,
                    style: Theme.of(context).textTheme.titleMedium),
                SpaceH24(),

                // Detailed description
                Text(details.detailedDescription,
                    style: Theme.of(context).textTheme.bodyMedium),
                SpaceH32(),

                // Key Features
                Text('Key Features',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                SpaceH12(),
                ...details.keyFeatures.take(3).map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Text(feature,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ],
                      ),
                    )),
                SpaceH16(),

                // Impact highlights
                Text('Impact',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                SpaceH12(),
                ...details.impact.take(3).map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('✓ ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor)),
                          Expanded(
                            child: Text(item,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ],
                      ),
                    )),
                SpaceH24(),

                // Tech stack
                Text('Technologies',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                SpaceH12(),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: details.technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(tech,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontSize: 11)),
                    );
                  }).toList(),
                ),
                SpaceH32(),

                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (details.downloadLink != null)
                      ElevatedButton.icon(
                        onPressed: () =>
                            openUrlLink(details.downloadLink!, context),
                        icon: const Icon(Icons.download),
                        label: const Text('Download'),
                      ),
                    if (details.websiteLink != null) SpaceW12(),
                    if (details.websiteLink != null)
                      ElevatedButton.icon(
                        onPressed: () =>
                            openUrlLink(details.websiteLink!, context),
                        icon: const Icon(Icons.language),
                        label: const Text('Website'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Phase 5: Tooltip Implementation

### 5a. Create metric tooltip widget
**File**: `lib/presentation/widgets/tooltips/metric_tooltip.dart` (NEW)

```dart
import 'package:flutter/material.dart';

class MetricTooltip extends StatefulWidget {
  final String label;
  final String value;
  final Widget child;

  const MetricTooltip({
    Key? key,
    required this.label,
    required this.value,
    required this.child,
  }) : super(key: key);

  @override
  _MetricTooltipState createState() => _MetricTooltipState();
}

class _MetricTooltipState extends State<MetricTooltip> {
  late TooltipTriggerMode _tooltipTriggerMode;

  @override
  void initState() {
    super.initState();
    _tooltipTriggerMode = TooltipTriggerMode.manual;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '${widget.label}: ${widget.value}',
      showDuration: const Duration(seconds: 3),
      child: widget.child,
    );
  }
}
```

### 5b. Modify ProjectItem to show tooltips
**File**: `lib/presentation/widgets/project_item.dart`
**Lines**: 61-168 (ProjectItem widget build and state management)

Modify `_ProjectItemState` to add metric display on hover. In the `build` method, wrap the banner overlay with metric tooltips. Add to ProjectCover:

```dart
// In ProjectItem build, modify the stack overlay to show metrics on hover
if (_hovering && details != null)
  Positioned(
    top: 0,
    right: 0,
    child: Tooltip(
      message: 'Technologies: ${details.technologies.join(", ")}',
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.black54,
        child: Text(
          details.technologies.take(2).join(', '),
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    ),
  ),
```

Actually, implement tooltip showing top impact metric:
```dart
if (_hovering && details != null)
  Positioned(
    bottom: 60,
    left: 10,
    right: 10,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        details.impact.isNotEmpty
            ? '✓ ${details.impact.first}'
            : '',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          height: 1.4,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ),
```

## Phase 6: PDF Export

### 6a. Create PDF generator
**File**: `lib/presentation/widgets/pdf_export/portfolio_pdf_generator.dart` (NEW)

```dart
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
```

## Phase 7: Wire Everything Together

### 7a. Modify ProjectItem to open modal/detail
**File**: `lib/presentation/widgets/project_item.dart`
**Lines**: 113-155 (GestureDetector onTap)

Replace `onTap: () => openUrlLink(widget.link, context)` with:

```dart
onTap: () {
  showDialog(
    context: context,
    builder: (BuildContext context) =>
        ProjectDetailModal(projectId: widget.projectId),
  );
},
```

Add import: `import 'package:nimbus/presentation/widgets/modals/project_detail_modal.dart';`

### 7b. Add PDF export button to ProjectsSection
**File**: `lib/presentation/pages/home/sections/projects_section.dart`
**Lines**: 189-210 (_buildNimbusInfoSectionSm and _buildNimbusInfoSectionLg)

Add FloatingActionButton or button to export PDF. Add this in build method:

```dart
floatingActionButton: FloatingActionButton.extended(
  onPressed: () => PortfolioPdfGenerator.generateAndShare(),
  label: const Text('Download Portfolio'),
  icon: const Icon(Icons.download),
),
```

Import: `import 'package:nimbus/presentation/widgets/pdf_export/portfolio_pdf_generator.dart';`

## Phase 8: Acceptance Criteria
- [ ] ProjectData has projectId field
- [ ] All 13 project instances updated with projectId
- [ ] pubspec.yaml has pdf and printing packages
- [ ] router.dart has ProjectDetailRoute
- [ ] ProjectDetailPage displays full project info
- [ ] ProjectDetailModal shows modal on click
- [ ] Hover shows metric tooltip
- [ ] PDF export generates and shares
- [ ] No compilation errors
- [ ] All 4 features work together seamlessly
