import 'package:flutter/material.dart';
import 'package:portfolio_v2/data/work_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'data/work_rds.dart';

class GeneralProvider extends StatelessWidget {
  const GeneralProvider({
    @required this.child,
  }) : assert(child != null);

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ..._buildRDSProviders(),
      ..._buildRepositoryProviders(),
    ],
    child: child,
  );

  List<SingleChildWidget> _buildRDSProviders() => [
    Provider<WorkRDS>(
      create: (_) => WorkRDS(),
    ),
  ];

  List<SingleChildWidget> _buildRepositoryProviders() => [
    ProxyProvider<WorkRDS, WorkRepository>(
      update: (context, workRDS, _) => WorkRepository(
        workRDS: workRDS
      ),
    ),
  ];

}