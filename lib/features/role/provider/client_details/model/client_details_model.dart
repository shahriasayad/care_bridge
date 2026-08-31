class ClientDetailsModel {
  final String name;
  final String status;
  final double healthScore;
  final String provider;
  final String lastActive;
  final String goal;
  final String healthId;
  final List<CoreMetricModel> coreMetrics;
  final List<TrendModel> trends;
  final List<ScoreModel> healthScores;
  final AnalyticsModel mentalWellness;
  final AnalyticsModel activityFitness;
  final AnalyticsModel sleepRecovery;
  final AnalyticsModel nutrition;
  final List<SymptomModel> symptoms;
  final List<HabitModel> habits;
  final List<ScoreModel> compliance;
  final List<HistoryEventModel> historyTimeline;
  final BookingInfoModel bookingInfo;
  final BarChartDataModel dailyCaloriesBarChart;
  final List<LineChartDataModel> trendCharts;
  final NutritionDataModel? nutritionTabData;

  ClientDetailsModel({
    required this.name,
    required this.status,
    required this.healthScore,
    required this.provider,
    required this.lastActive,
    required this.goal,
    required this.healthId,
    required this.coreMetrics,
    required this.trends,
    required this.healthScores,
    required this.mentalWellness,
    required this.activityFitness,
    required this.sleepRecovery,
    required this.nutrition,
    required this.symptoms,
    required this.habits,
    required this.compliance,
    required this.historyTimeline,
    required this.bookingInfo,
    required this.dailyCaloriesBarChart,
    required this.trendCharts,
    this.nutritionTabData,
  });

  factory ClientDetailsModel.fromJson(Map<String, dynamic> json) {
    return ClientDetailsModel(
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      healthScore: (json['healthScore'] ?? 0).toDouble(),
      provider: json['provider'] ?? '',
      lastActive: json['lastActive'] ?? '',
      goal: json['goal'] ?? '',
      healthId: json['healthId'] ?? '',
      coreMetrics: (json['coreMetrics'] as List?)?.map((i) => CoreMetricModel.fromJson(i)).toList() ?? [],
      trends: (json['trends'] as List?)?.map((i) => TrendModel.fromJson(i)).toList() ?? [],
      healthScores: (json['healthScores'] as List?)?.map((i) => ScoreModel.fromJson(i)).toList() ?? [],
      mentalWellness: AnalyticsModel.fromJson(json['mentalWellness'] ?? {}),
      activityFitness: AnalyticsModel.fromJson(json['activityFitness'] ?? {}),
      sleepRecovery: AnalyticsModel.fromJson(json['sleepRecovery'] ?? {}),
      nutrition: AnalyticsModel.fromJson(json['nutrition'] ?? {}),
      symptoms: (json['symptoms'] as List?)?.map((i) => SymptomModel.fromJson(i)).toList() ?? [],
      habits: (json['habits'] as List?)?.map((i) => HabitModel.fromJson(i)).toList() ?? [],
      compliance: (json['compliance'] as List?)?.map((i) => ScoreModel.fromJson(i)).toList() ?? [],
      historyTimeline: (json['historyTimeline'] as List?)?.map((i) => HistoryEventModel.fromJson(i)).toList() ?? [],
      bookingInfo: BookingInfoModel.fromJson(json['bookingInfo'] ?? {}),
      dailyCaloriesBarChart: BarChartDataModel.fromJson(json['dailyCaloriesBarChart'] ?? {}),
      trendCharts: (json['trendCharts'] as List?)?.map((i) => LineChartDataModel.fromJson(i)).toList() ?? [],
      nutritionTabData: json['nutritionTabData'] != null ? NutritionDataModel.fromJson(json['nutritionTabData']) : null,
    );
  }
}

class CoreMetricModel {
  final String title;
  final String value;
  final String goalText;
  final double percent;

  CoreMetricModel({
    required this.title,
    required this.value,
    required this.goalText,
    required this.percent,
  });

