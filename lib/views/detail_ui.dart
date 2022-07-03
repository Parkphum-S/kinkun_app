import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailUI extends StatefulWidget {
  String? name;
  String? website;
  String? facebook;
  String? mobile;
  String? image;
  String? lat;
  String? lng;

  DetailUI({
    this.name,
    this.website,
    this.facebook,
    this.mobile,
    this.image,
    this.lat,
    this.lng,
  });

  @override
  State<DetailUI> createState() => _DetailUIState();
}

class _DetailUIState extends State<DetailUI> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียด'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Image.asset(
              'assets/images/' + widget.image!,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 80.0,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.shop,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        widget.name!,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _launchInBrowser(
                          Uri.parse(widget.website!),
                        );
                      },
                      leading: Icon(
                        FontAwesomeIcons.sitemap,
                        color: Colors.red,
                      ),
                      title: Text(
                        widget.website!,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _launchInBrowser(
                          Uri.parse(
                            'https://www.facebook.com/' + widget.facebook!,
                          ),
                        );
                      },
                      leading: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      title: Text(
                        widget.facebook!,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _makePhoneCall(widget.mobile!);
                      },
                      leading: Icon(
                        FontAwesomeIcons.mobile,
                        color: Colors.black,
                      ),
                      title: Text(
                        widget.mobile!,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _launchInBrowser(
                          Uri.parse(
                            'https://www.google.com/maps/@${widget.lat},${widget.lng},15z',
                          ),
                        );
                      },
                      leading: Icon(
                        FontAwesomeIcons.mapLocation,
                        color: Colors.green,
                      ),
                      title: Text(
                        'เปิดแผนที่ร้าน',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
