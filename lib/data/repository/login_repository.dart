import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testpractice/data/datasource/web_services/logIn_web_services.dart';

class LoginRepository {
 final LogInWebServices logInWebServices;

  LoginRepository(this.logInWebServices);

 Future<Response> logIn(String email,String pass) async{

    return   await logInWebServices.logIn(email, pass);
 }
}