import 'package:get/get.dart';
import 'package:care_bridge/features/role/provider/client_details/model/client_details_model.dart';

class ClientDetailsController extends GetxController {
  final RxString selectedTab = 'Overview'.obs;

  // Section: Core Data State
  // Data Source: _fetchClientData (Mock API)
  // State: clientData (Reactive ClientDetailsModel)
  final Rx<ClientDetailsModel?> clientData = Rx<ClientDetailsModel?>(null);

  // LIFECYCLE & DATA FETCHING

  @override
  void onInit() {
    super.onInit();
    _fetchClientData();
  }

  // Helper: Data Fetcher
  // Purpose: Simulates an API call and populates clientData
  void _fetchClientData() {
    // Simulating an API response mapping to the model
    final mockJsonResponse = {
      'name': 'Sarah Johnson',
      'status': 'Improving',
      'healthScore': 87,
      'provider': 'Dr. Emily Chen',
      'lastActive': '2 hours ago',
      'goal': 'Weight Loss, Sleep',
      'healthId': '#GRV-8842',
      'coreMetrics': [
        {
          'title': 'Steps',
          'value': '8,432',
          'goalText': '10k goal',
          'percent': 0.84,
        },
        {
          'title': 'Calories',
          'value': '1,850',
          'goalText': '2.2k goal',
          'percent': 0.84,
        },
        {
          'title': 'Water',
          'value': '64oz',
          'goalText': '80oz goal',
          'percent': 0.8,
        },
        {
          'title': 'Sleep',
          'value': '6h 15m',
          'goalText': '8h goal',
          'percent': 0.78,
        },
      ],
      'trends': [
        {'title': 'Weight', 'change': '-1.2 lbs', 'comparison': 'vs last week'},
        {
          'title': 'Calories',
          'change': '+150 kcal',
          'comparison': 'vs yesterday',
        },
        {'title': 'Sleep', 'change': '+45 min', 'comparison': 'vs last week'},
        {'title': 'HRV', 'change': '+12 ms', 'comparison': 'vs baseline'},
      ],
      'healthScores': [
        {'title': 'Physical Health', 'score': 91},
        {'title': 'Activity', 'score': 91},
        {'title': 'Sleep', 'score': 74},
        {'title': 'Mental Wellness', 'score': 74},
        {'title': 'Recovery', 'score': 74},
        {'title': 'Hydration', 'score': 74},
        {'title': 'Medication Adherence', 'score': 74},
        {'title': 'Consistency', 'score': 74},
      ],
      'mentalWellness': {
        'Mood Average': '7.8 / 10',
        'Stress Level': '6.4 / 10',
        'Anxiety Rating': '4.2 / 10',
        'Energy Rating': '7.1 / 10',
        'Motivation Score': '4.2 / 10',
        'Burnout Risk': 'Low',
      },
      'activityFitness': {
        'Average Steps': '8,312/day',
        'Exercise Sessions': '3.4/week',
        'Active Minutes': '267/week',
        'Calories Burned': '2,415/week',
        'Resting Heart Rate': '63 bpm',
        'Heart Rate Variability': '42 ms',
      },
      'sleepRecovery': {
        'Average Sleep': '6h 23m',
        'Goal': '8h',
        'Sleep Consistency': '68%',
        'Sleep Quality': '72%',
        'Wake Events': '2.1/night',
        'Recovery Score': '81/100',
      },
      'nutrition': {
        'Calories': '1,725/day',
        'Protein': '112g/day',
        'Carbohydrates': '165g/day',
        'Fat': '61g/day',
        'Fiber': '18g/day',
        'Water': '82 oz/day',
      },
      'symptoms': [
        {
          'title': 'Fatigue',
          'value': 'Moderate',
          'percent': 0.5,
          'color': 'orange',
        },
        {
          'title': 'Headaches',
          'value': '2/wk',
          'percent': 0.3,
          'color': 'purple',
        },
        {
          'title': 'Brain Fog',
          'value': 'Mild',
          'percent': 0.2,
          'color': 'blue',
        },
        {'title': 'Pain', 
        'value': 'Low',
         'percent': 0.15, 
         'color': 'brown'},
        {
          'title': 'Digestion',
          'value': 'Rare',
          'percent': 0.8,
          'color': 'green',
        },
      ],
      'habits': [
        {
          'title': 'Protein Breakfast',
          'percent': 0.8,
          'status': 'Good',
          'large': true,
          'color': 'red',
        },
        {
          'title': 'Water Goal',
          'percent': 0.8,
          'status': 'Good',
          'large': true,
          'color': 'cyan',
        },
        {
          'title': 'Daily Walk',
          'percent': 0.8,
          'status': 'Good',
          'large': false,
          'color': 'green',
        },
        {
          'title': 'No Late Night Snacks',
          'percent': 0.8,
          'status': 'Good',
          'large': false,
          'color': 'blue',
        },
        {
          'title': 'Mindfulness',
          'percent': 0.8,
          'status': 'Good',
          'large': false,
          'color': 'purple',
        },
      ],
      'compliance': [
        {'title': 'Medication Adherence', 'score': 71},
        {'title': 'Supplement Adherence', 'score': 95},
        {'title': 'Therapy Attendance', 'score': 92},
        {'title': 'Exercise Prescription Adherence', 'score': 81},
      ],
      'historyTimeline': [
        {
          'date': 'Jan 5',
          'title': 'Joined Grovr',
          'description': 'Weight:185lbs - Score:68',
        },
        {
          'date': 'Jan 18',
          'title': 'Pattern Detected',
          'description': 'All flagged evening overeating behavior',
        },
        {
          'date': 'Feb',
          'title': 'Intervention success',
          'description': 'Proteign+24%.Score 72->79',
        },
      ],
      'bookingInfo': {
        'status': 'Upcoming',
        'service': 'General Consultation',
        'date': 'Sunday, January 1',
        'time': '10:00',
        'total': '\$48',
      },
      'dailyCaloriesBarChart': {
        'title': 'Daily Calories vs Target',
        'target': 1750,
        'data': [
          {'label': 'Mon', 'value': 1650, 'isAboveTarget': false},
          {'label': 'Tue', 'value': 1750, 'isAboveTarget': true},
          {'label': 'Wed', 'value': 1600, 'isAboveTarget': false},
          {'label': 'Thu', 'value': 1650, 'isAboveTarget': false},
          {'label': 'Fri', 'value': 1700, 'isAboveTarget': false},
          {'label': 'Sat', 'value': 1900, 'isAboveTarget': true},
          {'label': 'Sun', 'value': 1600, 'isAboveTarget': false},
        ],
      },
      'trendCharts': [
        {
          'title': 'Daily Calories vs Goals',
          'highestLabel': 'Highest: 94%',
          'yAxisLabels': [
            '0',
            '2.4k',
            '2.4k',
            '2.4k',
            '1.4k',
            '2.4k',
            '2.4k',
            '2.4k',
          ],
          'data': [
            {'label': 'Mon', 'value': 0},
            {'label': 'Tue', 'value': 1.5},
            {'label': 'Wed', 'value': 2.2},
            {'label': 'Thu', 'value': 2.5},
            {'label': 'Fri', 'value': 4.5},
            {'label': 'Sat', 'value': 6.2},
            {'label': 'Sun', 'value': 6.5},
          ],
        },
        {
          'title': 'Weight Trend',
          'highestLabel': 'Highest: 94%',
          'yAxisLabels': ['0', '9', '11', '10', '90', '100', '150'],
          'data': [
            {'label': 'May1', 'value': 0},
            {'label': 'May2', 'value': 1.2},
            {'label': 'May3', 'value': 1.8},
            {'label': 'May4', 'value': 2.0},
            {'label': 'May5', 'value': 3.8},
            {'label': 'May6', 'value': 5.2},
            {'label': 'May7', 'value': 5.5},
          ],
        },
        {
          'title': 'Protein Trend',
          'highestLabel': 'Highest: 94%',
          'yAxisLabels': ['0', '50', '60', '70', '80', '90', '100'],
          'data': [
            {'label': 'May1', 'value': 0},
            {'label': 'May2', 'value': 1.2},
            {'label': 'May3', 'value': 1.8},
            {'label': 'May4', 'value': 2.0},
            {'label': 'May5', 'value': 3.8},
            {'label': 'May6', 'value': 5.2},
            {'label': 'May7', 'value': 5.5},
          ],
        },
        {
          'title': 'Meal Consistency',
          'highestLabel': 'Highest: 94%',
          'yAxisLabels': ['0', '50', '60', '70', '80', '90', '100'],
          'data': [
            {'label': 'May1', 'value': 0},
            {'label': 'May2', 'value': 1.2},
            {'label': 'May3', 'value': 1.8},
            {'label': 'May4', 'value': 2.0},
            {'label': 'May5', 'value': 3.8},
            {'label': 'May6', 'value': 5.2},
            {'label': 'May7', 'value': 5.5},
          ],
        },
        {
          'title': 'Nutrition Score Trend',
          'highestLabel': 'Highest: 94%',
          'yAxisLabels': ['0', '50', '60', '70', '80', '90', '100'],
          'data': [
            {'label': 'May1', 'value': 0},
            {'label': 'May2', 'value': 1.2},
            {'label': 'May3', 'value': 1.8},
            {'label': 'May4', 'value': 2.0},
            {'label': 'May5', 'value': 3.8},
            {'label': 'May6', 'value': 5.2},
            {'label': 'May7', 'value': 5.5},
          ],
        },
        {
          'title': 'Late Night Eating Frequently',
          'highestLabel': 'Highest: 94%',
          'yAxisLabels': ['0', '50', '60', '70', '80', '90', '100'],
          'data': [
            {'label': 'May1', 'value': 0},
            {'label': 'May2', 'value': 1.2},
            {'label': 'May3', 'value': 1.8},
            {'label': 'May4', 'value': 2.0},
            {'label': 'May5', 'value': 3.8},
            {'label': 'May6', 'value': 5.2},
            {'label': 'May7', 'value': 5.5},
          ],
        },
      ],
      'nutritionTabData': {
        'actualIntake': 1842,
        'dailyTarget': 1700,
        'macros': [
          {
            'title': 'Calories',
            'valueText': '1842/1700 kcal',
            'scoreText': '91/100',
            'percent': 0.91,
          },
          {
            'title': 'Protein',
            'valueText': '128g/120g',
            'scoreText': '91/100',
            'percent': 0.91,
          },
          {
            'title': 'Carbohydrates',
            'valueText': '128g/120g',
            'scoreText': '74/100',
            'percent': 0.74,
          },
          {
            'title': 'Fat',
            'valueText': '238g/120g',
            'scoreText': '74/100',
            'percent': 0.74,
          },
          {
            'title': 'Fiber',
            'valueText': '238g/120g',
            'scoreText': '74/100',
            'percent': 0.74,
          },
          {
            'title': 'Water',
            'valueText': '238oz/120oz',
            'scoreText': '74/100',
            'percent': 0.74,
          },
        ],
        'quickInsights': [
          {
            'title': 'Steps',
            'value': '6,820',
            'subtitle': '100% of goal',
            'iconType': 'steps',
          },
          {
            'title': 'Water Intake',
            'value': '96 oz',
            'subtitle': '100% of goal',
            'iconType': 'water',
          },
          {
            'title': 'Evening Snack',
            'value': '68%',
            'subtitle': 'of average',
            'iconType': 'snack',
          },
          {
            'title': 'Highest Hunger',
            'value': '7:45M',
            'subtitle': '8.2/10',
            'iconType': 'hunger',
          },
        ],
        'keyMetrics': [
          {'title': 'Food Logging', 'percent': 0.92, 'rightText': '92%'},
          {'title': 'Protein Goal', 'percent': 0.92, 'rightText': '92%'},
          {'title': 'Water Goal', 'percent': 0.92, 'rightText': '92%'},
          {
            'title': 'Exercise Completions',
            'percent': 0.92,
            'rightText': '92%',
          },
          {
            'title': 'Late night eating',
            'percent': 0.05,
            'rightText': '3 days',
          },
        ],
        'meals': [
          {
            'title': 'Breakfast',
            'stats': '420kcal - 32g protein',
            'scoreText': 'Ai Score: 9/10',
            'imagePath': 'assets/images/meal1.png',
          },
          {
            'title': 'Lunch',
            'stats': '420kcal - 32g protein',
            'scoreText': 'Ai Score: 9/10',
            'imagePath': 'assets/images/meal2.png',
          },
          {
            'title': 'Dinner',
            'stats': '420kcal - 32g protein',
            'scoreText': 'Ai Score: 9/10',
            'imagePath': 'assets/images/meal3.png',
          },
          {
            'title': 'Snack',
            'stats': '420kcal - 32g protein',
            'scoreText': 'Ai Score: 9/10',
            'imagePath': 'assets/images/meal4.png',
          },
        ],
        'weeklyAverages': {
          'calories': 0.32,
          'protein': 0.93,
          'carbs': 0.93,
          'fat': 1.12,
          'fiber': 0.93,
        },
      },
    };

    clientData.value = ClientDetailsModel.fromJson(mockJsonResponse);
  }

