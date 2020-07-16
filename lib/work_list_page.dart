import 'dart:js' as js;

import 'package:flutter/material.dart';

class WorkListPage extends StatelessWidget {
  const WorkListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _ArticleList();

}

class _ArticleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = <int>[];

    for (var i = 0; i < 100; i++) {
      articles.add(i);
    }

    return Container(
      color: Colors.white70,
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) => _ArticleCard(
          index: index,
        ),
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  const _ArticleCard({@required this.index}) : assert(index != null);

  final int index;

  @override
  Widget build(BuildContext context) {
    const imageUrl = 'images/poster.jpg';
    return InkWell(
      child: Card(
        color: const Color(0xFFF5F5F5),
        elevation: 2,
        child: InkWell(
          onTap: () {
            js.context.callMethod(
                "open", ["https://stackoverflow.com/questions/ask"]);
          },
          child: Container(
            height: 150,
            child: Row(
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gaming During the Pandemic '
                          'Is Starting to Feel Like Work',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'And that’s not a bad thing',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Bruno Abe',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Jul 7',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
