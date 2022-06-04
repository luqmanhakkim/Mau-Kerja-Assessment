import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../app/models/blog_model.dart';
import '../app/view/blog_detail_screen.dart';

class BlogList extends StatelessWidget {
  const BlogList({
    Key? key,
    required this.blogList,
  }) : super(key: key);

  final Blog blogList;

  @override
  Widget build(BuildContext context) {
    final DateTime timeStamp =
        DateTime.fromMillisecondsSinceEpoch(blogList.createAt! * 10);

    final String formattedCreateAt = DateFormat('dd-MM-yyyy').format(timeStamp);
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(blogList.photo!),
            radius: 40,
          ),
          title: Text(
            blogList.title!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            blogList.subTitle!,
            textAlign: TextAlign.justify,
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogDetailScreen(
                    title: blogList.title!,
                    content: blogList.content!,
                    author: blogList.author!,
                    create_at: formattedCreateAt,
                    tags: blogList.tag!,
                    image: blogList.photo!),
              ),
            );
          },
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
