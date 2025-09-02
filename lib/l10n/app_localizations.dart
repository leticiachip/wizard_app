import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @senha.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get senha;

  /// No description provided for @digiteEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get digiteEmail;

  /// No description provided for @digiteSenha.
  ///
  /// In en, this message translates to:
  /// **'Enter the password'**
  String get digiteSenha;

  /// No description provided for @esqueciSenha.
  ///
  /// In en, this message translates to:
  /// **'I forgot my password'**
  String get esqueciSenha;

  /// No description provided for @atencao.
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get atencao;

  /// No description provided for @confirmacaoEmail.
  ///
  /// In en, this message translates to:
  /// **'Email confirmation'**
  String get confirmacaoEmail;

  /// No description provided for @continuar.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuar;

  /// No description provided for @naoTrocouSenha.
  ///
  /// In en, this message translates to:
  /// **'Unable to change password'**
  String get naoTrocouSenha;

  /// No description provided for @codigo.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get codigo;

  /// No description provided for @confirmarSenha.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation'**
  String get confirmarSenha;

  /// No description provided for @senhaDeveSerIgual.
  ///
  /// In en, this message translates to:
  /// **'The password must be the same as the one entered above.'**
  String get senhaDeveSerIgual;

  /// No description provided for @trocarSenha.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get trocarSenha;

  /// No description provided for @filtroNaoEncontrado.
  ///
  /// In en, this message translates to:
  /// **'The device {name} was not found.'**
  String filtroNaoEncontrado(Object name);

  /// No description provided for @falhaBuscarDispositivos.
  ///
  /// In en, this message translates to:
  /// **'It was not possible to retrieve devices'**
  String get falhaBuscarDispositivos;

  /// No description provided for @buscarDispositivos.
  ///
  /// In en, this message translates to:
  /// **'Searching for devices'**
  String get buscarDispositivos;

  /// No description provided for @ordemServico.
  ///
  /// In en, this message translates to:
  /// **'Work order'**
  String get ordemServico;

  /// No description provided for @detalhesOrdemServico.
  ///
  /// In en, this message translates to:
  /// **'Work order details'**
  String get detalhesOrdemServico;

  /// No description provided for @empresaDestinataria.
  ///
  /// In en, this message translates to:
  /// **'Distributor company'**
  String get empresaDestinataria;

  /// No description provided for @responsavel.
  ///
  /// In en, this message translates to:
  /// **'Responsible'**
  String get responsavel;

  /// No description provided for @prazoFinal.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get prazoFinal;

  /// No description provided for @prazoAcabando.
  ///
  /// In en, this message translates to:
  /// **'The deadline is approaching'**
  String get prazoAcabando;

  /// No description provided for @tipo.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get tipo;

  /// No description provided for @detalhes.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detalhes;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @idExterno.
  ///
  /// In en, this message translates to:
  /// **'External ID'**
  String get idExterno;

  /// No description provided for @placaVeiculo.
  ///
  /// In en, this message translates to:
  /// **'Vehicle registration plate'**
  String get placaVeiculo;

  /// No description provided for @informacoesAdicionais.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get informacoesAdicionais;

  /// No description provided for @motivoCancelamento.
  ///
  /// In en, this message translates to:
  /// **'Reason for cancellation'**
  String get motivoCancelamento;

  /// No description provided for @avisoPermissaoScan.
  ///
  /// In en, this message translates to:
  /// **'This app uses a Bluetooth connection. For it to work properly, you need to enable nearby device and location permissions.'**
  String get avisoPermissaoScan;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
