import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ticket_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/mapper/user_mapper.dart';
import '../../domain/entities/user.dart';
import '../../presentation/bloc/user/user_bloc.dart';
import '../../presentation/bloc/user/user_state.dart';
import 'user_form_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> cachedUsers = [];

  @override
  void initState() {
    super.initState();
    _loadCachedUsers();
  }

  Future<void> _loadCachedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cachedJson = prefs.getString('cached_users');
    if (cachedJson != null) {
      final List decoded = json.decode(cachedJson);
      final users = decoded
          .map((e) => UserModel.fromJson(e).toEntity())
          .toList()
          .cast<User>();
      setState(() {
        cachedUsers = users;
      });
    }
  }

  Future<void> _cacheUsers(List<User> users) async {
    final prefs = await SharedPreferences.getInstance();
    final userModels = users.map((e) => e.toModel()).toList();
    final String encoded = json.encode(
      userModels.map((e) => e.toJson()).toList(),
    );
    await prefs.setString('cached_users', encoded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    label: const Text(
                      'Kembali',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Daftar pengguna baru',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text('Silakan tambahkan data user baru.'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              height: 500,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: BlocProvider.value(
                                  value: BlocProvider.of<UserBloc>(context),
                                  child: const UserFormPage(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.add, size: 20),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    if (cachedUsers.isNotEmpty) {
                      return buildUserList(cachedUsers);
                    }
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is UserLoaded) {
                    cachedUsers = state.users;
                    _cacheUsers(state.users);
                    return buildUserList(state.users);
                  }

                  if (cachedUsers.isNotEmpty) {
                    return buildUserList(cachedUsers);
                  }

                  return const Center(child: Text('Tidak ada pengguna.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserList(List<User> users) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            child: ListTile(
              title: Text(
                user.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(user.email),
            ),
          ),
        );
      },
    );
  }
}
