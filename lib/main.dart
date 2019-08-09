import 'package:flutter/material.dart';
import 'package:flutter_events_app/product_details.dart';
import 'package:flutter_events_app/search_icon_button_widget.dart';
import 'package:flutter_events_app/search_widget.dart';
import 'package:flutter_events_app/transition_appbar2.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'filter_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class _MyAppState extends State<MyApp> {
  List<Widget> listGrid = List();

  initState() {
    super.initState();
  }

  createGrid(context) {
    listGrid
        .add(createGridItem("images/image_1.jpg", Color(0XFFF1B8CB), context));
    listGrid
        .add(createGridItem("images/image_2.jpg", Color(0XFF5d5d5d), context));
    listGrid
        .add(createGridItem("images/image_3.jpg", Color(0XFF87cefa), context));
    listGrid
        .add(createGridItem("images/image_4.jpg", Color(0XFFE2CDBC), context));
    listGrid
        .add(createGridItem("images/image_5.jpg", Color(0XFF42424E), context));
    listGrid
        .add(createGridItem("images/image_6.jpg", Color(0XFFE5D2B1), context));
    listGrid
        .add(createGridItem("images/image_7.jpg", Color(0XFFBBADA2), context));
    listGrid
        .add(createGridItem("images/image_8.jpg", Color(0XFFBBADA2), context));
    listGrid
        .add(createGridItem("images/image_9.jpg", Color(0XFFBBADA2), context));
    listGrid
        .add(createGridItem("images/image_10.jpg", Color(0XFFBBADA2), context));
    listGrid
        .add(createGridItem("images/image_11.jpg", Color(0XFFBBADA2), context));
    listGrid
        .add(createGridItem("images/image_12.jpg", Color(0XFFBBADA2), context));
    listGrid
        .add(createGridItem("images/image_13.jpg", Color(0XFFBBADA2), context));
    listGrid
        .add(createGridItem("images/image_1.jpg", Color(0XFFF1B8CB), context));
    listGrid
        .add(createGridItem("images/image_2.jpg", Color(0XFF5d5d5d), context));
    listGrid
        .add(createGridItem("images/image_3.jpg", Color(0XFF87cefa), context));
    listGrid
        .add(createGridItem("images/image_4.jpg", Color(0XFFE2CDBC), context));
    listGrid
        .add(createGridItem("images/image_5.jpg", Color(0XFF42424E), context));
    listGrid
        .add(createGridItem("images/image_6.jpg", Color(0XFFE5D2B1), context));
  }

  createGridItem(
    image,
    Color color,
    mContext,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(scaffoldKey.currentContext)
            .push(MaterialPageRoute(builder: (context) => ProductDetails(image,color)));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Hero(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(image),
                ), tag: image,
              ),
              Container(
                color: color.withOpacity(0.2),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.add),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: color.withOpacity(0.4)),
                ),
              )
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    createGrid(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          key: scaffoldKey,
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: CustomScrollView(
              primary: true,
              slivers: <Widget>[
                TransitionAppBar(
                    avatar: SearchWidget(),
                    title: FilterWidget(),
                    searchIcon: SearchIconWidget(),
                    key: Key("TransitionAppBar")),
                SliverStaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 6.0,
                  children: listGrid,
                  staggeredTiles: const <StaggeredTile>[
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 2),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 2),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 2),
                    const StaggeredTile.count(2, 2),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 2),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 2),
                    const StaggeredTile.count(2, 3),
                    const StaggeredTile.count(2, 2),
                    const StaggeredTile.count(1, 2),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
