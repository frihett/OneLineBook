import 'package:flutter/material.dart';


final List<String> entries = <String>['A', 'B', 'C', 'd', 'e', 'f', 'g'];

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('랭킹'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('책제목'), Text('내용'), Text('리뷰')],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
