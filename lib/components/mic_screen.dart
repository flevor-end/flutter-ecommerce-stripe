import 'package:flutter/material.dart';
import 'package:masdamas/components/camscreen.dart';
import 'package:masdamas/models/Product.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../constants.dart';
import '../sizec.dart';
import 'dialogb.dart';



const languages = const [
  const Language('Francais', 'fr_FR'),
  const Language('English', 'en_US'),
  const Language('Pусский', 'ru_RU'),
  const Language('Italiano', 'it_IT'),
  const Language('Español', 'es_ES'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class Micscreen extends StatefulWidget {
  static String routeName = 'micscreen';
  @override
  _MicscreenState createState() => new _MicscreenState();
}

class _MicscreenState extends State<Micscreen> {
  final TextEditingController _textEditingController = TextEditingController();
  int index;
  List<Product> products = [];
  bool isItemClicked = false;
  List<Product> results = [];
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

  //String _currentLocale = 'en_US';
  Language selectedLang = languages.first;

  @override
  initState() {
    super.initState();
    // activateSpeechRecognizer();
        super.initState();

    _textEditingController
      ..addListener(() {
        setState(() {
          results = products
              .where(
                (element) =>
                    element.title.startsWith(_textEditingController.text),
              )
              .toList();
          if (results.length > 3) {
            results = results.sublist(0, 0);
          }
        });
      });
  }

    @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {});
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {});
  }

  void _clearSearchQuery() {
    setState(() {
      _textEditingController.clear();
    });
  }

  Widget _getProduct() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Wrap(
          children: [
            ...List.generate(
              results.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10),
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [kDefaultShadow],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRichText(String result) {
    return RichText(
      text: _textEditingController.text.length > 0
          ? TextSpan(
              children: [
                if (_textEditingController.text.length > 0)
                  TextSpan(
                    text:
                        result.substring(0, _textEditingController.text.length),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ),
                TextSpan(
                  text: result.substring(
                      _textEditingController.text.length, result.length),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[400],
                  ),
                )
              ],
            )
          : TextSpan(
              text: result,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[400],
              ),
            ),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // void activateSpeechRecognizer() {
  //   print('_MyAppState.activateSpeechRecognizer... ');
  //   _speech = new SpeechRecognition();
  //   _speech.setAvailabilityHandler(onSpeechAvailability);
  //   _speech.setCurrentLocaleHandler(onCurrentLocale);
  //   _speech.setRecognitionStartedHandler(onRecognitionStarted);
  //   _speech.setRecognitionResultHandler(onRecognitionResult);
  //   _speech.setRecognitionCompleteHandler(onRecognitionComplete);
  //   _speech
  //       .activate()
  //       .then((res) => setState(() => _speechRecognitionAvailable = res));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
      
          actions: [
            new PopupMenuButton<Language>(
              onSelected: _selectLangHandler,
              itemBuilder: (BuildContext context) => _buildLanguagesWidgets,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left:45,right:20),
          child: Column(
           
            children: [
             new Center(
                    child: new Row(
               
                      children: [

Column(children: [
IconButton(
icon: Icon(
Icons.search,
color: kPrimaryColor,
size: 33,
),
onPressed: (){  showDialog(context: context, builder: (buildcontext) =>  DialogB());}),
Text("Busqueda",style:TextStyle(fontSize: 15,fontWeight:FontWeight.bold ) ,)
],),

SizedBox(width: 30,),
MaterialButton(
onPressed: () {},
color: kPrimaryColor,
textColor: Colors.white,
child: Icon(
Icons.mic,
size: 35,
),
padding: EdgeInsets.all(20),
shape: CircleBorder(),
),
SizedBox(width: 30,),
Column(children: [
IconButton(
icon: Icon(
Icons.camera_alt_outlined,
color: kPrimaryColor,
size: 33,
),
onPressed: (){showDialog(context: context, builder: (buildcontext) =>  Camscreen());}),
Text("Camara",style:TextStyle(fontSize: 15,fontWeight:FontWeight.bold ) ,)
],),
                        // new Expanded(
                        //     child: new Container(
                        //         padding: const EdgeInsets.all(8.0),
                        //         color: Colors.grey.shade200,
                        //         child: new Text(transcription))),
                        // _buildButton(
                        //   onPressed: _speechRecognitionAvailable && !_isListening
                        //       ? () => start()
                        //       : null,
                        //   label: _isListening
                        //       ? 'Listening...'
                        //       : 'Listen (${selectedLang.code})',
                        // ),
                        // _buildButton(
                        //   // onPressed: _isListening ? () => cancel() : null,
                        //   label: 'Cancel',
                        // ),
                        // _buildButton(
                        //   // onPressed: _isListening ? () => stop() : null,
                        //   label: 'Stop',
                        // ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
    
    );
  }

  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => new CheckedPopupMenuItem<Language>(
            value: l,
            checked: selectedLang == l,
            child: new Text(l.name),
          ))
      .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }

  Widget _buildButton({String label, VoidCallback onPressed}) => new Padding(
      padding: new EdgeInsets.all(12.0),
      child: new RaisedButton(
        color: Colors.cyan.shade600,
        onPressed: onPressed,
        child: new Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ));

  // void start() => _speech
  //     .listen(locale: selectedLang.code)
  //     .then((result) => print('_MyAppState.start => result ${result}'));

  // void cancel() =>
  //     _speech.cancel().then((result) => setState(() => _isListening = result));

  // void stop() =>
  //     _speech.stop().then((result) => setState(() => _isListening = result));

  // void onSpeechAvailability(bool result) =>
  //     setState(() => _speechRecognitionAvailable = result);

  // void onCurrentLocale(String locale) {
  //   print('_MyAppState.onCurrentLocale... $locale');
  //   setState(
  //       () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

//   void onRecognitionStarted() => setState(() => _isListening = true);

//   void onRecognitionResult(String text) => setState(() => transcription = text);

//   void onRecognitionComplete() => setState(() => _isListening = false);
// }