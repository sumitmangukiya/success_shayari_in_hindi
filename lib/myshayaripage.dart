import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:success_shayari_in_hindi/fullpage.dart';
import 'package:success_shayari_in_hindi/ui_helper/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class MyShayariPage extends StatefulWidget {
  var getname;

  MyShayariPage(this.getname);

  @override
  State<MyShayariPage> createState() => _MyShayariPageState(this.getname);
}

class _MyShayariPageState extends State<MyShayariPage> {
  var getname;
  var shayari;

  _MyShayariPageState(this.getname);

  var pyarlist = [
    {
      "shayari":
          "❝ तेरे प्यार की ख़ुशबू सदा मेरे दिल में बनी रहे, तू मेरी दुआ की तरह हमेशा साथ रहे ❜❜",
    },
    {
      "shayari":
          "❝ तेरे प्यार में हर लम्हा गुजर जाता है मगर तुझसे मिलने का इंतजार रहता है ❜❜",
    },
    {
      "shayari":
          "❝ तू है तो हर सुबह खुशियों से भरी होती है, तेरे बिना जिन्दगी सुनी सी लगती है ❜❜",
    },
    {
      "shayari":
          "❝ तेरी मोहब्बत में हर दर्द सही जाता है, क्योंकि तू है तो हर मुश्किल आसानी से पार होती है ❜❜",
    },
    {
      "shayari":
          "❝ तेरे प्यार के साथ हर पल खास बन जाता है, तू मेरे जीवन की सबसे बड़ी खुशी है ❜❜",
    },
    {
      "shayari":
          "❝ तेरी आँखों का जादू, तेरी हँसी की खुशबू, तुझसे मिलकर हमारी जिंदगी हुई है ख़ास ❜❜",
    },
    {
      "shayari":
          "❝ तेरे प्यार में हर रोज़ नया दिन खुशियों से भर जाता है, तू मेरे दिल की धड़कन है ❜❜",
    },
    {
      "shayari":
          "❝ तेरी यादों में खोकर हम अकेलेपन को भूल जाते हैं, तू मेरी दुनिया है, मेरी जिंदगी की मिसाल ❜❜",
    },
    {
      "shayari":
          "❝ तेरे बिना दुनिया सुनी सी लगती है, तू मेरी जिंदगी की सबसे बड़ी जरूरत है ❜❜",
    },
    {
      "shayari":
          "❝ तुझसे मिलकर हमने प्यार का सच जाना, तेरे बिना हमारा दिल अधूरा है ❜❜",
    }
  ];

  var dostilist = [
    {
      "shayari":
          "❝ दोस्ती हर रिश्ते से प्यारी होती है, दोस्त हर दुश्मन से यारी होती है ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती वो ख़ज़ाना है जिसकी कोई कीमत नहीं, दोस्त वो रिश्ता है जो बिना शर्त किये मिलता है ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती एक आईना होती है, जिसमें हम अपनी सच्ची छवि देखते हैं ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती का रिश्ता बिना कोई शर्त के बनता है, ये वो रिश्ता है जो दिल से बनता है ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती के रंग उसकी मिसाल होते हैं, जो दिल के क़रीब होते हैं ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती वो सफर है जिसमें हम साथ चलते हैं, चाहे रास्ता कितना भी लम्बा क्यों ना हो ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती एक मिठास की तरह होती है, जो जिंदगी को और भी ख़ूबसूरत बना देती है ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती वो सुनावट होती है जिसका कोई अल्फाज नहीं होते, बस दिल की गहराइयों में छुपा दोस्त होता है ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती की राहों में कभी दरारें आती हैं, पर हमारी दोस्ती हमें हर मुश्किल को सहने की ताक़त देती है ❜❜",
    },
    {
      "shayari":
          "❝ दोस्ती वो आवाज़ होती है जो सिर्फ दिल से सुनी जाती है, और बोलती दिल की भावनाओं को ❜❜",
    }
  ];

  var udasilist = [
    {
      "shayari":
          "❝ दिल में है उदासी, आँखों में है नमी, कौन समझेगा मेरी ये हालत, मैं हूँ खुद ही बेखबर। ❜❜",
    },
    {
      "shayari":
          "❝ खो गया वो लम्हा, जिसमें थी खुशियाँ, आज तो बस उदासी है, हर तरफ़ अँधेरा है। ❜❜",
    },
    {
      "shayari":
          "❝ किसने कहा था कि प्यार, हमेशा खुशियाँ देगा, ये तो प्यार ही है, जो उदासी भी देगा। ❜❜",
    },
    {
      "shayari":
          "❝ िल टूट गया है मेरा, प्यार में धोखा खाकर, आज तो बस उदासी है, मेरे जिस्म में। ❜❜",
    },
    {
      "shayari":
          "❝ रात भर रोता रहा, मैं अपने दिल की ज़ख्मों को, आज तो बस उदासी है, मेरे चेहरे पर। ❜❜",
    },
    {
      "shayari":
          "❝ खो गया वो प्यार, जिसे मैं पाना चाहता था, आज तो बस उदासी है, मेरे जीवन में। ❜❜",
    },
    {
      "shayari":
          "❝ तन्हाई ने घेर लिया है मुझे, कोई नहीं है मेरे पास, आज तो बस उदासी है, मेरे दिल में। ❜❜",
    },
    {
      "shayari":
          "❝ वो याद आते हैं, हर पल मुझको, आज तो बस उदासी है, मेरे दिल की धड़कन में। ❜❜",
    },
    {
      "shayari":
          "❝ खो गया वो रिश्ता, जो मुझे बहुत प्यारा था, आज तो बस उदासी है, मेरे जीवन में। ❜❜",
    },
    {
      "shayari":
          "❝ मुझे नहीं पता कि, ये उदासी कब जाएगी, लेकिन मैं जानता हूँ, कि मैं इससे कभी नहीं भागूंगा। ❜❜",
    },
  ];

