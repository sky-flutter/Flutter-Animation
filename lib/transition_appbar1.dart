import 'package:flutter/material.dart';

class TransitionAppBar1 extends StatelessWidget {
  final Widget widgetSearch;
  final Widget widgetFilter;

  TransitionAppBar1(this.widgetSearch, this.widgetFilter, Key key)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  // Search Animation Tween
  final _searchTween = SizeTween(begin: Size(150, 150), end: Size(50, 50));
  final _searchMarginTween =
      EdgeInsetsTween(begin: EdgeInsets.zero, end: EdgeInsets.only(left: 10));
  final _searchAlignTween =
      AlignmentTween(begin: Alignment.topCenter, end: Alignment.centerLeft);

// Filter Animation Tween
  final _filterTween = SizeTween(begin: Size(150, 150), end: Size(80, 80));
  final _filterMarginTween = EdgeInsetsTween(
      begin: EdgeInsets.only(top: (150.0 + 5.0)),
      end: EdgeInsets.only(left: 10.0 + 50.0 + 5.0));
  final _filterAlignTween =
      AlignmentTween(begin: Alignment.center, end: Alignment.centerLeft);

  final Widget widgetSearch;
  final Widget widgetFilter;

  _TransitionAppBarDelegate({this.widgetSearch, this.widgetFilter})
      : assert(widgetSearch != null),
        assert(widgetFilter != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / 200.0;

    final searchWidgetSize = _searchTween.lerp(progress);
    final searchWidgetMargin = _searchMarginTween.lerp(progress);
    final searchWidgetAlign = _searchAlignTween.lerp(progress);

    final filterWidgetSize = _filterTween.lerp(progress);
    final filterWidgetMargin = _filterMarginTween.lerp(progress);
    final filterWidgetAlign = _filterAlignTween.lerp(progress);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Padding(
          padding: searchWidgetMargin,
          child: Align(
            alignment: searchWidgetAlign,
            child: SizedBox.fromSize(
              size: searchWidgetSize,
              child: widgetSearch,
            ),
          ),
        ),
        Padding(
          padding: filterWidgetMargin,
          child: Align(
            alignment: filterWidgetAlign,
            child: SizedBox.fromSize(
              size: filterWidgetSize ,
              child: widgetFilter,
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return widgetSearch != oldDelegate.widgetSearch &&
        widgetFilter != oldDelegate.widgetFilter;
  }
}
