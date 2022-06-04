import 'package:flutter/material.dart';
import 'package:mau_kerja_assessment/app/view/candidate_detail_screen.dart';

class CandidateListBox extends StatelessWidget {
  const CandidateListBox({
    Key? key,
    required this.name,
    required this.birthday,
    required this.photos,
    required this.gender,
    required this.expired,
    required this.genderIcon,
    required this.id,
  }) : super(key: key);

  final String name;
  final String birthday;
  final String photos;
  final String gender;
  final String expired;
  final Widget genderIcon;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CandidateDetailScreen(
                  name: name,
                  images: photos,
                  id: id,
                ),
              ),
            );
      },
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(photos, scale: 40),
              radius: 40,
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      genderIcon,
                      SizedBox(width: 10,),
                      Text(
                        gender.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.cake,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        birthday,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(
                        Icons.warning,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Expired: $expired',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
            )
          ],
        ),
      ),
    );
  }
}
