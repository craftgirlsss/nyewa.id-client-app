import 'package:flutter/material.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/helpers/sliver_appbar_delegate.dart';
import 'package:nyewadotid/src/views/providers/dashboards/utilities/order_tab_done.dart';
import 'package:nyewadotid/src/views/providers/dashboards/utilities/order_tab_runing.dart';
import 'package:nyewadotid/src/views/providers/dashboards/utilities/order_tab_terbaru.dart';

class OrderProvider extends StatefulWidget {
  const OrderProvider({super.key});

  @override
  State<OrderProvider> createState() => _OrderProviderState();
}

class _OrderProviderState extends State<OrderProvider> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              pinned: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              stretchTriggerOffset: 200,
              expandedHeight: 100.0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                title: Text('Orders', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverAppBarDelegate(
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: GlobalVariable.secondaryColor,
                  unselectedLabelColor: Colors.black38,
                  indicatorWeight: 2,
                  labelColor: GlobalVariable.secondaryColor,
                  controller: _tabController,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  tabs: const<Widget> [
                    Tab(text: 'Terbaru'),
                    Tab(text: 'Aktif'),
                    Tab(text: 'Selesai'),
                  ],
                ),
              ),
            ),
          ];
        }, 
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            OrderTabTerbaruProvider(),
            OrderTabRuningProvider(),
            OrderTabDoneProvider(),
          ],
        ),
      ),
    );
  }
}