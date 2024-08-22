import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ErrorHandlingWidget extends StatelessWidget {
  final Object error;

  const ErrorHandlingWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    if (error is DioException) {
      errorMessage = 'Failed to fetch data: ';
    } else {
      errorMessage = 'An unexpected error occurred';
    }

    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }
}


class CRichText extends StatelessWidget {
  const CRichText({super.key, required this.header, required this.value});

  final String header, value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: header,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      TextSpan(
        text: value,
        style: const TextStyle(color: Colors.black),
      )
    ]));
  }
}
