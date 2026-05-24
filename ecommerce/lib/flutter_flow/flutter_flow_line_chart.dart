import 'package:flutter/material.dart';

class FlutterFlowLineChart extends StatelessWidget {
  const FlutterFlowLineChart({
    Key? key,
    required this.data,
    this.width,
    this.height,
    this.backgroundColor = Colors.white,
    this.showAxis = true,
    this.axisColor = Colors.black,
    this.axisWidth = 1.0,
    this.gridColor = Colors.grey,
    this.gridWidth = 0.5,
    this.showGrid = true,
  }) : super(key: key);

  final FFLineChartData data;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final bool showAxis;
  final Color axisColor;
  final double axisWidth;
  final Color gridColor;
  final double gridWidth;
  final bool showGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Center(child: Text('Chart Placeholder')),
    );
  }
}

class FFLineChartData {
  const FFLineChartData({
    required this.lineBarsData,
    this.xData,
    this.titlesData,
    this.chartStylingInfo,
    this.rangeX,
    this.rangeY,
  });

  final List<LineChartBarData> lineBarsData;
  final List<double>? xData;
  final FlTitlesData? titlesData;
  final ChartStylingInfo? chartStylingInfo;
  final AxisBounds? rangeX;
  final AxisBounds? rangeY;
}

class LineChartBarData {
  const LineChartBarData({
    required this.barData,
    this.spots,
    this.color,
    this.isCurved = false,
    this.curveSmoothness = 0.35,
    this.preventCurveOverShooting = false,
    this.preventCurveOvershootingThreshold = 10.0,
    this.show = true,
    this.dotData,
    this.belowBarData,
    this.aboveBarData,
  });

  final List<FlSpot>? spots;
  final Color? color;
  final bool isCurved;
  final double curveSmoothness;
  final bool preventCurveOverShooting;
  final double preventCurveOvershootingThreshold;
  final bool show;
  final FlDotData? dotData;
  final BarAreaData? belowBarData;
  final BarAreaData? aboveBarData;
  final BarData barData;
}

class BarData {
  const BarData({
    this.color = Colors.blue,
    this.width = 2.0,
  });

  final Color color;
  final double width;
}

class FlSpot {
  const FlSpot(this.x, this.y);

  final double x;
  final double y;
}

class FlDotData {
  const FlDotData({this.show = true});

  final bool show;
}

class BarAreaData {
  const BarAreaData({
    this.show = false,
    this.color,
    this.gradient,
  });

  final bool show;
  final Color? color;
  final Gradient? gradient;
}

class FlTitlesData {
  const FlTitlesData({
    this.show = true,
    this.bottomTitles,
    this.leftTitles,
    this.rightTitles,
    this.topTitles,
  });

  final bool show;
  final AxisTitles? bottomTitles;
  final AxisTitles? leftTitles;
  final AxisTitles? rightTitles;
  final AxisTitles? topTitles;
}

class AxisTitles {
  const AxisTitles({
    this.axisNameSize = 14.0,
    this.axisNameWidget,
    this.sideTitles,
  });

  final double axisNameSize;
  final Widget? axisNameWidget;
  final SideTitles? sideTitles;
}

class SideTitles {
  const SideTitles({
    this.showTitles = true,
    this.getTitlesWidget,
    this.interval = 1.0,
    this.reservedSize = 22.0,
  });

  final bool showTitles;
  final GetTitleWidgetFunction? getTitlesWidget;
  final double interval;
  final double reservedSize;
}

typedef GetTitleWidgetFunction = Widget Function(double value, TitleMeta meta);

class TitleMeta {
  const TitleMeta({
    required this.min,
    required this.max,
    required this.appliedInterval,
    required this.sideTitles,
  });

  final double min;
  final double max;
  final double appliedInterval;
  final SideTitles sideTitles;
}

class ChartStylingInfo {
  const ChartStylingInfo({
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
    this.showBorder = false,
    this.axisColor = Colors.black,
    this.axisWidth = 1.0,
    this.showAxis = true,
    this.gridColor = Colors.grey,
    this.gridWidth = 0.5,
    this.showGrid = true,
  });

  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final bool showBorder;
  final Color axisColor;
  final double axisWidth;
  final bool showAxis;
  final Color gridColor;
  final double gridWidth;
  final bool showGrid;
}

class AxisBounds {
  const AxisBounds({
    this.min,
    this.max,
  });

  final double? min;
  final double? max;
}