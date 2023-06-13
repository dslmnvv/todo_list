import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:todo_list/src/presentation/style/style_library.dart';
import 'package:todo_list/src/presentation/style/theme/style_theme.dart';

class CustomAppBarDelegate implements SliverPersistentHeaderDelegate {
  @override
  final double maxExtent;
  @override
  final double minExtent;

  final String title;

  final String subTitle;

  final Widget? action;

  CustomAppBarDelegate({
    required this.maxExtent,
    required this.minExtent,
    required this.title,
    required this.subTitle,
    required this.action,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: StyleLibrary.padding.appBar,
      color: Theme.of(context).colorScheme.backPrimary,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: getXPosition(shrinkOffset),
            bottom:
                getYPosition(shrinkOffset) + getReduction(shrinkOffset, 20, 0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: getReduction(shrinkOffset, 32, 20),
                  ),
            ),
          ),
          Positioned(
            left: getXPosition(shrinkOffset),
            bottom: getYPosition(shrinkOffset),
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: getReduction(shrinkOffset, 16, 8),
                  color: StyleLibrary.color.tertiary
                      .withOpacity(titleOpacity(shrinkOffset))),
            ),
          ),
          Positioned(
            right: 0,
            bottom: getYPosition(shrinkOffset),
            child: (action != null) ? action! : const SizedBox(),
          )
        ],
      ),
    );
  }

  double getYPosition(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  double getXPosition(double shrinkOffset) {
    double leftPad = 60 - StyleLibrary.padding.appBar.left;

    return leftPad - (shrinkOffset * leftPad) / maxExtent;
  }

  double titleOpacity(double shrinkOffset) {
    double opacity = 0.9 - max(0.0, shrinkOffset) / maxExtent;
    if (opacity > 0.3) {
      return 0.3;
    }
    if (opacity < 0) {
      return 0;
    }

    return opacity;
  }

  double getReduction(double shrinkOffset, double maxSize, double minSize) {
    return maxSize -
        ((shrinkOffset - minExtent) * (maxSize - minSize)) /
            (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;
}
