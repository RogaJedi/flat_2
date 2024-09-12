import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flat2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Padding(
            padding: const EdgeInsets.only(bottom: 150.0),  // Optional: Adjust the top padding
            child: Text('Авторизация', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),
          ),

          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEBEBEB),
              hintText: 'Логин',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
            ),),
          ),


          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEBEBEB),
              hintText: 'Пароль',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
            ),),
          ),

          //CHECKBOX HERE
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyCheckboxWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print('tapped');
              },
              child: Center(
                child: Container(width: 1000, height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFF0B6BFE)),
                  child: const Center(child: Text('Войти', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16))),),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print('2nd tapped');
              },
              child: Center(
                child: Container(width: 1000, height: 60,
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF2595B7), width: 2.0,), borderRadius: BorderRadius.circular(8), color: Colors.white),
                  child: const Center(child: Text('Регистрация', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2595B7), fontSize: 16))),),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: GestureDetector(
              onTap: () {
                print('hyperlink tapped');
              },
              child: const Text('Восстановить пароль', style: TextStyle(color: Colors.grey, fontSize: 16),),
            ),
          ),

        ],
      ),
    );
  }
}

class MyCheckboxWidget extends StatefulWidget {
  @override
  _MyCheckboxWidgetState createState() => _MyCheckboxWidgetState();
}

class _MyCheckboxWidgetState extends State<MyCheckboxWidget> {
  bool _isChecked = false;

  void _toggleCheckbox(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: _toggleCheckbox,
          activeColor: Color(0xFF0B6BFE),
          side: WidgetStateBorderSide.resolveWith(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return BorderSide(
                  color: Colors.blue, // Border color when checked
                  width: 2.0, // Border width when checked
                );
              }
              return BorderSide(
                color: Colors.grey, // Border color when unchecked
                width: 2.0, // Border width when unchecked
              );
            },
          ),
        ),
        const Text("Запомнить меня", style: TextStyle(color: Colors.grey, fontSize: 16)),
      ],
    );
  }
}
