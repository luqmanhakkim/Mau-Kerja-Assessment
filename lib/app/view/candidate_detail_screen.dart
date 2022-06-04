import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mau_kerja_assessment/app/bloc/candidate_blog_bloc.dart';

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
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          iconSize: 40,
          onPressed: () {
            Navigator.of(context).pop();
            context.read<CandidateBlogBloc>().add(
                  CandidateBlogFetchAllCandidates(),
                );
          },
        ),
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

          return ListView.builder(
              itemCount: emailList.length,
              itemBuilder: (context, index) {
                if (widget.id == emailList[index].id &&
                    widget.id == addressList[index].id &&
                    widget.id == statusList[index].id) {
                  return CandidateDetailContent(
                    emailModel: emailList[index],
                    addressModel: addressList[index],
                    statusModel: statusList[index],
                    image: widget.images,
                    name: widget.name,
                  );
                }
                return Container();
              });
        },
      ),
    );
  }
}
