import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ticket_app/data/sources/follower/follower_remote_data_source.dart';
import 'package:mobile_ticket_app/data/sources/payment/payment_transaction_remote_data_source.dart';
import 'package:mobile_ticket_app/domain/repositories/follower/follower_repository_impl.dart';
import 'package:mobile_ticket_app/domain/repositories/payment/payment_transaction_repository_impl.dart';
import 'package:mobile_ticket_app/domain/usecases/create_survey.dart';
import 'package:mobile_ticket_app/domain/usecases/follower/get_all_followers.dart';
import 'package:mobile_ticket_app/domain/usecases/get_survey_by_id.dart';
import 'package:mobile_ticket_app/domain/usecases/payment/get_all_payment_transactions.dart';
import 'package:mobile_ticket_app/presentation/bloc/follower/follower_bloc.dart';
import 'package:mobile_ticket_app/presentation/bloc/follower/follower_event.dart';
import 'package:mobile_ticket_app/presentation/bloc/payment/payment_bloc.dart';
import 'package:mobile_ticket_app/presentation/bloc/payment/payment_event.dart';
import 'package:mobile_ticket_app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:mobile_ticket_app/presentation/pages/home/home_page.dart';
import 'package:mobile_ticket_app/presentation/pages/survey/survey_page.dart';

import 'data/sources/user_remote_data_source.dart';
import 'domain/repositories/user_repository_impl.dart';
import 'domain/usecases/get_users.dart';
import 'domain/usecases/create_user.dart';
import 'presentation/bloc/user/user_bloc.dart';
import 'presentation/bloc/user/user_event.dart';
import 'presentation/pages/user/user_form_page.dart';
import 'presentation/pages/user/user_page.dart';

// === Tambahan untuk Survey ===
import 'data/sources/survey_remote_data_source.dart';
import 'domain/repositories/survey_repository_impl.dart';
import 'domain/usecases/get_survey.dart';
import 'presentation/bloc/survey/survey_bloc.dart';
import 'presentation/bloc/survey/survey_event.dart';

import 'data/sources/survey_category_remote_data_source.dart';
import 'domain/repositories/survey_category_repository_impl.dart';
import 'domain/usecases/get_survey_category.dart';
import 'presentation/bloc/survey_category/survey_category_bloc.dart';
import 'presentation/bloc/survey_category/survey_category_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Memaksa aplikasi tetap portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userRemoteDataSource = UserRemoteDataSourceImpl();
    final userRepository = UserRepositoryImpl(
      remoteDataSource: userRemoteDataSource,
    );
    final getUsers = GetUsers(userRepository);
    final createUser = CreateUser(userRepository);

    final surveyRemoteDataSource = SurveyRemoteDataSourceImpl();
    final surveyRepository = SurveyRepositoryImpl(
      remoteDataSource: surveyRemoteDataSource,
    );
    final getSurveys = GetSurveys(surveyRepository);
    final getSurveyById = GetSurveyById(surveyRepository);
    final createSurvey = CreateSurvey(surveyRepository);

    final surveyCategoryRemoteDataSource = SurveyCategoryRemoteDataSourceImpl();
    final surveyCategoryRepository = SurveyCategoryRepositoryImpl(
      remoteDataSource: surveyCategoryRemoteDataSource,
    );
    final getSurveyCategories = GetSurveyCategories(surveyCategoryRepository);

    //payment
    final paymentRemoteDataSource = PaymentTransactionRemoteDataSourceImpl();
    final paymentRepository = PaymentTransactionRepositoryImpl(
      remoteDataSource: paymentRemoteDataSource,
    );
    final getAllPaymentTransactions = GetAllPaymentTransactions(
      paymentRepository,
    );

    //follower
    final followerRemoteDataSource = FollowerRemoteDataSourceImpl();
    final followerRepository = FollowerRepositoryImpl(
      remoteDataSource: followerRemoteDataSource,
    );
    final getAllFollowers = GetAllFollowers(followerRepository);
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => UserBloc(getUsers, createUser)..add(GetUsersEvent()),
        ),
        BlocProvider<SurveyCategoryBloc>(
          create: (_) =>
              SurveyCategoryBloc(getSurveyCategories)
                ..add(GetSurveyCategoriesEvent()),
        ),
        BlocProvider<SurveyBloc>(
          create: (_) =>
              SurveyBloc(getSurveys, getSurveyById, createSurvey)
                ..add(GetSurveysEvent()),
        ),
        BlocProvider<PaymentBloc>(
          create: (_) =>
              PaymentBloc(getAllPaymentTransactions)..add(GetPaymentEvent()),
        ),
        BlocProvider<FollowerBloc>(
          create: (_) => FollowerBloc(getAllFollowers)..add(GetFollowerEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'User & Survey App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardPage(),
          '/user': (context) => const UserPage(),
          '/create-user': (context) => const UserFormPage(),
          '/surveys': (context) => const SurveyPage(),
        },
      ),
    );
  }
}
