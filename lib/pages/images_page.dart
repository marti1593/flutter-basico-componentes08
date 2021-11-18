import 'package:flutter/material.dart';
import 'package:widgets_07/widgets/custom_image.dart';

class ImagesPage extends StatelessWidget {
  static const String ROUTE = "/images";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imágenes"),
      ),
       body: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            CustomImage(urlRoute: "https://www.exceedone.co.jp/wp-content/uploads/2020/08/logo-para-web--1024x1024.gif"),
            SizedBox(width: 8,),
            CustomImage(urlRoute: "https://www.exceedone.co.jp/wp-content/uploads/2020/08/logo-para-web--1024x1024.gif"),
            SizedBox(width: 8,),
            
            
          ],
        ),
      ),
    );
  }
}