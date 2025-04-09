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

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Change Color`
  String get changeColor {
    return Intl.message(
      'Change Color',
      name: 'changeColor',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Change app language`
  String get changeAppLang {
    return Intl.message(
      'Change app language',
      name: 'changeAppLang',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get en {
    return Intl.message(
      'Setting',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get dropdown1 {
    return Intl.message(
      'العربية',
      name: 'dropdown1',
      desc: '',
      args: [],
    );
  }

  /// `EN`
  String get dropdown2 {
    return Intl.message(
      'EN',
      name: 'dropdown2',
      desc: '',
      args: [],
    );
  }

  /// `Your Ai Skin Expert`
  String get yourAiSkinExp {
    return Intl.message(
      'Your Ai Skin Expert',
      name: 'yourAiSkinExp',
      desc: '',
      args: [],
    );
  }

  /// `Your skin health, powered by Ai`
  String get yourSkinHealth {
    return Intl.message(
      'Your skin health, powered by Ai',
      name: 'yourSkinHealth',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Analysis`
  String get analysis {
    return Intl.message(
      'Analysis',
      name: 'analysis',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message(
      'Videos',
      name: 'videos',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Articles`
  String get articles {
    return Intl.message(
      'Articles',
      name: 'articles',
      desc: '',
      args: [],
    );
  }

  /// `Colleges`
  String get colleges {
    return Intl.message(
      'Colleges',
      name: 'colleges',
      desc: '',
      args: [],
    );
  }

  /// `platforms`
  String get platforms {
    return Intl.message(
      'platforms',
      name: 'platforms',
      desc: '',
      args: [],
    );
  }

  /// `Upload your image to make Ai to analylize it`
  String get uploadPageTitle {
    return Intl.message(
      'Upload your image to make Ai to analylize it',
      name: 'uploadPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload image here`
  String get uploadImageHere {
    return Intl.message(
      'Upload image here',
      name: 'uploadImageHere',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get Upload {
    return Intl.message(
      'Upload',
      name: 'Upload',
      desc: '',
      args: [],
    );
  }

  /// `Explore AI with Educational Videos.`
  String get videosPageTitle {
    return Intl.message(
      'Explore AI with Educational Videos.',
      name: 'videosPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Introduction to AI`
  String get video1Title {
    return Intl.message(
      'Introduction to AI',
      name: 'video1Title',
      desc: '',
      args: [],
    );
  }

  /// `Learn the basics of Artificial Intelligence.`
  String get video1Sub {
    return Intl.message(
      'Learn the basics of Artificial Intelligence.',
      name: 'video1Sub',
      desc: '',
      args: [],
    );
  }

  /// `Machine Learning Explained`
  String get video2Title {
    return Intl.message(
      'Machine Learning Explained',
      name: 'video2Title',
      desc: '',
      args: [],
    );
  }

  /// `A deep dive into machine learning concepts.`
  String get video2Sub {
    return Intl.message(
      'A deep dive into machine learning concepts.',
      name: 'video2Sub',
      desc: '',
      args: [],
    );
  }

  /// `AI in Healthcare`
  String get video3Title {
    return Intl.message(
      'AI in Healthcare',
      name: 'video3Title',
      desc: '',
      args: [],
    );
  }

  /// `How AI is transforming the medical field.`
  String get video3Sub {
    return Intl.message(
      'How AI is transforming the medical field.',
      name: 'video3Sub',
      desc: '',
      args: [],
    );
  }

  /// `Neural Networks Demystified`
  String get video4Title {
    return Intl.message(
      'Neural Networks Demystified',
      name: 'video4Title',
      desc: '',
      args: [],
    );
  }

  /// `Understanding how neural networks process data.`
  String get video4Sub {
    return Intl.message(
      'Understanding how neural networks process data.',
      name: 'video4Sub',
      desc: '',
      args: [],
    );
  }

  /// `Watch`
  String get watch {
    return Intl.message(
      'Watch',
      name: 'watch',
      desc: '',
      args: [],
    );
  }

  /// `Stay Updated with Exciting Events and Community Activities`
  String get eventsPageTitle {
    return Intl.message(
      'Stay Updated with Exciting Events and Community Activities',
      name: 'eventsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you a member?`
  String get areYouMember {
    return Intl.message(
      'Are you a member?',
      name: 'areYouMember',
      desc: '',
      args: [],
    );
  }

  /// `Join us to explore our key events.`
  String get joinUsTo {
    return Intl.message(
      'Join us to explore our key events.',
      name: 'joinUsTo',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Skinalyze, your AI-powered skin health assistant. Our advanced AI technology helps you analyze skin conditions with just a simple photo. Get instant insights and recommendations to take better care of your skin. ✔ Snap a photo and let AI analyze your skin. ✔ Learn skincare tips tailored to your needs. ✔ Supports both Arabic and English for a better user experience. ✔ Enjoy a sleek Dark Mode for comfortable use at night. ✔ Stay updated with the latest dermatology research and AI advancements. While our AI provides helpful guidance, always consult a dermatologist for medical advice. Explore our app and take the first step toward healthier skin today!`
  String get aboutUsDescrb {
    return Intl.message(
      'Welcome to Skinalyze, your AI-powered skin health assistant. Our advanced AI technology helps you analyze skin conditions with just a simple photo. Get instant insights and recommendations to take better care of your skin. ✔ Snap a photo and let AI analyze your skin. ✔ Learn skincare tips tailored to your needs. ✔ Supports both Arabic and English for a better user experience. ✔ Enjoy a sleek Dark Mode for comfortable use at night. ✔ Stay updated with the latest dermatology research and AI advancements. While our AI provides helpful guidance, always consult a dermatologist for medical advice. Explore our app and take the first step toward healthier skin today!',
      name: 'aboutUsDescrb',
      desc: '',
      args: [],
    );
  }

  /// `Cambridge`
  String get cambridge {
    return Intl.message(
      'Cambridge',
      name: 'cambridge',
      desc: '',
      args: [],
    );
  }

  /// `Oxford`
  String get oxford {
    return Intl.message(
      'Oxford',
      name: 'oxford',
      desc: '',
      args: [],
    );
  }

  /// `Stanford`
  String get stanford {
    return Intl.message(
      'Stanford',
      name: 'stanford',
      desc: '',
      args: [],
    );
  }

  /// `MIT`
  String get mIT {
    return Intl.message(
      'MIT',
      name: 'mIT',
      desc: '',
      args: [],
    );
  }

  /// `AI can map and influence human desires.`
  String get collegeDescrb1 {
    return Intl.message(
      'AI can map and influence human desires.',
      name: 'collegeDescrb1',
      desc: '',
      args: [],
    );
  }

  /// `Oxford partners with tech leaders for AI research.`
  String get collegeDescrb2 {
    return Intl.message(
      'Oxford partners with tech leaders for AI research.',
      name: 'collegeDescrb2',
      desc: '',
      args: [],
    );
  }

  /// `US leads AI innovation, surpassing China.`
  String get collegeDescrb3 {
    return Intl.message(
      'US leads AI innovation, surpassing China.',
      name: 'collegeDescrb3',
      desc: '',
      args: [],
    );
  }

  /// `Exploring the philosophy of artificial intelligence.`
  String get collegeDescrb4 {
    return Intl.message(
      'Exploring the philosophy of artificial intelligence.',
      name: 'collegeDescrb4',
      desc: '',
      args: [],
    );
  }

  /// `Colleges Articles`
  String get collegesArticles {
    return Intl.message(
      'Colleges Articles',
      name: 'collegesArticles',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `The New York Times`
  String get theNewYorkTimes {
    return Intl.message(
      'The New York Times',
      name: 'theNewYorkTimes',
      desc: '',
      args: [],
    );
  }

  /// `CNN`
  String get cNN {
    return Intl.message(
      'CNN',
      name: 'cNN',
      desc: '',
      args: [],
    );
  }

  /// `The Guardian`
  String get theGuardian {
    return Intl.message(
      'The Guardian',
      name: 'theGuardian',
      desc: '',
      args: [],
    );
  }

  /// `Wikipedia`
  String get wikipedia {
    return Intl.message(
      'Wikipedia',
      name: 'wikipedia',
      desc: '',
      args: [],
    );
  }

  /// `How AI is reshaping the future of healthcare.`
  String get articlsDes1 {
    return Intl.message(
      'How AI is reshaping the future of healthcare.',
      name: 'articlsDes1',
      desc: '',
      args: [],
    );
  }

  /// `The role of AI in modern medical advancements.`
  String get articlsDes2 {
    return Intl.message(
      'The role of AI in modern medical advancements.',
      name: 'articlsDes2',
      desc: '',
      args: [],
    );
  }

  /// `AI-powered diagnostics: A revolution in medicine.`
  String get articlsDes3 {
    return Intl.message(
      'AI-powered diagnostics: A revolution in medicine.',
      name: 'articlsDes3',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive insights on AI in healthcare.`
  String get articlsDes4 {
    return Intl.message(
      'Comprehensive insights on AI in healthcare.',
      name: 'articlsDes4',
      desc: '',
      args: [],
    );
  }

  /// `Platforms Articles`
  String get platformsArticles {
    return Intl.message(
      'Platforms Articles',
      name: 'platformsArticles',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout ?`
  String get areYouSure {
    return Intl.message(
      'Are you sure you want to logout ?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Skinalyze uses AI to analyze your skin from a simple photo, providing instant insights and guidance for better skin health.`
  String get authenticationPageDescb {
    return Intl.message(
      'Skinalyze uses AI to analyze your skin from a simple photo, providing instant insights and guidance for better skin health.',
      name: 'authenticationPageDescb',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alredyHave {
    return Intl.message(
      'Already have an account?',
      name: 'alredyHave',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAcc {
    return Intl.message(
      'Create account',
      name: 'createAcc',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `First name must be at least 3 characters`
  String get firstNameMust {
    return Intl.message(
      'First name must be at least 3 characters',
      name: 'firstNameMust',
      desc: '',
      args: [],
    );
  }

  /// `Last name must be at least 3 characters`
  String get lastNameMust {
    return Intl.message(
      'Last name must be at least 3 characters',
      name: 'lastNameMust',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEntreAvalidate {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEntreAvalidate',
      desc: '',
      args: [],
    );
  }

  /// `Email*`
  String get emailHint {
    return Intl.message(
      'Email*',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Password*`
  String get PasswordHint {
    return Intl.message(
      'Password*',
      name: 'PasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters, including one uppercase letter, one number, and one special character.`
  String get passwordValidation {
    return Intl.message(
      'Password must contain at least 8 characters, including one uppercase letter, one number, and one special character.',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email adress`
  String get pleaseVerifyEmail {
    return Intl.message(
      'Please verify your email adress',
      name: 'pleaseVerifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
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

  /// `try agian`
  String get tryagian {
    return Intl.message(
      'try agian',
      name: 'tryagian',
      desc: '',
      args: [],
    );
  }

  /// `No details found in response`
  String get noDetailsInResponse {
    return Intl.message(
      'No details found in response',
      name: 'noDetailsInResponse',
      desc: '',
      args: [],
    );
  }

  /// `تم تغيير اللغة بنجاح`
  String get langSnakBar {
    return Intl.message(
      'تم تغيير اللغة بنجاح',
      name: 'langSnakBar',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Lesson`
  String get lesson {
    return Intl.message(
      'Lesson',
      name: 'lesson',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `First name*`
  String get firstNameHint {
    return Intl.message(
      'First name*',
      name: 'firstNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Last name*`
  String get lastNameHint {
    return Intl.message(
      'Last name*',
      name: 'lastNameHint',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