  // Section: Profile & Header
  // Widget: ClientDetailsHeader
  // Data Source: clientData (Profile variables)
  // State: Read-only profile details
  String get name => clientData.value?.name ?? '';
  String get status => clientData.value?.status ?? '';
  int get healthScore => clientData.value?.healthScore.toInt() ?? 0;
  String get provider => clientData.value?.provider ?? '';
  String get lastActive => clientData.value?.lastActive ?? '';
  String get goal => clientData.value?.goal ?? '';
  String get healthId => clientData.value?.healthId ?? '';

  // Section: Overview Tab - Core Metrics & Trends
  // Widget: ClientMetricsSection, ScoreProgressRow
  // Data Source: clientData (coreMetrics, trends, healthScores)
  // State: Read-only summary metrics
  List<Map<String, dynamic>> get coreMetrics =>
      clientData.value?.coreMetrics
          .map(
            (e) => {
              'title': e.title,
              'value': e.value,
              'goalText': e.goalText,
              'percent': e.percent,
            },
          )
          .toList() ??
      [];

  List<Map<String, dynamic>> get trends =>
      clientData.value?.trends
          .map(
            (e) => {
              'title': e.title,
              'change': e.change,
              'comparison': e.comparison,
            },
          )
          .toList() ??
      [];

  List<Map<String, dynamic>> get healthScores =>
      clientData.value?.healthScores
          .map((e) => {'title': e.title, 'score': e.score})
          .toList() ??
      [];

