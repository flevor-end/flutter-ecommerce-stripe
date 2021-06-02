
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../constants.dart';
import '../sizec.dart';
import 'custom_bottom_navbar.dart';



class QRViews extends StatefulWidget {
  const QRViews({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewsState();
}

class _QRViewsState extends State<QRViews> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
   
        body: Column(
          children: <Widget>[
            SizedBox(height: 15,),

            Container(
              
            height: 33,
            width: Sizec.screenWidth,
            decoration: BoxDecoration(
              color: kSecondaryColor
            ),
              
              child: Row(children: [
         IconButton(
        padding:EdgeInsets.all(4.0),
        alignment: Alignment.topCenter,
        icon:Icon(Icons.arrow_back_ios),color: Colors.white,
        onPressed: (){ Navigator.pop(context);},
        iconSize: 25,
      ),
  
       Align(child: Text("ESCANEAR",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/130,),


            ],),),
             SizedBox(height: 25,),
            Text("AGREGA-CONTACTA-COMPARTE",style:TextStyle(color: kSecondaryColor,fontSize: 16,fontWeight:FontWeight.bold )),
            SizedBox(height: 10,),
            Expanded(flex: 3, child: Container(
              padding:EdgeInsets.all(15) ,
              
              child: _buildQrView(context))),
            Expanded(
              flex: 1, 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                           
                             color: Colors.white,
                              onPressed: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  return Icon(Icons.flash_auto,color:kSecondaryColor);
                                },
                              )),
                              SizedBox(width: 20,),
                          if (result != null)
                      Text(
                          'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}',style: TextStyle(fontSize:14),)
                    else
                      Text('',style: TextStyle(fontSize:14),),
                        // Container(
                        //   margin: EdgeInsets.all(8),
                        //   child: ElevatedButton(
                        //       onPressed: () async {
                        //         await controller?.flipCamera();
                        //         setState(() {});
                        //       },
                        //       child: FutureBuilder(
                        //         future: controller?.getCameraInfo(),
                        //         builder: (context, snapshot) {
                        //           if (snapshot.data != null) {
                        //             return Text(
                        //                 'Camera facing ${describeEnum(snapshot.data)}');
                        //           } else {
                        //             return Text('loading');
                        //           }
                        //         },
                        //       )),
                        // )
                        // 
                          MaterialButton(   color: Colors.white,
      
        onPressed: () {  },
        child: Icon(Icons.image,),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Container(
                        //   margin: EdgeInsets.all(8),
                        //   child: ElevatedButton(
                        //     onPressed: () async {
                        //       await controller?.pauseCamera();
                        //     },
                        //     child: Text('pause', style: TextStyle(fontSize: 20)),
                        //   ),
                        // // ),
                        // Container(
                        //   margin: EdgeInsets.all(8),
                        //   child: ElevatedButton(
                        //     onPressed: () async {
                        //       await controller?.pauseCamera();
                        //        controller?.resumeCamera();
                        //     },
                        //     child: Text('resume', style: TextStyle(fontSize: 20)),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            
          ],
        ),
        bottomNavigationBar:  CustomBottomNavBar(color: false,color2: false,color3: false,),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return ClipRRect  (
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}