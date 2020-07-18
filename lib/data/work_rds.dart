import 'dart:io';

import 'package:portfolio_v2/data/work_rm.dart';

class WorkRDS {
  Future<List<WorkRM>> getWorkList() {
    final workList = <WorkRM>[];
    for (var i = 0; i < 100; i++) {
      workList.add(WorkRM(
        title: 'Gaming During the Pandemic '
            'Is Starting to Feel Like Work',
        description: 'And that’s not a bad thing',
        author: 'Bruno Abe',
        date: 'Jul 7',
        imageUrl: 'images/poster.jpg',
        workUrl: 'https://stackoverflow.com/questions/ask',
      ));
    }

    return Future.value(workList);
  }
}