import '../../../core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utility/constants.dart';
import 'chart.dart';
import 'package:admin/screens/main/provider/main_screen_provider.dart';
import 'order_info_card.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        int totalOrder = dataProvider.calculateOrdersWithStatus();
        int pendingOrder = dataProvider.calculateOrdersWithStatus(status: 'pending');
        int processingOrder = dataProvider.calculateOrdersWithStatus(status: 'processing');
        int cancelledOrder = dataProvider.calculateOrdersWithStatus(status: 'cancelled');
        int shippedOrder = dataProvider.calculateOrdersWithStatus(status: 'shipped');
        int deliveredOrder = dataProvider.calculateOrdersWithStatus(status: 'delivered');
        return Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Orders Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: defaultPadding),
              Chart(),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery1.svg",
                title: "All Orders",
                totalOrder: totalOrder,
                onTap: () {
                  context.read<MainScreenProvider>().navigateToScreen('Order');
                  context.read<DataProvider>().filterOrders('All order');
                },
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery5.svg",
                title: "Pending Orders",
                totalOrder: pendingOrder,
                onTap: () {
                  context.read<MainScreenProvider>().navigateToScreen('Order');
                  context.read<DataProvider>().filterOrders('pending');
                },
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery6.svg",
                title: "Processed Orders",
                totalOrder: processingOrder,
                onTap: () {
                  context.read<MainScreenProvider>().navigateToScreen('Order');
                  context.read<DataProvider>().filterOrders('processing');
                },
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery2.svg",
                title: "Cancelled Orders",
                totalOrder: cancelledOrder,
                onTap: () {
                  context.read<MainScreenProvider>().navigateToScreen('Order');
                  context.read<DataProvider>().filterOrders('cancelled');
                },
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery4.svg",
                title: "Shipped Orders",
                totalOrder: shippedOrder,
                onTap: () {
                  context.read<MainScreenProvider>().navigateToScreen('Order');
                  context.read<DataProvider>().filterOrders('shipped');
                },
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery3.svg",
                title: "Delivered Orders",
                totalOrder: deliveredOrder,
                onTap: () {
                  context.read<MainScreenProvider>().navigateToScreen('Order');
                  context.read<DataProvider>().filterOrders('delivered');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
