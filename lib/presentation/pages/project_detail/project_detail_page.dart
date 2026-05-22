import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
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
              SpaceH36(),

              // Detailed Description
              Text('Overview',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SpaceH16(),
              Text(details.detailedDescription,
                  style: Theme.of(context).textTheme.bodyMedium),
              SpaceH36(),

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
                  )).toList(),
              SpaceH36(),

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
                  )).toList(),
              SpaceH36(),

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
              SpaceH36(),

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
