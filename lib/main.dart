import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'auth/supabase_auth/supabase_user_provider.dart';
import 'auth/supabase_auth/auth_util.dart';

import '/backend/supabase/supabase.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();

  await SupaFlow.initialize();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = responsiveCRMAppDesignSystemSupabaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Responsive CRM App Design System',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('bn'),
        Locale('ta'),
        Locale('te'),
        Locale('or'),
        Locale('ml'),
        Locale('hi'),
        Locale('ur'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'syncfusion_flutter_datagrid';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Main_Home': MainHomeWidget(),
      'Main_customerList': MainCustomerListWidget(),
      'Main_Contracts': MainContractsWidget(),
      'Main_messages': MainMessagesWidget(),
      'Main_profilePage': MainProfilePageWidget(),
      'Main_companiesList': MainCompaniesListWidget(),
      'syncfusion_flutter_datagrid': SyncfusionFlutterDatagridWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'xdxbdj20' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.supervised_user_circle_sharp,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                '3ourv2w9' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.document_scanner_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.document_scanner,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'j08eiorc' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.forum_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.forum_rounded,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                'smtxdnbn' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'o3dp9tss' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_work_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.home_work,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                '89iqx991' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dataset_outlined,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                '1qcjjusz' /* DataTable */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
