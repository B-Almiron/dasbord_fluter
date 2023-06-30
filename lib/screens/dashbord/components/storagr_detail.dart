import 'package:daasd12/constants.dart';
import 'package:flutter/material.dart';

import 'chart.dart';
import 'storage_info_card.dart';


class StorageDetail extends StatelessWidget {
  const StorageDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Storage Details",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
          StorageInfoCard(
            amountOfFiles: '1.3 GB',
            numOfFiels: 1335,
            svgSrc: 'assets/icons/Documents.svg',
            title: 'Documentos',
          ),
          StorageInfoCard(
            amountOfFiles: '1.3 GB',
            numOfFiels: 1335,
            svgSrc: 'assets/icons/media.svg',
            title: 'Documentos',
          ),
          StorageInfoCard(
            amountOfFiles: '1.3 GB',
            numOfFiels: 1335,
            svgSrc: 'assets/icons/folder.svg',
            title: 'Documentos',
          ),
          StorageInfoCard(
            amountOfFiles: '1.3 GB',
            numOfFiels: 1335,
            svgSrc: 'assets/icons/unknown.svg',
            title: 'Documentos',
          )
        ],
      ),
    );
  }
}

