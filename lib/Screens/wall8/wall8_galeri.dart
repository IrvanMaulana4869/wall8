import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_pilihan.dart';

class Wall8Gallery extends StatefulWidget {
  final List<DocumentSnapshot> listWallpaper;

  final int pageAwal;

  Wall8Gallery({Key key, @required this.listWallpaper, @required this.pageAwal})
      : super(key: key);

  @override
  _Wall8GalleryState createState() => _Wall8GalleryState();
}

class _Wall8GalleryState extends State<Wall8Gallery> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.pageAwal);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PhotoViewGallery.builder(
          pageController: _pageController,
          itemCount: widget.listWallpaper.length,
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(
                widget.listWallpaper.elementAt(index)['url'],
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: 100.0,
              color: Color(IconTheme.of(context).color.value ^ 0xffffff),
              child: IconButton(
                icon: Icon(Icons.format_paint),
                onPressed: () async {
                  await wall8atur(
                      context: context,
                      imgUrl: widget.listWallpaper
                          .elementAt(_pageController.page.toInt())['url']);
                },
              ),
            ),
          ),
        )
      ]),
    );
  }
}
