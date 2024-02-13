import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  String imageurl;
  FullScreen({Key? key, required this.imageurl}) : super(key: key);
  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaper() async {
    int location1 = WallpaperManager.HOME_SCREEN;
    int location2 = WallpaperManager.LOCK_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);

    (await WallpaperManager.setWallpaperFromFile(file.path, location1));
    (await WallpaperManager.setWallpaperFromFile(file.path, location2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.network(widget.imageurl),
          ),
          InkWell(
            //  key: _scaffoldKey,
            //  floatingActionButton: ElevatedButton(
            onTap: () async {
              await setwallpaper();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.purpleAccent,
              child: const Center(
                child: Text('Set as wallpaper',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
