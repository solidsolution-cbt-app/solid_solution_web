import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/dialogs/add_topic_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/delete_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/logout_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/preview_pdf.dart';
import 'package:solidsolutionweb/components/dialogs/screen_loader_dialog.dart';
import 'package:solidsolutionweb/components/dialogs/should_add_new_question_dialog.dart';
import 'package:toastification/toastification.dart';

DialogService dialogService = DialogService();

class DialogService {
  void showErrorDialog({required String errorMessage}) {
    toastification.show(
      backgroundColor: Colors.red,
      showIcon: false,
      showProgressBar: false,
      title: const CustomTextHeader1(
        text: "Error",
        textColor: Colors.white,
        fontSize: 14,
      ),
      description: CustomTextBody1(
        text: errorMessage,
        textColor: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      autoCloseDuration: const Duration(seconds: 8),
    );
  }

  void showSuccessDialog({required String successMessage}) {
    toastification.show(
      backgroundColor: Colors.green,
      showIcon: false,
      showProgressBar: false,
      title: const CustomTextHeader1(
        text: "Success",
        textColor: Colors.white,
        fontSize: 14,
      ),
      description: CustomTextBody1(
        text: successMessage,
        textColor: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      autoCloseDuration: const Duration(seconds: 8),
    );
  }

  Future<dynamic> showLogOutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const LogOutDialog();
        });
  }

  Future<dynamic> showScreenLoader(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const ScreenLoader();
      },
    );
  }

  Future<dynamic> addTopicDialog(
    BuildContext context, {
    required String subject,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AddTopicDialog(
            subject: subject,
          );
        });
  }

  Future<dynamic> showDeleteDialog(
    BuildContext context, {
    required String deleteMessage,
    required Function() onTapDelete,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return DeleteDialog(
            deleteMessage: deleteMessage,
            onTapDelete: onTapDelete,
          );
        });
  }

  Future<dynamic> showCustomDialog(BuildContext context,
      {required Widget dialogWidget}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(child: dialogWidget);
        });
  }

  Future<dynamic> shouldAddNewQuestion(
    BuildContext context, {
    required String successMessage,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SHouldAddNewQuestionWidget(
            successMessage: successMessage,
          );
        });
  }

  void hideLoaderDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<dynamic> showPdf(BuildContext context, {required String pdfLink}) {
    return showDialog(
        context: context,
        builder: (context) {
          return PreviewPdfDialog(
            pdfLink: pdfLink,
          );
        });
  }
}
