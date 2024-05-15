import 'package:flutter/material.dart';

import 'community_entry_loading_skeleton.dart';

class CommunityEntryProgressIndicator extends StatelessWidget {
  const CommunityEntryProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CommunityEntryLoadingSkeleton(),
        SizedBox(height: 8),
        CommunityEntryLoadingSkeleton(),
        SizedBox(height: 8),
        CommunityEntryLoadingSkeleton(),
      ],
    );
  }
}
