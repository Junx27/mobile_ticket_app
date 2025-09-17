import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_ticket_app/presentation/bloc/payment/payment_bloc.dart';
import 'package:mobile_ticket_app/presentation/bloc/payment/payment_state.dart';
import 'package:mobile_ticket_app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:mobile_ticket_app/presentation/widget/slider_page_route.dart';

class MenuPayment extends StatelessWidget {
  const MenuPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderImages1 = [
      {"name": "Transfer", "image": "assets/icons/after.jpg"},
      {"name": "Top Up", "image": "assets/icons/jendela.jpg"},
      {"name": "Membership", "image": "assets/icons/cover.jpg"},
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                padding: EdgeInsets.only(
                  top: 100,
                  right: 16,
                  left: 16,
                  bottom: 60,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/icons/coin.jpg',
                    ), // atau NetworkImage()
                    fit: BoxFit.cover, // agar image menutupi seluruh container
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: const Offset(-15, 0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          final dashboardState = context
                              .findAncestorStateOfType<DashboardPageState>();
                          dashboardState?.replaceNavItem(0, 0);
                        },
                      ),
                    ),
                    Text(
                      'Bergabung \nAnggota Membership',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Dapatkan banyak keuntungan \nmenjadi bagian membership Sekarang!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -80),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.65,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          children: sliderImages1.map<Widget>((item) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      item['image'].toString(),
                                      fit: BoxFit.cover,
                                      width: double
                                          .infinity, // biar full sesuai kolom
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['name'].toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Riwayat Transaksi',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            BlocBuilder<PaymentBloc, PaymentState>(
                              builder: (context, state) {
                                if (state is PaymentLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is PaymentLoaded) {
                                  final transactions = state.transactions;

                                  if (transactions.isEmpty) {
                                    return const Center(
                                      child: Text("Tidak ada transaksi."),
                                    );
                                  }

                                  return ListView.builder(
                                    shrinkWrap:
                                        true, // ✅ biar nggak error constraint
                                    itemCount: transactions.length,
                                    itemBuilder: (context, index) {
                                      final trx = transactions[index];
                                      return ListTile(
                                        title: Text(
                                          trx.account_name ?? 'No Name',
                                        ),
                                        subtitle: Text(
                                          '${trx.account_number ?? '-'} - ${trx.amount ?? 0}',
                                        ),
                                      );
                                    },
                                  );
                                }

                                if (state is PaymentError) {
                                  return Center(child: Text(state.message));
                                }

                                return const SizedBox(); // default kosong
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
