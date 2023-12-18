import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:success_shayari_in_hindi/homepage.dart';
import 'package:success_shayari_in_hindi/ui_helper/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => ExitDialog(),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Success Shayari in Hindi",
          style: mTextStyle17(),
        ),
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Stack(children: [
          Image.asset(
            'assets/images/bg_image_home.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MyContainer(
                      FaIcon(
                        FontAwesomeIcons.share,
                        size: 25,
                        color: Colors.white,
                      ), () {
                    Share.share(
                        "Download This Application : https://play.google.com/store/apps/details?id=" +
                            "com.example.success_shayari_in_hindi");
                  }),
                  MyContainer(
                      FaIcon(
                        FontAwesomeIcons.star,
                        size: 25,
                        color: Colors.white,
                      ), () {
                    _launchURL(
                        'https://play.google.com/store/apps/details?id=com.example.success_shayari_in_hindi');
                  }),
                  InkWell(
                    onTap: () {
                      _launchURL('https://www.google.com/');
                    },
                    child: Container(
                      margin: EdgeInsets.all(6),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(55),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.security,
                        color: Colors.white,
                        size: 25,
                      )),
                    ),
                  ),
                ]),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(12),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      ),
                    ),
                    width: 250,
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: mTextStyle22(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Confirm Exit',
              style: mTextStyle22().copyWith(color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              'Are you sure you want to exit the app?',
              style: mTextStyle17().copyWith(color: Colors.black),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Center(child: Text('No', style: mTextStyle22())),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Center(child: Text('Yes', style: mTextStyle22())),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(String urlname) async {
  final Uri url = Uri.parse(urlname);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
