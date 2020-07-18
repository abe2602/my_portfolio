import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:portfolio_v2/async_snapshot_response_view.dart';
import 'package:portfolio_v2/data/work_repository.dart';
import 'package:portfolio_v2/presentation/work_list/work_list_bloc.dart';
import 'package:portfolio_v2/presentation/work_list/work_list_models.dart';
import 'package:provider/provider.dart';

class WorkListPage extends StatelessWidget {
  const WorkListPage({@required this.bloc, Key key}) : super(key: key);
  final WorkListBloc bloc;

  static Widget create(BuildContext context) =>
      ProxyProvider<WorkRepository, WorkListBloc>(
        update: (context, repository, _) => WorkListBloc(
          repository: repository,
        ),
        child: Consumer<WorkListBloc>(
          builder: (context, bloc, _) => WorkListPage(
            bloc: bloc,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: bloc.onNewState,
    builder: (context, snapshot) => AsyncSnapshotResponseView<Loading, Error, Success>(
      snapshot: snapshot,
      successWidgetBuilder: (successState) => _ArticleList(workList: successState.workList,),
      errorWidgetBuilder: (errorState) => Text(errorState.toString()),
    ),
  );
}

class _ArticleList extends StatelessWidget {
  const _ArticleList({@required this.workList}) : assert(workList != null);
  final workList;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: ListView.builder(
        itemCount: workList.length,
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
        color: Colors.white70,
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
