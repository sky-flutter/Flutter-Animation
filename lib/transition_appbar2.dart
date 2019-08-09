import 'package:flutter/material.dart';

class TransitionAppBar extends StatefulWidget {
  final Widget avatar;
  final Widget title;
  final Widget searchIcon;

  const TransitionAppBar({this.avatar, this.title, this.searchIcon, Key key})
      : super(key: key);

  @override
  _TransitionAppBarState createState() => _TransitionAppBarState();
}

class _TransitionAppBarState extends State<TransitionAppBar>
    with TickerProviderStateMixin<TransitionAppBar> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _TransitionAppBarDelegate(
          avatar: widget.avatar,
          title: widget.title,
          searchIcon: this.widget.searchIcon,
          width: width),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget avatar;
  final Widget title;
  final double width;

  SizeTween _avatarTween, _searchIconTween;

  EdgeInsetsTween _avatarMarginTween;

  AlignmentTween _avatarAlignTween;

  AlignmentTween _titleAlignTween;

  EdgeInsetsTween _titleMarginTween;
  Tween<double> fontSize = Tween(begin: 24, end: 14);
  EdgeInsetsTween _marginTitle = EdgeInsetsTween(
      begin: EdgeInsets.only(left: 4, top: 160),
      end: EdgeInsets.only(left: 56, top: 36));

  final Widget searchIcon;

  _TransitionAppBarDelegate(
      {this.avatar, this.title, this.searchIcon, this.width})
      : assert(avatar != null),
        assert(searchIcon != null),
        assert(title != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    setTweenAnimation();
    final progress = shrinkOffset / 200.0;
    final avatarSize = _avatarTween.lerp(progress);
    final searchIconSize = _searchIconTween.lerp(progress);
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final avatarAlign = _avatarAlignTween.lerp(progress);
    final titleFontSize = fontSize.lerp(progress);
    final titleMargin = _titleMarginTween.lerp(progress);
    final pageTitleMargin = _marginTitle.lerp(progress);
    final titleAlign = _titleAlignTween.lerp(progress);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.only(top: 8),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            createSearchSection(
                progress, avatarMargin, avatarSize, avatarAlign, searchIconSize),
            Padding(
              padding: titleMargin.isNonNegative ? titleMargin : EdgeInsets.only(
                  left: 10.0 + 50.0 + 5.0,
                  right: 58.0, top:14
              ),
              child: Align(
                alignment: titleAlign,
                child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.title, child: title),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox.fromSize(
                child: Container(
                    margin: EdgeInsets.only(top: 24, right: 4,left: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300,width: 1),
                        color: Colors.grey.shade100),
                    child: IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.black,
                        ),
                        onPressed: () {})),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: EdgeInsets.only(top: 26.4, right: 8),

                  child: IconButton(
                    iconSize: 32,
                      padding: EdgeInsets.all(4),
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: () {})),
            ),
            Container(
              width: double.infinity,
              margin: pageTitleMargin.isNonNegative ? pageTitleMargin : EdgeInsets.only(left: 56, top: 36),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Choose your new",
                    style: TextStyle(
                        fontSize: titleFontSize, color: Colors.grey.shade700),
                  ),
                  Text(
                    "gree friend",
                    style: TextStyle(
                        fontSize: titleFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  createSearchSection(double progress, EdgeInsets avatarMargin, Size avatarSize,
      Alignment avatarAlign, Size searchIconSize) {
    return Padding(
      padding: avatarMargin.isNonNegative ? avatarMargin : 0.0,
      child: Align(
        alignment: avatarAlign,
        child: SizedBox.fromSize(size: avatarSize, child: avatar),
      ),
    );
  }

  @override
  double get maxExtent => 300.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar || title != oldDelegate.title;
  }

  void setTweenAnimation() {
    _avatarTween =
        SizeTween(begin: Size(width - 84, 50.0), end: Size(49.0, 50.0));
    _avatarMarginTween = EdgeInsetsTween(
        begin: EdgeInsets.only(left: 2.0),
        end: EdgeInsets.only(right: 110.0, top: 16));
    _avatarAlignTween =
        AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.centerRight);

    _searchIconTween = SizeTween(begin: Size(50, 50.0), end: Size(50.0, 50.0));

    _titleMarginTween = EdgeInsetsTween(
        begin: EdgeInsets.only(right:4.0, left: 16, bottom: 2),
        end: EdgeInsets.only(
          left: 10.0 + 50.0 + 5.0,
          right: 58.0, top:14
        ));
    _titleAlignTween = AlignmentTween(
        begin: Alignment.bottomRight, end: Alignment.centerRight);
  }
}
