import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/dialogs/add_topic_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/error_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/logout_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/preview_pdf.dart';
import 'package:solidsolutionweb/components/dialogs/screen_loader_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/should_add_new_question_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/success_dialog.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/core/navigation_service.dart';

DialogService dialogService = DialogService();

class DialogService {
  final newContext = locatorX<NavigationService>().navigatorKey.currentContext!;
  Future<dynamic> showErrorDialog({required String errorMessage}) {
    return showDialog(
        context: newContext,
        builder: (context) {
          return ErrorDialog(
            errorMessage: errorMessage,
          );
        });
  }

  Future<dynamic> showSuccessDialog({required String successMessage}) {
    return showDialog(
        context: newContext,
        builder: (context) {
          return SuccessDialog(
            successMessage: successMessage,
          );
        });
  }

  Future<dynamic> showLogOutDialog() {
    return showDialog(
        context: newContext,
        builder: (context) {
          return const LogOutDialog();
        });
  }

  Future<dynamic> showScreenLoader() {
    return showDialog(
      context: newContext,
      // barrierDismissible: false,
      builder: (context) {
        return const ScreenLoader();
      },
    );
  }

  Future<dynamic> addTopicDialog({required String subject}) {
    return showDialog(
        barrierDismissible: false,
        context: newContext,
        builder: (context) {
          return AddTopicDialog(
            subject: subject,
          );
        });
  }

  Future<dynamic> shouldAddNewQuestion({
    required String successMessage,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: newContext,
        builder: (context) {
          return SHouldAddNewQuestionWidget(
            successMessage: successMessage,
          );
        });
  }

  void hideLoaderDialog() {
    Navigator.of(newContext, rootNavigator: true).pop();
  }

  Future<dynamic> showPdf({required String pdfLink}) {
    return showDialog(
        context: newContext,
        builder: (context) {
          return PreviewPdfDialog(
            pdfLink: pdfLink,
          );
        });
  }
}
