import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/models/address_model.dart';
import '../app/models/emails_model.dart';
import '../app/models/status_model.dart';

class CandidateDetailContent extends StatelessWidget {
  const CandidateDetailContent({
    Key? key,
    required this.emailModel,
    required this.addressModel,
    required this.statusModel,
    required this.image,
    required this.name,
    required this.statusIcon,
    required this.statusColor,
  }) : super(key: key);

  final EmailModel emailModel;
  final Address addressModel;
  final Status statusModel;
  final String image;
  final String name;
  final Widget statusIcon;
  final Widget statusColor;

  @override
  Widget build(BuildContext context) {
    List<String> values = [
      addressModel.address!,
      addressModel.zipCode.toString(),
      addressModel.city!,
      addressModel.state!,
    ];

    final String joinValues = values.join(',');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 60.0,
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mail),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () async {
                String _url =
                    'mailto:${emailModel.email}?subject=MK company&body=Hi i am from MK company';

                if (await canLaunch(_url)) {
                  await launch(_url);
                } else {
                  throw 'Could not launch $_url';
                }
              },
              child: Text(
                emailModel.email!,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://seeklogo.com/images/W/whatsapp-icon-logo-BDC0A8063B-seeklogo.com.png',
              width: 25,
              height: 25,
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () async {
                final _presetText = 'Hi i am from MK company';

                String _url;
                if (Platform.isAndroid) {
                  // add the [https]
                  _url =
                      'https://wa.me/${emailModel.phone}/?text=${Uri.parse(_presetText)}';
                } else {
                  // add the [https]
                  _url =
                      'https://api.whatsapp.com/send?phone=${emailModel.phone}=${Uri.parse(_presetText)}';
                }
                if (await canLaunch(_url)) {
                  await launch(_url);
                } else {
                  throw 'Could not launch $_url';
                }
              },
              child: Text(
                emailModel.phone!,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            joinValues,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 2,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Application Results',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                statusModel.jobTitle!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                statusModel.companyName!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                statusModel.industry!,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  statusIcon,
                  SizedBox(width: 5),
                  statusColor,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