  factory CoreMetricModel.fromJson(Map<String, dynamic> json) {
    return CoreMetricModel(
      title: json['title'] ?? '',
      value: json['value'] ?? '',
      goalText: json['goalText'] ?? '',
      percent: (json['percent'] ?? 0).toDouble(),
    );
  }
}

class TrendModel {
  final String title;
  final String change;
  final String comparison;

  TrendModel({
    required this.title,
    required this.change,
    required this.comparison,
  });

  factory TrendModel.fromJson(Map<String, dynamic> json) {
    return TrendModel(
      title: json['title'] ?? '',
      change: json['change'] ?? '',
      comparison: json['comparison'] ?? '',
    );
  }
}

class ScoreModel {
  final String title;
  final int score;

  ScoreModel({
    required this.title,
    required this.score,
  });

  factory ScoreModel.fromJson(Map<String, dynamic> json) {
    return ScoreModel(
      title: json['title'] ?? '',
      score: json['score'] ?? 0,
    );
  }
}

class AnalyticsModel {
  final Map<String, String> stats;

  AnalyticsModel({required this.stats});

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, String> mappedStats = {};
    json.forEach((key, value) {
      mappedStats[key] = value.toString();
    });
    return AnalyticsModel(stats: mappedStats);
  }
}

class SymptomModel {
  final String title;
  final String value;
  final double percent;
  final String color;

  SymptomModel({
    required this.title,
    required this.value,
    required this.percent,
    required this.color,
  });

  factory SymptomModel.fromJson(Map<String, dynamic> json) {
    return SymptomModel(
      title: json['title'] ?? '',
      value: json['value'] ?? '',
      percent: (json['percent'] ?? 0).toDouble(),
      color: json['color'] ?? '',
    );
  }
}

class HabitModel {
  final String title;
  final double percent;
  final String status;
  final bool large;
  final String color;

  HabitModel({
    required this.title,
    required this.percent,
    required this.status,
    required this.large,
    required this.color,
  });

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      title: json['title'] ?? '',
      percent: (json['percent'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      large: json['large'] ?? false,
      color: json['color'] ?? '',
    );
  }
}

class HistoryEventModel {
  final String date;
  final String title;
  final String description;

  HistoryEventModel({
    required this.date,
    required this.title,
    required this.description,
  });

