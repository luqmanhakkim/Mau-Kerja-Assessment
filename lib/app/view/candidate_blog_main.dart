import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mau_kerja_assessment/app/bloc/candidate_blog_bloc.dart';
import 'package:mau_kerja_assessment/app/models/candidates_model.dart';
import 'package:mau_kerja_assessment/app/view/blog_detail_screen.dart';

import '../../widget/blog_list.dart';
import '../../widget/candidate_box.dart';
import '../../widget/candidate_list_box.dart';
import '../models/blog_model.dart';

class CandidateBlogMain extends StatefulWidget {
  const CandidateBlogMain({Key? key}) : super(key: key);

  @override
  State<CandidateBlogMain> createState() => _CandidateBlogMainState();
}

class _CandidateBlogMainState extends State<CandidateBlogMain> {
  @override
  void initState() {
    super.initState();
    context.read<CandidateBlogBloc>().add(
          CandidateBlogFetchAllCandidates(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CandBlog ',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.local_fire_department_sharp,
              color: Colors.orange,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CandidateBlogBloc, CandidateBlogState>(
        builder: (context, state) {
          var candidatesList = <CandidatesModel>[];
          var blogList = <Blog>[];
          CandidatesModel? matchCandidate;
          Blog? matchBlog;

          if (state is CandidateBlogSuccess) {
            candidatesList = state.candidatesModel;
            blogList = state.blogModel;
            matchCandidate = state.matchCandidate;
            matchBlog = state.matchBlog;
          }

          if (state is CandidateBlogLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueGrey, width: 2),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Name / Blog Title / User Title',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (v) {
                      context.read<CandidateBlogBloc>().add(
                            CandidateBlogUpdateSearch(value: v),
                          );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Candidates'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (matchCandidate == null)
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: candidatesList.length,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return CandidateBox(
                      candidatesModel: candidatesList[index],
                    );
                  },
                )
              else
                CandidateBox(
                  candidatesModel: matchCandidate,
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Blogs'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (matchBlog == null)
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: blogList.length,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return BlogList(blogList: blogList[index]);
                  },
                )
              else
                BlogList(blogList: matchBlog),
            ],
          );
        },
      ),
    );
  }
}
