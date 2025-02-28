import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Generate mocks with build_runner: flutter pub run build_runner build
@GenerateMocks([FlutterLocalization])

import 'unit_test.mocks.dart';

void main() {
  late MockFlutterLocalization mockLocalization;

  setUp(() {
    mockLocalization = MockFlutterLocalization();
    
    // Setup mock responses
    when(mockLocalization.currentLocale).thenReturn(const Locale('en'));
    when(mockLocalization.translate('ml')).thenAnswer((_) {
      when(mockLocalization.currentLocale).thenReturn(const Locale('ml'));
    });
    when(mockLocalization.translate('en')).thenAnswer((_) {
      when(mockLocalization.currentLocale).thenReturn(const Locale('en'));
    });
  });

  test('Switch from English to Malayalam', () {
    // Initial state
    expect(mockLocalization.currentLocale?.languageCode, 'en');
    
    // Perform language switch
    if (mockLocalization.currentLocale?.languageCode == 'en') {
      mockLocalization.translate('ml');
    }
    
    // Verify
    expect(mockLocalization.currentLocale?.languageCode, 'ml');
    verify(mockLocalization.translate('ml')).called(1);
  });

  test('Switch from Malayalam to English', () {
    // Set initial state to Malayalam
    when(mockLocalization.currentLocale).thenReturn(const Locale('ml'));
    
    // Perform language switch
    if (mockLocalization.currentLocale?.languageCode == 'ml') {
      mockLocalization.translate('en');
    }
    
    // Verify
    expect(mockLocalization.currentLocale?.languageCode, 'en');
    verify(mockLocalization.translate('en')).called(1);
  });

  test('Handle unexpected current locale', () {
    // Set to unexpected language
    when(mockLocalization.currentLocale).thenReturn(const Locale('fr'));
    
    // Perform language switch
    if (mockLocalization.currentLocale?.languageCode == 'en') {
      mockLocalization.translate('ml');
    } else {
      mockLocalization.translate('en');
    }
    
    // Verify fallback to English
    expect(mockLocalization.currentLocale?.languageCode, 'en');
    verify(mockLocalization.translate('en')).called(1);
  });
}