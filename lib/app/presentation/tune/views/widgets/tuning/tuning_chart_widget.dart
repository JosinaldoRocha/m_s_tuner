import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/presentation/tune/views/widgets/tuning/tuning_chart_item_widget.dart';

class TuningChartWidget extends StatefulWidget {
  const TuningChartWidget({super.key});

  @override
  State<TuningChartWidget> createState() => _TuningChartWidgetState();
}

class _TuningChartWidgetState extends State<TuningChartWidget> {
  final containerList = [
    const TuningChartItemWidget(),
    const TuningChartItemWidget(height: 86),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(height: 86),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(height: 180),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(height: 86),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(),
    const TuningChartItemWidget(height: 86),
    const TuningChartItemWidget(),
  ];

  PageController pageController = PageController(
    viewportFraction: 0.05,
    initialPage: 9,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Center(child: containerList[index]),
        itemCount: containerList.length,
      ),
    );
  }
}
