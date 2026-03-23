import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  AppDeliveryAuthUser? initialUser;
  AppDeliveryAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(AppDeliveryAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : PratossWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : PratossWidget(),
        ),
        FFRoute(
          name: DTelaLoginWidget.routeName,
          path: DTelaLoginWidget.routePath,
          builder: (context, params) => DTelaLoginWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            senha: params.getParam(
              'senha',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: BTelaRegistroWidget.routeName,
          path: BTelaRegistroWidget.routePath,
          builder: (context, params) => BTelaRegistroWidget(),
        ),
        FFRoute(
          name: APrimeiraTelaWidget.routeName,
          path: APrimeiraTelaWidget.routePath,
          builder: (context, params) => APrimeiraTelaWidget(),
        ),
        FFRoute(
            name: AHomeWidget.routeName,
            path: AHomeWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'A_Home')
                : NavBarPage(
                    initialPage: 'A_Home',
                    page: AHomeWidget(),
                  )),
        FFRoute(
          name: AProfileWidget.routeName,
          path: AProfileWidget.routePath,
          builder: (context, params) => AProfileWidget(),
        ),
        FFRoute(
          name: ESettingsWidget.routeName,
          path: ESettingsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'E_Settings')
              : ESettingsWidget(),
        ),
        FFRoute(
          name: DRastrearWidget.routeName,
          path: DRastrearWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'D_Rastrear')
              : DRastrearWidget(),
        ),
        FFRoute(
          name: BatepapoUsuarioXmotoboyWidget.routeName,
          path: BatepapoUsuarioXmotoboyWidget.routePath,
          builder: (context, params) => BatepapoUsuarioXmotoboyWidget(),
        ),
        FFRoute(
          name: EnderecoUsuarioWidget.routeName,
          path: EnderecoUsuarioWidget.routePath,
          builder: (context, params) => EnderecoUsuarioWidget(),
        ),
        FFRoute(
          name: CCarinhoWidget.routeName,
          path: CCarinhoWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'C_Carinho')
              : CCarinhoWidget(),
        ),
        FFRoute(
          name: EGestaoPromocoesWidget.routeName,
          path: EGestaoPromocoesWidget.routePath,
          builder: (context, params) => EGestaoPromocoesWidget(),
        ),
        FFRoute(
          name: BGestaoPedidosWidget.routeName,
          path: BGestaoPedidosWidget.routePath,
          builder: (context, params) => BGestaoPedidosWidget(),
        ),
        FFRoute(
          name: CCorridasWidget.routeName,
          path: CCorridasWidget.routePath,
          builder: (context, params) => CCorridasWidget(),
        ),
        FFRoute(
          name: BTelaCadastroWidget.routeName,
          path: BTelaCadastroWidget.routePath,
          builder: (context, params) => BTelaCadastroWidget(),
        ),
        FFRoute(
          name: ATelaloginmotoboyWidget.routeName,
          path: ATelaloginmotoboyWidget.routePath,
          builder: (context, params) => ATelaloginmotoboyWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            senha: params.getParam(
              'senha',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: FPerfilmotoboyWidget.routeName,
          path: FPerfilmotoboyWidget.routePath,
          builder: (context, params) => FPerfilmotoboyWidget(),
        ),
        FFRoute(
          name: EPagamentoWidget.routeName,
          path: EPagamentoWidget.routePath,
          builder: (context, params) => EPagamentoWidget(),
        ),
        FFRoute(
          name: AHomeGestaoWidget.routeName,
          path: AHomeGestaoWidget.routePath,
          builder: (context, params) => AHomeGestaoWidget(),
        ),
        FFRoute(
          name: DGestaoRelatorioWidget.routeName,
          path: DGestaoRelatorioWidget.routePath,
          builder: (context, params) => DGestaoRelatorioWidget(),
        ),
        FFRoute(
          name: CGestaoPratosWidget.routeName,
          path: CGestaoPratosWidget.routePath,
          builder: (context, params) => CGestaoPratosWidget(),
        ),
        FFRoute(
          name: CEsqueciSenhaWidget.routeName,
          path: CEsqueciSenhaWidget.routePath,
          builder: (context, params) => CEsqueciSenhaWidget(),
        ),
        FFRoute(
          name: BPratosWidget.routeName,
          path: BPratosWidget.routePath,
          builder: (context, params) => BPratosWidget(),
        ),
        FFRoute(
          name: PratossWidget.routeName,
          path: PratossWidget.routePath,
          builder: (context, params) => PratossWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/pratoss';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
