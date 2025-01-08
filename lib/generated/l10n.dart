// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `This registration is specifically intended for administrators and teachers. Click here to register as an administrator. Follow the next steps by filling in your username and personal information (KYC) for confirmation and verification by the pesantren admin team.`
  String get registrationAdmin {
    return Intl.message(
      'This registration is specifically intended for administrators and teachers. Click here to register as an administrator. Follow the next steps by filling in your username and personal information (KYC) for confirmation and verification by the pesantren admin team.',
      name: 'registrationAdmin',
      desc:
          'Text for admin registration instructions in English, intended for administrators and teachers to register.',
      args: [],
    );
  }

  /// `This registration is intended for guardians. Click this link to register and complete the KYC process for further verification by the pesantren admin team.`
  String get registrationGuardian {
    return Intl.message(
      'This registration is intended for guardians. Click this link to register and complete the KYC process for further verification by the pesantren admin team.',
      name: 'registrationGuardian',
      desc:
          'Text for guardian registration instructions in English, intended for guardians to register and complete KYC.',
      args: [],
    );
  }

  /// `This registration is open to all users, including devotees, alumni, and the general community. Click to register and fill in your username and personal data. The pesantren admin team will confirm and verify.`
  String get registrationGeneral {
    return Intl.message(
      'This registration is open to all users, including devotees, alumni, and the general community. Click to register and fill in your username and personal data. The pesantren admin team will confirm and verify.',
      name: 'registrationGeneral',
      desc:
          'Text for general user registration instructions in English, open for all users including devotees, alumni, and community.',
      args: [],
    );
  }

  /// `Pondok Member`
  String get pondokMember {
    return Intl.message(
      'Pondok Member',
      name: 'pondokMember',
      desc: 'Label for pondok members option in English.',
      args: [],
    );
  }

  /// `Guardian`
  String get guardian {
    return Intl.message(
      'Guardian',
      name: 'guardian',
      desc: 'Label for guardian option in English.',
      args: [],
    );
  }

  /// `General User`
  String get generalUser {
    return Intl.message(
      'General User',
      name: 'generalUser',
      desc: 'Label for general user option in English.',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: 'Button text for selecting an option in English.',
      args: [],
    );
  }

  /// `General User`
  String get generalUserTitle {
    return Intl.message(
      'General User',
      name: 'generalUserTitle',
      desc: 'Title text for general user selection in English.',
      args: [],
    );
  }

  /// `Enter your registered username, phone number, or email, and we will send confirmation for a new password request.`
  String get passwordResetInfo {
    return Intl.message(
      'Enter your registered username, phone number, or email, and we will send confirmation for a new password request.',
      name: 'passwordResetInfo',
      desc:
          'Text for password reset information in English, instructing users to enter username, phone, or email.',
      args: [],
    );
  }

  /// `Email / Phone Number`
  String get emailOrPhone {
    return Intl.message(
      'Email / Phone Number',
      name: 'emailOrPhone',
      desc:
          'Label for input field where users can enter email or phone number in English.',
      args: [],
    );
  }

  /// `Send new password via SMS?`
  String get sendPasswordViaSMS {
    return Intl.message(
      'Send new password via SMS?',
      name: 'sendPasswordViaSMS',
      desc:
          'Option text in English asking if the new password should be sent via SMS.',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: 'Button text for sending information in English.',
      args: [],
    );
  }

  /// `Don't have an account? <bold>Sign Up</bold>`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account? <bold>Sign Up</bold>',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? <bold>Log In</bold>`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? <bold>Log In</bold>',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the <bold>Privacy Policy</bold>`
  String get agreePrivacyPolicy {
    return Intl.message(
      'I agree to the <bold>Privacy Policy</bold>',
      name: 'agreePrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Connection verification is done to secure the account and verify the guardian's data connected to the student`
  String get connectionVerificationInfo {
    return Intl.message(
      'Connection verification is done to secure the account and verify the guardian\'s data connected to the student',
      name: 'connectionVerificationInfo',
      desc: '',
      args: [],
    );
  }

  /// `Verification is done in three stages: phone/WhatsApp number verification, identity verification, and guardian-student connection verification`
  String get verificationProcessInfo {
    return Intl.message(
      'Verification is done in three stages: phone/WhatsApp number verification, identity verification, and guardian-student connection verification',
      name: 'verificationProcessInfo',
      desc: '',
      args: [],
    );
  }

  /// `Personal data provided in the verification process is guaranteed to be secure and will not be misused`
  String get dataPrivacyInfo {
    return Intl.message(
      'Personal data provided in the verification process is guaranteed to be secure and will not be misused',
      name: 'dataPrivacyInfo',
      desc: '',
      args: [],
    );
  }

  /// `Start Verification`
  String get startVerification {
    return Intl.message(
      'Start Verification',
      name: 'startVerification',
      desc: '',
      args: [],
    );
  }

  /// `Connect With Child`
  String get connectWithChild {
    return Intl.message(
      'Connect With Child',
      name: 'connectWithChild',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get cont {
    return Intl.message(
      'Continue',
      name: 'cont',
      desc: '',
      args: [],
    );
  }

  /// `Search Boarding School...`
  String get searchPesantren {
    return Intl.message(
      'Search Boarding School...',
      name: 'searchPesantren',
      desc: '',
      args: [],
    );
  }

  /// `Select Boarding School Origin`
  String get selectPesantrenOrigin {
    return Intl.message(
      'Select Boarding School Origin',
      name: 'selectPesantrenOrigin',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get selectPesantren {
    return Intl.message(
      'Select',
      name: 'selectPesantren',
      desc: '',
      args: [],
    );
  }

  /// `PesantrenQu`
  String get onBoardTitleSix {
    return Intl.message(
      'PesantrenQu',
      name: 'onBoardTitleSix',
      desc: '',
      args: [],
    );
  }

  /// `<bold>PesantrenQu</bold> was born thanks to a collaboration with <bold>PesantrenQu Platform</bold> owned by <bold>PT Solusi Infotech Semesta Indonesia (SIESTA)</bold>`
  String get onBoardDescSix {
    return Intl.message(
      '<bold>PesantrenQu</bold> was born thanks to a collaboration with <bold>PesantrenQu Platform</bold> owned by <bold>PT Solusi Infotech Semesta Indonesia (SIESTA)</bold>',
      name: 'onBoardDescSix',
      desc: '',
      args: [],
    );
  }

  /// `Academic`
  String get onBoardTitleFive {
    return Intl.message(
      'Academic',
      name: 'onBoardTitleFive',
      desc: '',
      args: [],
    );
  }

  /// `It is easy to monitor students in terms of attendance, learning/academic development and reciting the Quran & Yellow Book/daily memorization targets.`
  String get onBoardDescFive {
    return Intl.message(
      'It is easy to monitor students in terms of attendance, learning/academic development and reciting the Quran & Yellow Book/daily memorization targets.',
      name: 'onBoardDescFive',
      desc: '',
      args: [],
    );
  }

  /// `List of New Students & Senior High School Students`
  String get onBoardTitleFour {
    return Intl.message(
      'List of New Students & Senior High School Students',
      name: 'onBoardTitleFour',
      desc: '',
      args: [],
    );
  }

  /// `Easy to Register New Students & Syahriyah`
  String get onBoardDescFour {
    return Intl.message(
      'Easy to Register New Students & Syahriyah',
      name: 'onBoardDescFour',
      desc: '',
      args: [],
    );
  }

  /// `Provision Money`
  String get onBoardTitleThree {
    return Intl.message(
      'Provision Money',
      name: 'onBoardTitleThree',
      desc: '',
      args: [],
    );
  }

  /// `It is easy to send pocket money to the SaQu Card because it is connected to more than 140 banks and fintechs throughout Indonesia for 24 hours and can be done anywhere and you are free to set your child's consumption limit.`
  String get onBoardDescThree {
    return Intl.message(
      'It is easy to send pocket money to the SaQu Card because it is connected to more than 140 banks and fintechs throughout Indonesia for 24 hours and can be done anywhere and you are free to set your child\'s consumption limit.',
      name: 'onBoardDescThree',
      desc: '',
      args: [],
    );
  }

  /// `Cashless System`
  String get onBoardTitleTwo {
    return Intl.message(
      'Cashless System',
      name: 'onBoardTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Implementing a cashless system in all transactions at school by students, guardians of students and teachers`
  String get onBoardDescTwo {
    return Intl.message(
      'Implementing a cashless system in all transactions at school by students, guardians of students and teachers',
      name: 'onBoardDescTwo',
      desc: '',
      args: [],
    );
  }

  /// `PesantrenQu`
  String get onBoardTitleOne {
    return Intl.message(
      'PesantrenQu',
      name: 'onBoardTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `Application for all parties (Guardians, Asatidz, Teachers, Khadim, to Administrators and Caretakers) in your Islamic Boarding School environment. You can access everything anywhere & anytime!`
  String get onBoardDescOne {
    return Intl.message(
      'Application for all parties (Guardians, Asatidz, Teachers, Khadim, to Administrators and Caretakers) in your Islamic Boarding School environment. You can access everything anywhere & anytime!',
      name: 'onBoardDescOne',
      desc: 'Deskripsi Onboard Pertama',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: 'Next Button',
      args: [],
    );
  }

  /// `flutter_bloc_app_template`
  String get appTitle {
    return Intl.message(
      'flutter_bloc_app_template',
      name: 'appTitle',
      desc: 'The title of the application',
      args: [],
    );
  }

  /// `Sample Items`
  String get itemsTitle {
    return Intl.message(
      'Sample Items',
      name: 'itemsTitle',
      desc: 'The title of the sample items',
      args: [],
    );
  }

  /// `Messages`
  String get messagesTitle {
    return Intl.message(
      'Messages',
      name: 'messagesTitle',
      desc: 'The title of the messages screen with a single parameter',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: 'The title of the settings',
      args: [],
    );
  }

  /// `Theme`
  String get themeTitle {
    return Intl.message(
      'Theme',
      name: 'themeTitle',
      desc: '',
      args: [],
    );
  }

  /// `System Theme`
  String get systemThemeTitle {
    return Intl.message(
      'System Theme',
      name: 'systemThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightThemeTitle {
    return Intl.message(
      'Light Theme',
      name: 'lightThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkThemeTitle {
    return Intl.message(
      'Dark Theme',
      name: 'darkThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Light Gold`
  String get lightGoldThemeTitle {
    return Intl.message(
      'Light Gold',
      name: 'lightGoldThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dark Gold`
  String get darkGoldThemeTitle {
    return Intl.message(
      'Dark Gold',
      name: 'darkGoldThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Light Mint`
  String get lightMintThemeTitle {
    return Intl.message(
      'Light Mint',
      name: 'lightMintThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mint`
  String get darkMintThemeTitle {
    return Intl.message(
      'Dark Mint',
      name: 'darkMintThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Experimental Theme`
  String get experimentalThemeTitle {
    return Intl.message(
      'Experimental Theme',
      name: 'experimentalThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Item Details`
  String get itemDetailsTitle {
    return Intl.message(
      'Item Details',
      name: 'itemDetailsTitle',
      desc: 'The title of the Item Details screen',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Empty list`
  String get emptyList {
    return Intl.message(
      'Empty list',
      name: 'emptyList',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get tabHome {
    return Intl.message(
      'Home',
      name: 'tabHome',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tabSettings {
    return Intl.message(
      'Settings',
      name: 'tabSettings',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get newsScreen {
    return Intl.message(
      'News',
      name: 'newsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get disabledButtonTitle {
    return Intl.message(
      'Disabled',
      name: 'disabledButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Disabled Rounded`
  String get disabledRoundedButtonTitle {
    return Intl.message(
      'Disabled Rounded',
      name: 'disabledRoundedButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Disabled With Icon`
  String get disabledWithIconButtonTitle {
    return Intl.message(
      'Disabled With Icon',
      name: 'disabledWithIconButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enabled`
  String get enabledButtonTitle {
    return Intl.message(
      'Enabled',
      name: 'enabledButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `BorderRadius`
  String get borderRadiusButtonTitle {
    return Intl.message(
      'BorderRadius',
      name: 'borderRadiusButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `BorderSide`
  String get borderSideButtonTitle {
    return Intl.message(
      'BorderSide',
      name: 'borderSideButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `With Icon`
  String get iconButtonTitle {
    return Intl.message(
      'With Icon',
      name: 'iconButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `With Icon Padding`
  String get iconAndPaddingButtonTitle {
    return Intl.message(
      'With Icon Padding',
      name: 'iconAndPaddingButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Transparent`
  String get transparentButtonTitle {
    return Intl.message(
      'Transparent',
      name: 'transparentButtonTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