  // Section: Overview Tab - Analytics Grids
  // Widget: ClientStatsGrid
  // Data Source: clientData (mentalWellness, activityFitness, sleepRecovery, nutrition)
  // State: Read-only analytics statistics
  Map<String, String> get mentalWellness =>
      clientData.value?.mentalWellness.stats ?? {};
  Map<String, String> get activityFitness =>
      clientData.value?.activityFitness.stats ?? {};
  Map<String, String> get sleepRecovery =>
      clientData.value?.sleepRecovery.stats ?? {};
  Map<String, String> get nutrition => clientData.value?.nutrition.stats ?? {};

  // Section: Overview Tab - Symptoms, Habits, Compliance
  // Widget: ClientSymptomsSection, ClientHabitsSection, ClientComplianceSection
  // Data Source: clientData (symptoms, habits, compliance)
  // State: Read-only tracking lists
  List<Map<String, dynamic>> get symptoms =>
      clientData.value?.symptoms
          .map(
            (e) => {
              'title': e.title,
              'value': e.value,
              'percent': e.percent,
              'color': e.color,
            },
          )
          .toList() ??
      [];

  List<Map<String, dynamic>> get habits =>
      clientData.value?.habits
          .map(
            (e) => {
              'title': e.title,
              'percent': e.percent,
              'status': e.status,
              'large': e.large,
              'color': e.color,
            },
          )
          .toList() ??
      [];

