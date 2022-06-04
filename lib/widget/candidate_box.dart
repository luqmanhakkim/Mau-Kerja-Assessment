import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../app/models/candidates_model.dart';
import 'candidate_list_box.dart';

class CandidateBox extends StatelessWidget {
  const CandidateBox({
    Key? key,
    required this.candidatesModel,
  }) : super(key: key);

  final CandidatesModel candidatesModel;

  @override
  Widget build(BuildContext context) {
    final DateTime timeStamp =
        DateTime.fromMillisecondsSinceEpoch(candidatesModel.birthday * 10);
    final String formattedBirthday = DateFormat('dd-MM-yyyy').format(timeStamp);
    final String formattedExpiryDate =
        DateFormat('dd-MM-yyyy').format(timeStamp);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CandidateListBox(
          id: candidatesModel.id,
          name: candidatesModel.name,
          birthday: formattedBirthday,
          photos: candidatesModel.photo,
          gender: candidatesModel.gender,
          expired: formattedExpiryDate,
          genderIcon: candidatesModel.gender == 'm'
              ? Icon(
                  Icons.male,
                  size: 15,
                  color: Colors.blue,
                )
              : Icon(
                  Icons.female,
                  size: 15,
                  color: Colors.pink,
                ),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
