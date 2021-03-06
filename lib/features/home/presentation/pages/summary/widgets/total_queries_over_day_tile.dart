import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutterhole/core/models/failures.dart';
import 'package:flutterhole/features/home/presentation/pages/summary/widgets/line_chart_scaffold.dart';
import 'package:flutterhole/features/home/presentation/pages/summary/widgets/total_queries_over_day_line_chart.dart';
import 'package:flutterhole/features/pihole_api/data/models/over_time_data.dart';
import 'package:flutterhole/widgets/layout/indicators/failure_indicators.dart';

class TotalQueriesOverDayTile extends StatelessWidget {
  const TotalQueriesOverDayTile(
    this.queriesOverTimeResult, {
    Key key,
  }) : super(key: key);

  final Either<Failure, OverTimeData> queriesOverTimeResult;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LineChartScaffold(
        title: 'Total queries over last 24 hours',
        lineChart: queriesOverTimeResult.fold<Widget>(
          (failure) => CenteredFailureIndicator(failure),
          (overTimeData) {
            return SafeArea(
                minimum: EdgeInsets.only(right: 20.0),
                child: TotalQueriesOverDayLineChart(overTimeData));
          },
        ),
      ),
    );
  }
}
