import 'package:flutter/material.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeView extends StatelessWidget {
  const QRCodeView({Key? key, required this.qrCode}) : super(key: key);
  final String qrCode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width,
        height: Get.height * .5,
        child: QrImageView(
            data: qrCode,
            backgroundColor: KColors.of(context).background.withOpacity(.0),
            eyeStyle: QrEyeStyle(
              color: KColors.of(context).reBackground,
            )),
      ),
    );
  }
}

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key, required this.onDataCallback}) : super(key: key);
  final void Function(String?) onDataCallback;

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        widget.onDataCallback(scanData.code);

        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: KColors.of(context).accentColor,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutHeight: 300,
                cutOutWidth: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode : ${result!.code}',
                      textAlign: TextAlign.center,
                    )
                  : const Text(
                      'Scan a code',
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
          // Expanded(
          //     flex: 1,
          //     child: KTextFormField(
          //       height:  Get.height*.05,
          //       kWidth: Get.width*.2,
          //       onChanged: (v) {},
          //       hintText: 'add Code',
          //     ))
        ],
      ),
    );
  }
}
