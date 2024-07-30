import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled9/config/ui_style/ui_style.dart';
import 'package:untitled9/presentation/tap/review_search/review_page_view_model.dart';

import '../../../domain/model/post.dart';

final List<String> entries = <String>['A', 'B', 'C'];

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<ReviewPageViewModel>();

    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text('리뷰 검색'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 300,
                    child: TextFormField(
                      onTap: () {},
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffD7D7D7),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        hintText: '리뷰 검색하기',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot<Post>>(
                    stream: model.postsStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('알 수 없는 에러');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      List<Post> posts =
                          snapshot.data!.docs.map((e) => e.data()).toList();

                      return ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: posts.length,
                          itemBuilder: (BuildContext context, int index) {
                            final post = posts[index];
                            return Container(
                              margin: EdgeInsets.only(
                                  right: 16, left: 16, bottom: 16, top: 16),
                              decoration: BoxDecoration(
                                  color: UiStyle.secondaryColorSurface,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                    color: UiStyle.primaryColor,
                                    width: 2.0,
                                  )),
                              padding: EdgeInsets.all(16),
                              height: 250,
                              child: Column(
                                children: [
                                  post.imageUrl.isEmpty == false
                                      ? Image.network(
                                          post.imageUrl,
                                          height: 130,
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(
                                          Icons.image_not_supported,
                                          size: 130,
                                        ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    post.title,
                                    // style: UiStyle.h1Style,
                                    // style: UiStyle.h2Style,
                                    // style: UiStyle.h3Style,
                                    style: UiStyle.h4Style,
                                    // style: UiStyle.bodyStyle,
                                    // style: UiStyle.smallStyle,
                                    // style: UiStyle.extraSmallStyle,

                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Container(

                                    child: Text(
                                      '한줄평 - ${post.review}',
                                      style: UiStyle.bodyStyle,
                                    ),
                                    decoration: BoxDecoration(

                                      color:Colors.white,
                                        border: Border.all(
                                      color: Colors.white,
                                    )),
                                    width: 400,
                                    height:49 ,
                                    padding: EdgeInsets.only(left: 8,right: 8),
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
              )
            ],
          ),
        ));
  }
}
