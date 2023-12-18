import 'package:flutter/material.dart';
import 'package:success_shayari_in_hindi/myshayaripage.dart';
import 'package:success_shayari_in_hindi/ui_helper/utils.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var newmaplist = [
    {
      "name": "प्यार",
      "image": "assets/images/img_love.png",
    },
    {
      "name": "दोस्ती",
      "image": "assets/images/img_dosti.png",
    },
    {
      "name": "उदासी",
      "image": "assets/images/img_udasi.png",
    },
    {
      "name": "गुस्सा",
      "image": "assets/images/img_gussa.png",
    },
    {
      "name": "मज़ेदार",
      "image": "assets/images/img_funny.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Success Shayari in Hindi"),
      body: Stack(children: [
        Image.asset(
          'assets/images/bg_image_home.png',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: EdgeInsets.all(6.0),
          child: ListView(
            children: newmaplist
                .map(
                  (e) => Hero(
                    tag: 'hero',
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyShayariPage(e["name"]),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          image: DecorationImage(
                            image: AssetImage(e["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/images/image_frame.png",
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                              child: Text(e["name"]!,
                                  style: mTextStyle22().copyWith(fontSize: 25)))
                        ]),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ]),
    );
  }
}
