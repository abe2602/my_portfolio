import 'package:flutter/material.dart';

abstract class WorkListResponseState {}

class Success implements WorkListResponseState {
  const Success(
    this.workList,
  );

  final List<Work> workList;
}

class Work {
  const Work({
    @required this.title,
    @required this.description,
    @required this.author,
    @required this.date,
    @required this.imageUrl,
    @required this.workUrl,
  })  : assert(title != null),
        assert(description != null),
        assert(author != null),
        assert(date != null),
        assert(workUrl != null),
        assert(imageUrl != null);
  final String title;
  final String description;
  final String author;
  final String date;
  final String imageUrl;
  final String workUrl;
}

class Loading implements WorkListResponseState {}

class Error implements WorkListResponseState {}

class NoInternetError implements Error {}

class GenericError implements Error {}
