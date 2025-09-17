import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_ticket_app/presentation/bloc/follower/follower_bloc.dart';
import 'package:mobile_ticket_app/presentation/bloc/follower/follower_state.dart';
import 'package:mobile_ticket_app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:mobile_ticket_app/presentation/widget/slider_page_route.dart';

class Follower extends StatelessWidget {
  const Follower({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
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
              BlocBuilder<FollowerBloc, FollowerState>(
                builder: (context, state) {
                  if (state is FollowerLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FollowerLoaded) {
                    final followers = state.followers;

                    if (followers.isEmpty) {
                      return const Center(child: Text('Tidak ada followers'));
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: followers.length,
                      itemBuilder: (context, index) {
                        final fl = followers[index];
                        return Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Image.network(
                                fl.avatar,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Gap(10),
                            Text(fl.name),
                          ],
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