  List<Map<String, dynamic>> get compliance =>
      clientData.value?.compliance
          .map((e) => {'title': e.title, 'score': e.score})
          .toList() ??
      [];

  // Section: History Tab
  // Widget: HistoryTab
  // Data Source: clientData (historyTimeline)
  // State: Read-only chronological history
  List<Map<String, String>> get historyTimeline =>
      clientData.value?.historyTimeline
          .map(
            (e) => {
              'date': e.date,
              'title': e.title,
              'description': e.description,
            },
          )
          .toList() ??
      [];

  // Section: Booking Info Tab
  // Widget: BookingInfoTab
  // Data Source: clientData (bookingInfo)
  Map<String, dynamic> get bookingInfo => clientData.value == null
      ? {}
      : {
          'status': clientData.value!.bookingInfo.status,
          'service': clientData.value!.bookingInfo.service,
          'date': clientData.value!.bookingInfo.date,
          'time': clientData.value!.bookingInfo.time,
          'total': clientData.value!.bookingInfo.total,
        };

  // Section: Charts Tab
  // Widget: ChartsTab, ClientBarChart, ClientLineChart
  // Data Source: clientData (dailyCaloriesBarChart, trendCharts)
  // State: Read-only chart models

  BarChartDataModel? get dailyCaloriesBarChart =>
      clientData.value?.dailyCaloriesBarChart;
  List<LineChartDataModel> get trendCharts =>
      clientData.value?.trendCharts ?? [];

  // Section: Nutrition Tab
  // Widget: NutritionTab
  // Data Source: clientData (nutritionTabData)
  // State: Read-only nutrition details
  NutritionDataModel? get nutritionTabData =>
      clientData.value?.nutritionTabData;
}
