import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:post_mobile/src/modules/auth/widgets/country.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isPasswordHidden = true;
  String _selectedCountry = 'Страна';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blue,
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            SizedBox(height: 25.0),
            SvgPicture.asset(
              'assets/icons/logo.svg',
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
            SizedBox(height: 30.0),
            Text(
              textAlign: TextAlign.center,
              'PostMobile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              'РЕГИСТРАЦИЯ',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'E-mail',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.transparent,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20.0.h),
            TextField(
              obscureText: _isPasswordHidden,
              decoration: InputDecoration(
                hintText: 'Пароль',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.transparent,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20.0.h),
            TextField(
              decoration: InputDecoration(
                hintText: 'Номер телефона',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.transparent,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20.0.h),
            GestureDetector(
              onTap: () async {
                final selectedCountry = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountrySelectorScreen(),
                  ),
                );
                if (selectedCountry != null) {
                  setState(() {
                    _selectedCountry = selectedCountry;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedCountry,
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.0.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'НАЧАТЬ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0.h),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Промокод',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Промокод',
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('ОТМЕНА'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Ввести промокод',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Я уже зарегистрирован. Войти.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
