import 'package:flutter/cupertino.dart';
import 'package:portfolio_v2/data/work_repository.dart';
import 'package:portfolio_v2/presentation/work_list/work_list_models.dart';
import 'package:rxdart/rxdart.dart';

class WorkListBloc {
  WorkListBloc({
    @required this.repository,
  }) : assert(repository != null) {
    MergeStream([
      _getWorkList(),
    ]).listen(_onNewStateSubject.add);
  }

  final _onNewStateSubject = BehaviorSubject<WorkListResponseState>();
  final WorkRepository repository;

  Stream<WorkListResponseState> get onNewState => _onNewStateSubject;

  Stream<WorkListResponseState> _getWorkList() async* {
    yield Loading();

    try {
      var workListRM = await repository.getWorkList();
      var workList = workListRM.map(
        (workRM) => Work(
          title: workRM.title,
          description: workRM.description,
          date: workRM.date,
          imageUrl: workRM.imageUrl,
          workUrl: workRM.workUrl,
          author: workRM.author,
        ),
      ).toList();
      yield Success(
        workList,
      );
    } catch (error) {
      print(error);
      yield GenericError();
    }
  }

  void dispose() {
    _onNewStateSubject.close();
  }
}
