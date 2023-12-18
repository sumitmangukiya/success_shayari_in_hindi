import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:success_shayari_in_hindi/ui_helper/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class FullPage extends StatefulWidget {
  String name;

  FullPage(this.name);

  @override
  State<FullPage> createState() => _FullPageState(this.name);
}

class _FullPageState extends State<FullPage> {
  var name;

  _FullPageState(this.name);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/bg_image.png",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black54,
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                              textAlign: TextAlign.center,
                              widget.name,
                              style: mTextStyle22().copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyContainerImage(
                                  FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Colors.green,
                                    size: 30,
                                  ), () {
                                _launchURL(name);
                              }),
                              MyContainerImage(
                                  FaIcon(
                                    FontAwesomeIcons.share,
                                    color: Colors.indigo,
                                    size: 30,
                                  ), () {
                                Share.share(name);
                              }),
                              MyContainerImage(
                                  FaIcon(
                                    FontAwesomeIcons.copy,
                                    color: Colors.pink,
                                    size: 30,
                                  ), () {
                                Clipboard.setData(
                                  ClipboardData(text: name),
                                );
                                Fluttertoast.showToast(
                                    msg: "Copied",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.black,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }),
                            ]),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

_launchURL(String urlname) async {
  final Uri url = Uri.parse("https://wa.me/?text=" + urlname);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
