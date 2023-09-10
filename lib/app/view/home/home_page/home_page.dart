import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/extensions/sizes.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_financy_app/app/locator.dart';
import 'package:flutter_financy_app/app/view/home/home_page/home_controller.dart';
import 'package:flutter_financy_app/app/view/home/home_page/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = locator.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.getAllTransactions();
  }

  double get textScaleFactory =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;

  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundTop(),
          _textTop(),
          _cardCenter(),
          _body(),
        ],
      ),
    );
  }

  Positioned _backgroundTop() {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.greenGradiente,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(500, 30),
            bottomRight: Radius.elliptical(500, 30),
          ),
        ),
        height: 287.h,
      ),
    );
  }

  Positioned _textTop() {
    return Positioned(
      left: 24.0,
      right: 24.0,
      top: 74.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Afternoon',
                textScaleFactor: textScaleFactory,
                style: AppTextStyles.smallText.apply(
                  color: AppColors.white,
                ),
              ),
              Text(
                'Enjelin Morgeana',
                textScaleFactor: textScaleFactory,
                style: AppTextStyles.mediumText20.apply(color: AppColors.white),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: AppColors.white.withOpacity(0.06),
            ),
            child: Stack(
              alignment: const AlignmentDirectional(0.5, -0.5),
              children: [
                const Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.white,
                ),
                Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned _cardCenter() {
    return Positioned(
      left: 24.w,
      right: 24.w,
      top: 160.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        decoration: const BoxDecoration(
          color: AppColors.darkgreen,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total balance',
                      textScaleFactor: textScaleFactory,
                      style: AppTextStyles.mediumText16w500.apply(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      '\$ 1.556,00',
                      textScaleFactor: textScaleFactory,
                      style: AppTextStyles.mediumText30.apply(
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => log('Options' as num),
                  child: PopupMenuButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.more_horiz,
                      color: AppColors.white,
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        height: 24,
                        child: Text('Item 1'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 36.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.06),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Icon(
                        Icons.arrow_downward,
                        color: AppColors.white,
                        size: iconSize,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Income',
                          textScaleFactor: textScaleFactory,
                          style: AppTextStyles.mediumText16w500
                              .apply(color: AppColors.white),
                        ),
                        Text(
                          '\$ 1.840,00',
                          textScaleFactor: textScaleFactory,
                          style: AppTextStyles.mediumText20
                              .apply(color: AppColors.white),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.06),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Icon(
                            Icons.arrow_upward,
                            color: AppColors.white,
                            size: iconSize,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expenses',
                              textScaleFactor: textScaleFactory,
                              style: AppTextStyles.mediumText16w500
                                  .apply(color: AppColors.white),
                            ),
                            Text(
                              '\$ 284,00',
                              textScaleFactor: textScaleFactory,
                              style: AppTextStyles.mediumText20
                                  .apply(color: AppColors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned _body() {
    return Positioned(
      top: 392.h,
      left: 20.w,
      right: 20.w,
      bottom: 0,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction History',
                  style: AppTextStyles.mediumText18,
                ),
                Text(
                  'See All',
                  style: AppTextStyles.inputLabelText,
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  if (controller.state is HomeStateLoading) {
                    return const CustomCircularProgressIndicator(
                      color: AppColors.greenOne,
                    );
                  }
                  if (controller.state is HomeStateError) {
                    return const Center(
                      child: Text('An error has occurred'),
                    );
                  }
                  if (controller.transactions.isEmpty) {
                    return const Center(
                      child: Text('There is no transactions at this time'),
                    );
                  }
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.transactions.length,
                    itemBuilder: (context, index) {
                      final item = controller.transactions[index];
                      final color = item.value.isNegative
                          ? AppColors.outcome
                          : AppColors.income;
                      final value = '\$ ${item.value.toStringAsFixed(2)}';
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        leading: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.antiFlashWhite,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.monetization_on_outlined),
                        ),
                        title: Text(
                          item.title,
                          style: AppTextStyles.mediumText16w500,
                        ),
                        subtitle: Text(
                          DateTime.fromMillisecondsSinceEpoch(item.date)
                              .toString(),
                          style: AppTextStyles.mediumText13,
                        ),
                        trailing: Text(
                          value,
                          style: AppTextStyles.mediumText18.apply(color: color),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
