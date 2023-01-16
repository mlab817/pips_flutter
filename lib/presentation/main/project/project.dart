import 'package:flutter/material.dart';

import 'package:pips_flutter/presentation/resources/font_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key, required this.uuid, required this.title})
      : super(key: key);

  final String title;

  final String uuid;

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: Text('Pdf location'),
          ),
          // PdfPageNumber(
          //   controller: _pdfController,
          //   // When `loadingState != PdfLoadingState.success`  `pagesCount` equals null_
          //   builder: (_, state, loadingState, pagesCount) => Container(
          //     alignment: Alignment.bottomCenter,
          //     margin: const EdgeInsets.only(bottom: AppMargin.m20),
          //     child: Text(
          //       '${_pdfController.page}/${pagesCount ?? 0}',
          //       style: const TextStyle(fontSize: FontSize.s14),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
