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
                SpaceH36(),

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
                    )).toList(),
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
                    )).toList(),
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
                SpaceH36(),

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