  factory HistoryEventModel.fromJson(Map<String, dynamic> json) {
    return HistoryEventModel(
      date: json['date'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class BookingInfoModel {
  final String status;
  final String service;
  final String date;
  final String time;
  final String total;

  BookingInfoModel({
    required this.status,
    required this.service,
    required this.date,
    required this.time,
    required this.total,
  });

  factory BookingInfoModel.fromJson(Map<String, dynamic> json) {
    return BookingInfoModel(
      status: json['status'] ?? '',
      service: json['service'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      total: json['total'] ?? '',
    );
  }
}

class BarChartDataModel {
  final String title;
  final double target;
  final List<BarDataPoint> data;

  BarChartDataModel({
    required this.title,
    required this.target,
    required this.data,
  });

  factory BarChartDataModel.fromJson(Map<String, dynamic> json) {
    return BarChartDataModel(
      title: json['title'] ?? '',
      target: (json['target'] ?? 0).toDouble(),
      data: (json['data'] as List?)?.map((i) => BarDataPoint.fromJson(i)).toList() ?? [],
    );
  }
}

class BarDataPoint {
  final String label;
  final double value;
  final bool isAboveTarget;

  BarDataPoint({
    required this.label,
    required this.value,
    required this.isAboveTarget,
  });

  factory BarDataPoint.fromJson(Map<String, dynamic> json) {
    return BarDataPoint(
      label: json['label'] ?? '',
      value: (json['value'] ?? 0).toDouble(),
      isAboveTarget: json['isAboveTarget'] ?? false,
    );
  }
}

class LineChartDataModel {
  final String title;
  final String highestLabel;
  final List<String> yAxisLabels;
  final List<LineDataPoint> data;

  LineChartDataModel({
    required this.title,
    required this.highestLabel,
    required this.yAxisLabels,
    required this.data,
  });

  factory LineChartDataModel.fromJson(Map<String, dynamic> json) {
    return LineChartDataModel(
      title: json['title'] ?? '',
      highestLabel: json['highestLabel'] ?? '',
      yAxisLabels: (json['yAxisLabels'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      data: (json['data'] as List?)?.map((i) => LineDataPoint.fromJson(i)).toList() ?? [],
    );
  }
}

class LineDataPoint {
  final String label;
  final double value;

  LineDataPoint({
    required this.label,
    required this.value,
  });

  factory LineDataPoint.fromJson(Map<String, dynamic> json) {
    return LineDataPoint(
      label: json['label'] ?? '',
      value: (json['value'] ?? 0).toDouble(),
    );
  }
}

class NutritionDataModel {
  final int actualIntake;
  final int dailyTarget;
  final List<NutritionMacroModel> macros;
  final List<QuickInsightModel> quickInsights;
  final List<NutritionKeyMetricModel> keyMetrics;
  final List<MealModel> meals;
  final Map<String, dynamic> weeklyAverages;

  NutritionDataModel({
    required this.actualIntake,
    required this.dailyTarget,
    required this.macros,
    required this.quickInsights,
    required this.keyMetrics,
    required this.meals,
    required this.weeklyAverages,
  });

  factory NutritionDataModel.fromJson(Map<String, dynamic> json) {
    return NutritionDataModel(
      actualIntake: json['actualIntake'] ?? 0,
      dailyTarget: json['dailyTarget'] ?? 0,
      macros: (json['macros'] as List?)?.map((i) => NutritionMacroModel.fromJson(i)).toList() ?? [],
      quickInsights: (json['quickInsights'] as List?)?.map((i) => QuickInsightModel.fromJson(i)).toList() ?? [],
      keyMetrics: (json['keyMetrics'] as List?)?.map((i) => NutritionKeyMetricModel.fromJson(i)).toList() ?? [],
      meals: (json['meals'] as List?)?.map((i) => MealModel.fromJson(i)).toList() ?? [],
      weeklyAverages: json['weeklyAverages'] ?? {},
    );
  }
}

class NutritionMacroModel {
  final String title;
  final String valueText;
  final String scoreText;
  final double percent;

  NutritionMacroModel({
    required this.title,
    required this.valueText,
    required this.scoreText,
    required this.percent,
  });

  factory NutritionMacroModel.fromJson(Map<String, dynamic> json) {
    return NutritionMacroModel(
      title: json['title'] ?? '',
      valueText: json['valueText'] ?? '',
      scoreText: json['scoreText'] ?? '',
      percent: (json['percent'] ?? 0).toDouble(),
    );
  }
}

class QuickInsightModel {
  final String title;
  final String value;
  final String subtitle;
  final String iconType;

  QuickInsightModel({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.iconType,
  });

  factory QuickInsightModel.fromJson(Map<String, dynamic> json) {
    return QuickInsightModel(
      title: json['title'] ?? '',
      value: json['value'] ?? '',
      subtitle: json['subtitle'] ?? '',
      iconType: json['iconType'] ?? '',
    );
  }
}

class NutritionKeyMetricModel {
  final String title;
  final double percent;
  final String rightText;

  NutritionKeyMetricModel({
    required this.title,
    required this.percent,
    required this.rightText,
  });

  factory NutritionKeyMetricModel.fromJson(Map<String, dynamic> json) {
    return NutritionKeyMetricModel(
      title: json['title'] ?? '',
      percent: (json['percent'] ?? 0).toDouble(),
      rightText: json['rightText'] ?? '',
    );
  }
}

class MealModel {
  final String title;
  final String stats;
  final String scoreText;
  final String imagePath;

  MealModel({
    required this.title,
    required this.stats,
    required this.scoreText,
    required this.imagePath,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      title: json['title'] ?? '',
      stats: json['stats'] ?? '',
      scoreText: json['scoreText'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}