  var gussalist = [
    {
      "shayari":
          "❝ गुस्सा तो सिर्फ एक आवाज़ है, जिसका जवाब शांति से देना हमारी आदत है। ❜❜"
    },
    {
      "shayari":
          "❝ कभी कभी जब गुस्सा आता है, तो सब कुछ खो देने का मन करता है। ❜❜"
    },
    {
      "shayari": "❝ गुस्सा सिर्फ एक भावना होती है, जो शब्दों में नहीं फिटती। ❜❜"
    },
    {
      "shayari":
          "❝ गुस्से के बाद बातें वो करते हैं, जो सबसे पहले दिल से कहते हैं। ❜❜"
    },
    {
      "shayari":
          "❝ गुस्से का आलम है अलग ही, जब दिल में बस जाता है, तो कुछ भी कह सकते हैं। ❜❜"
    },
    {
      "shayari":
          "❝ गुस्सा सिर्फ दिल के पास रहता है, जब तक उसे बयान नहीं किया जाता। ❜❜"
    },
    {
      "shayari":
          "❝ गुस्से के साथ सब कुछ बिगड़ जाता है, इसलिए अकेले में बिना किसी को बताए वेंटने से सही होता है। ❜❜"
    },
    {
      "shayari": "❝ गुस्सा होता है वो महौल, जहां जब बातें नहीं काम करती हैं। ❜❜"
    },
    {
      "shayari":
          "❝ गुस्से से बढ़कर कुछ भी नहीं है, क्योंकि गुस्सा नुकसान करता है। ❜❜"
    },
    {
      "shayari":
          "❝ गुस्सा सिर्फ एक अंदाज़ है, जिसमें बोलने का हक सबको होता है। ❜❜"
    }
  ];

  var majedarlist = [
    {
      "shayari":
          "❝ शादी में बच्चे के जन्म के बाद एक सवाल आता है, 'कौन है इसके और कैसे हो गया?' ❜❜"
    },
    {
      "shayari":
          "❝ आजकल के दिन में 'कितने बजे आए?' ये सवाल बच्चों से पूछा जाता है, और ससुराल वालों से नहीं। ❜❜"
    },
    {
      "shayari":
          "❝ व्यक्ति के पास खुद की सेल्फी नहीं होती, तो क्या वह वाकई मौजूद होता है? ❜❜"
    },
    {
      "shayari":
          "❝ आजकल के बच्चे तो खुद के नाम के साथ 'ऑनलाइन' भी रख लेते हैं, क्योंकि 'ऑफलाइन' में नहीं मिलते। ❜❜"
    },
    {
      "shayari":
          "❝ जब से मोबाइल आया है, तब से 'सोना' की कीमत में कमी हो गई है, क्योंकि अब लोग सोते वक़्त भी सोने में लगे रहते हैं। ❜❜"
    },
    {
      "shayari":
          "❝ दोस्ती में 'रूप बदलकर' करने वाले कभी दोस्त नहीं होते, वे तो मित्रता के 'स्वरूप' के बदलकर ही रहते हैं। ❜❜"
    },
    {
      "shayari":
          "❝ आजकल के दिन में लोग 'स्ट्रेस' को छोड़कर 'सेल्फी' के साथ खुश रहते हैं। ❜❜"
    },
    {
      "shayari":
          "❝ कुछ लोगों की सोच कुछ खास होती है, वे 'बर्गर' खाने के बाद भी 'वेजिटेरियन' कहते हैं। ❜❜"
    },
    {
      "shayari":
          "❝ जब कुछ भी बुरा होता है, तो लोग कहते हैं 'कुछ अच्छे के लिए होता है'। अब यह तय करो कि वह 'अच्छे' क्या हो सकता है! ❜❜",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("$getname"),
      body: Hero(
        tag: 'hero',
        child: Stack(children: [
          Image.asset(
            'assets/images/bg_image_home.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: setListview(),
          ),
        ]),
      ),
    );
  }

  setListview() {
    switch (getname) {
      case "प्यार":
        return setShayrilist(pyarlist);
      case "दोस्ती":
        return setShayrilist(dostilist);
      case "उदासी":
        return setShayrilist(udasilist);
      case "गुस्सा":
        return setShayrilist(gussalist);
      case "मज़ेदार":
        return setShayrilist(majedarlist);
    }
  }

  setShayrilist(List<Map<String, String>> listname) {
    return ListView(
      children: listname
          .map(
            (e) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullPage(e["shayari"]!)));
              },
              child: Container(
                margin: EdgeInsets.all(6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26,
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          textAlign: TextAlign.center,
                          e["shayari"]!,
                          style: mTextStyle22().copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyContainerImage(
                                FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Colors.green,
                                  size: 30,
                                ), () {
                              shayari = e["shayari"];
                              _launchURL(shayari);
                            }),
                            MyContainerImage(
                                FaIcon(
                                  FontAwesomeIcons.share,
                                  color: Colors.indigo,
                                  size: 30,
                                ), () {
                              shayari = e["shayari"];
                              Share.share(shayari);
                            }),
                            MyContainerImage(
                              FaIcon(
                                FontAwesomeIcons.copy,
                                color: Colors.pink,
                                size: 30,
                              ),
                              () {
                                shayari = e["shayari"];
                                Clipboard.setData(
                                  ClipboardData(text: shayari),
                                );
                                Fluttertoast.showToast(
                                    msg: "Copied",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              },
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ).toList(),
    );
  }
}

_launchURL(String urlname) async {
  final Uri url = Uri.parse("https://wa.me/?text=" + urlname);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
