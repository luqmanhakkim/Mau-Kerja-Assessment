import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mau_kerja_assessment/app/bloc/candidate_blog_bloc.dart';
import 'package:mau_kerja_assessment/app/models/emails_model.dart';

import '../../widget/candidate_detail_content.dart';
import '../models/models.dart';

class CandidateDetailScreen extends StatefulWidget {
  const CandidateDetailScreen({
    Key? key,
    required this.name,
    required this.images,
    required this.id,
  }) : super(key: key);

  final String name;
  final String images;
  final int id;

  @override
  State<CandidateDetailScreen> createState() => _CandidateDetailScreenState();
}

class _CandidateDetailScreenState extends State<CandidateDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CandidateBlogBloc>().add(
          CandidateBlogFetchEmailStatusAddress(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Application Status'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<CandidateBlogBloc, CandidateBlogState>(
        builder: (context, state) {
          var emailList = <EmailModel>[];
          var addressList = <Address>[];
          var statusList = <Status>[];

          if (state is CandidateBlogSuccess) {
            emailList = state.emailModel;
            addressList = state.addressModel;
            statusList = state.statusModel;
          }

          if (state is CandidateBlogLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              itemCount: emailList.length,
              itemBuilder: (context, index) {
                Widget createStatusIcon() {
                  if (statusList[index].status == 'Hired') {
                    return Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                    );
                  } else if (statusList[index].status == 'Rejected') {
                    return Icon(
                      Icons.cancel,
                      color: Colors.red,
                    );
                  } else if (statusList[index].status == 'KIV') {
                    return Icon(
                      Icons.alarm,
                      color: Colors.grey,
                    );
                  } else {
                    return Icon(
                      Icons.thumb_up,
                      color: Colors.orange,
                    );
                  }
                }

                Widget createStatusColor() {
                  if (statusList[index].status == 'Hired') {
                    return Text(
                      statusList[index].status!,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
                  } else if (statusList[index].status == 'Rejected') {
                    return Text(
                      statusList[index].status!,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
                  } else if (statusList[index].status == 'KIV') {
                    return Text(
                      statusList[index].status!,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
                  } else {
                    return Text(
                      statusList[index].status!,
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
                  }
                }

                if (widget.id == emailList[index].id &&
                    widget.id == addressList[index].id &&
                    widget.id == statusList[index].id) {
                  return CandidateDetailContent(
                    emailModel: emailList[index],
                    addressModel: addressList[index],
                    statusModel: statusList[index],
                    image: widget.images,
                    name: widget.name,
                    statusIcon: createStatusIcon(),
                    statusColor: createStatusColor(),
                  );
                }
                return Container();
              });
        },
      ),
    );
  }
}
