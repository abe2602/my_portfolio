import 'package:flutter/material.dart';
import 'package:portfolio_v2/data/work_rds.dart';
import 'package:portfolio_v2/data/work_rm.dart';

class WorkRepository {
  const WorkRepository({
    @required this.workRDS,
  })  : assert(workRDS != null);

  final WorkRDS workRDS;

  Future<List<WorkRM>> getWorkList() => workRDS.getWorkList();
}