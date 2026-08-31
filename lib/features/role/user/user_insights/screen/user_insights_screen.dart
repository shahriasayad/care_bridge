import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_bridge/core/common/widgets/custom_app_bar.dart';
import 'package:care_bridge/core/common/widgets/custom_button.dart';
import 'package:care_bridge/core/const/app_colors.dart';
import 'package:care_bridge/core/const/global_text_style.dart';
import 'package:care_bridge/features/role/user/user_insights/controller/user_insights_controller.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_nutrition_progress.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_quick_insights.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/user_grovr_score_chart.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/user_insights_extended_widgets.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/user_insights_info_widgets.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/user_recomendation_card.dart';
import 'package:care_bridge/features/role/user/user_insights/widgets/ext_insights_sections.dart';

class UserInsightsScreen extends StatelessWidget {
  UserInsightsScreen({super.key});

  final UserInsightsController c = Get.put(UserInsightsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              CustomAppBar(
                title: 'Insights',
                showBackButton: true,
                showNotificationButton: true,
              ),
              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerRight,
                child: Obx(() => _buildDropdown(context)),
              ),

              const SizedBox(height: 16),

              _buildTabBar(c),

              const SizedBox(height: 20),

              Obx(() => _buildTabContent(c.selectedTab.value)),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF7F4),
        border: Border.all(color: const Color(0xFFEADFD6)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: c.selectedPeriod.value,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          isDense: true,
          style: getTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
          ),
          onChanged: (value) {
            if (value != null) {
              c.selectedPeriod.value = value;
            }
          },
          items: c.periods
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTabBar(UserInsightsController c) {
    final tabs = ['Overview', 'Chart', 'Nutrition'];

    return Obx(
      () => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF5EFEA),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: tabs.map((tab) {
            final isSelected = c.selectedTab.value == tab;

            return Expanded(
              child: GestureDetector(
                onTap: () => c.selectedTab.value = tab,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF956246)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      tab,
                      overflow: TextOverflow.ellipsis,
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF8C664A),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTabContent(String tab) {
    switch (tab) {
      case 'Overview':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserGrovrScoreChart(c: c),
            const SizedBox(height: 24),

            SleepCravingsCard(c: c),

            const SizedBox(height: 28),

            const WellnessIntelligenceSection(),

            const SizedBox(height: 28),

            Text(
              'Personalized Recommendations',
              style: getTextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 16),

            Column(
              children: c.recommendations
                  .map<Widget>((r) => UserRecommendationCard(rec: r))
                  .toList(),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: c.insightsProgress.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (_, i) {
                final item = c.insightsProgress[i];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFFF4F7EF,
                    ), // Light greenish tint from Figma
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item['iconPath'] as String,
                        width: 20,
                        height: 20,
                        color: const Color(0xFFC78151),
                        errorBuilder: (_, _, _) => Icon(
                          Icons.local_fire_department_outlined,
                          color: const Color(0xFFC78151),
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['title'] as String,
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF66584F),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['value'] as String,
                        style: getTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF3C3530),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['goal'] as String,
                        style: getTextStyle(
                          fontSize: 1,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF66584F),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: LinearProgressIndicator(
                          value: item['progress'] as double,
                          minHeight: 4,
                          backgroundColor: const Color(0xFFEADFD6),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            item['color'] as Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Column(
              children: c.insightsMetrics.map((m) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        m['iconPath'] as String,
                        width: 18,
                        height: 18,
                        color: const Color(0xFF556643), // Greenish icon
                        errorBuilder: (_, _, _) => Icon(
                          Icons.monitor_weight_outlined,
                          color: const Color(0xFF556643),
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        m['title'] as String,
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF23140A),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        m['isPositive'] as bool
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: m['color'] as Color,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        m['delta'] as String,
                        style: getTextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: m['color'] as Color,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        m['vs'] as String,
                        style: getTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF66584F),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const GrovrAiSummaryCard(),
            const SizedBox(height: 24),
            const WholePersonHealthScoreSection(),
            const SizedBox(height: 24),
            const MentalWellnessSection(),
            const SizedBox(height: 24),
            const ActivityFitnessAnalyticsSection(),
            const SizedBox(height: 24),
            const SleepRecoveryAnalyticsSection(),
            const SizedBox(height: 24),
            const NutritionIntelligenceSection(),
            const SizedBox(height: 24),
            const SymptomTrackingSection(),
            const SizedBox(height: 24),
            const HabitIntelligenceSection(),
            const SizedBox(height: 24),
            const MedicationComplianceSection(),
          ],
        );

      case 'Chart':
        return Column(
          children: [
            CaloriesBarChartCard(),
            const SizedBox(height: 16),

            SmoothLineTrendCard(
              title: 'Daily Calories vs Goals',
              badgeText: 'Highest 150K',
              yAxisLabels: const ['2.5', '2.0', '1.5', '1.0', '0.5', '0'],
              xAxisLabels: const [
                'May 1',
                'May 2',
                'May 3',
                'May 4',
                'May 5',
                'May 6',
                'May 7',
              ],
            ),

            SmoothLineTrendCard(
              title: 'Weight Trend',
              badgeText: 'Highest 150k',
              yAxisLabels: const ['120', '100', '80', '60', '40', '20', '0'],
              xAxisLabels: const [
                'May 1',
                'May 2',
                'May 3',
                'May 4',
                'May 5',
                'May 6',
                'May 7',
              ],
            ),

            SmoothLineTrendCard(
              title: 'Protein Trend',
              badgeText: 'Highest 150k',
              yAxisLabels: const ['150', '125', '100', '75', '50', '25', '0'],
              xAxisLabels: const [
                'May 1',
                'May 2',
                'May 3',
                'May 4',
                'May 5',
                'May 6',
                'May 7',
              ],
            ),

            SmoothLineTrendCard(
              title: 'Meal Consistency',
              badgeText: 'Highest 150k',
              yAxisLabels: const ['100', '80', '60', '40', '20', '0'],
              xAxisLabels: const [
                'May 1',
                'May 2',
                'May 3',
                'May 4',
                'May 5',
                'May 6',
                'May 7',
              ],
            ),

            SmoothLineTrendCard(
              title: 'Nutrition Score Trend',
              badgeText: 'Highest 150k',
              yAxisLabels: const ['100', '80', '60', '40', '20', '0'],
              xAxisLabels: const [
                'May 1',
                'May 2',
                'May 3',
                'May 4',
                'May 5',
                'May 6',
                'May 7',
              ],
            ),

            SmoothLineTrendCard(
              title: 'Late Night Eating Frequently',
              badgeText: 'Highest 150k',
              yAxisLabels: const ['100', '80', '60', '40', '20', '0'],
              xAxisLabels: const [
                'May 1',
                'May 2',
                'May 3',
                'May 4',
                'May 5',
                'May 6',
                'May 7',
              ],
            ),

            const SizedBox(height: 16),

            _buildGivePermissionCard(),
          ],
        );

      case 'Nutrition':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActualIntakeCard(),

            const SizedBox(height: 16),

            NutritionProgressCard(),

            const SizedBox(height: 16),

            QuickInsightsWidget(),

            const SizedBox(height: 16),

            CaloriesBarChartCard(),

            const SizedBox(height: 16),

            KeyMetricsWidget(),

            const SizedBox(height: 16),

            MealBreakdownWidget(),

            const SizedBox(height: 16),

            WeeklyMacroAveragesWidget(),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildGivePermissionCard() {
    return CustomButton(text: 'Give Permission', onTap: () {});
  }
}
