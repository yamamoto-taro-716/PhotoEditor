import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:photo_editor_pro/screens/CompressImageScreen.dart';
import 'package:photo_editor_pro/screens/CropImageScreen.dart';
import 'package:photo_editor_pro/screens/PhotoEditScreen.dart';
import 'package:photo_editor_pro/screens/RemoveBackgroundScreen.dart';
import 'package:photo_editor_pro/screens/ResizeImageScreen.dart';
import 'package:photo_editor_pro/components/button.dart';
import 'package:photo_editor_pro/services/FileService.dart';
import 'package:photo_editor_pro/utils/Constants.dart';

import 'HomeItemWidget.dart';

class HomeItemListWidget extends StatefulWidget {
  static String tag = '/HomeItemListWidget';

  @override
  _HomeItemListWidgetState createState() => _HomeItemListWidgetState();
}

class _HomeItemListWidgetState extends State<HomeItemListWidget> {
  void pickImageSource(ImageSource imageSource) {
    pickImage(imageSource: imageSource).then((value) {
      if (value != null)
        PhotoEditScreen(file: value).launch(context, isNewTask: true);
    }).catchError((e) {
      toast(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0,
      runSpacing: 0,
      alignment: WrapAlignment.center,
      children: [
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            color: Grey, width: 1, style: BorderStyle.solid)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.photo_camera_outlined,
                          color: Green,
                          size: 48,
                        ),
                        Text('カメラ',
                                style: boldTextStyle(size: 20, color: Green))
                            .paddingAll(6)
                      ],
                    )),
                onTap: () {
                  finish(context);
                  pickImageSource(ImageSource.camera);
                },
              ),
            ),
            Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            color: Grey, width: 1, style: BorderStyle.solid)),
                    width: 160,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.photo_outlined,
                          color: Blue,
                          size: 48,
                        ),
                        Text('ギャラリー',
                                style: boldTextStyle(size: 20, color: Blue))
                            .paddingAll(6)
                      ],
                    ),
                  ),
                  onTap: () {
                    finish(context);
                    pickImageSource(ImageSource.gallery);
                  },
                )),
          ],
        )
        // HomeItemWidget(
        //   widget: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(
        //         decoration:
        //             BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        //         child: Icon(Icons.photo_library_outlined, color: Colors.green),
        //         padding: EdgeInsets.all(12),
        //       ),
        //       16.width,
        //       Text('写真を選択',
        //           style: boldTextStyle(size: 22, color: Colors.white)),
        //     ],
        //   ),
        //   onTap: () {
        //     showModalBottomSheet(
        //       context: context,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(12)),
        //       ),
        //       builder: (context) => Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        //           // image: DecorationImage(
        //           //     image: AssetImage('images/gallery_background.png'),
        //           //     fit: BoxFit.cover),
        //         ),
        //         width: context.width(),
        //         height: 160,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             18.height,
        //             Text(
        //               '写真を選択してください',
        //               style: TextStyle(fontSize: 18, color: Red),
        //             ),
        //             18.height,

        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
        // HomeItemWidget(
        //   widget: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(
        //         decoration:
        //             BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        //         child: Icon(Icons.crop, color: Colors.pink),
        //         padding: EdgeInsets.all(16),
        //       ),
        //       16.height,
        //       Text('Crop & Rotate', style: boldTextStyle(color: Colors.white)),
        //     ],
        //   ),
        //   onTap: () {
        //     pickImage()
        //         .then((value) => CropImageScreen(file: value).launch(context))
        //         .catchError(log);
        //   },
        // ),
        // HomeItemWidget(
        //   widget: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(
        //         decoration:
        //             BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        //         child: Icon(Icons.photo_filter_sharp, color: Colors.blue),
        //         padding: EdgeInsets.all(16),
        //       ),
        //       16.height,
        //       Text('Resize', style: boldTextStyle(color: Colors.white)),
        //     ],
        //   ),
        //   onTap: () {
        //     pickImage().then(
        //         (value) => ResizeImageScreen(file: value).launch(context));
        //   },
        // ),
        // HomeItemWidget(
        //   widget: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(
        //         decoration:
        //             BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        //         child: Icon(Icons.compress, color: Colors.orange),
        //         padding: EdgeInsets.all(16),
        //       ),
        //       8.height,
        //       Text('Compress', style: boldTextStyle(color: Colors.white)),
        //     ],
        //   ),
        //   onTap: () {
        //     pickImage().then(
        //         (value) => CompressImageScreen(file: value).launch(context));
        //   },
        // ),
        // HomeItemWidget(
        //   widget: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(Icons.crop, size: 50, color: Colors.grey),
        //       8.height,
        //       Text('Remove Background',
        //           style: boldTextStyle(color: Colors.white)),
        //     ],
        //   ),
        //   onTap: () {
        //     pickImage().then(
        //         (value) => RemoveBackgroundScreen(file: value).launch(context));
        //   },
        // )
      ],
    ).paddingAll(8).center();
  }
}
