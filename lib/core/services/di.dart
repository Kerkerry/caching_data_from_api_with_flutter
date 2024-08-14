import 'di_ex.dart';
final di=GetIt.instance;

Future<void> setupDi()async{
  di.registerSingleton<Dio>(Dio());
  di.registerSingleton(InternetConnectionHelper());
  await Hive.initFlutter();
  di.registerSingleton<HomeDatabaseService>(HomeDatabaseService());
  await di<HomeDatabaseService>().initDatabase();
  di.registerSingleton(HomeDbProvider(homeDatabaseService: di<HomeDatabaseService>()));

  di.registerSingleton(HomeApiProvider(di<Dio>()));

  di.registerSingleton(HomeRepository(di<HomeApiProvider>(), di<HomeDbProvider>()));

  di.registerSingleton<HomeBloc>(HomeBloc(di<HomeRepository>()));
}