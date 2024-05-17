import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../theme/colors.dart';

class CommunityEntryLoadingSkeleton extends StatelessWidget {
  const CommunityEntryLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      effect: ShimmerEffect(
        baseColor: white.withOpacity(0.08),
        highlightColor: white.withOpacity(0.16),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Bone.circle(size: 48),
                  SizedBox(width: 8),
                  Bone.text(),
                  Expanded(child: SizedBox()),
                  Bone.circle(size: 48),
                  Bone.circle(),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Bone.button(width: 150, height: 100, uniRadius: 8),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bone.text(width: 100),
                      SizedBox(height: 8),
                      Bone.text(width: 50),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Bone.multiText(lines: 3),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Bone.button(),
                  SizedBox(width: 8),
                  Bone.button(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
