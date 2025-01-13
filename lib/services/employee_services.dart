import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee_model.dart';

class EmployeeService {

   String endPoint = "https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001";
  Dio dio = Dio();

 Future<List<Employee>> getEmployeeData() async {
    List<Employee> employees = [];
    try {
      var response = await dio.get(endPoint);
      var data = response.data;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var cachedData = jsonEncode(data);
      prefs.setString("Employees Data",cachedData );
      data.forEach((employee) {
        employees.add(Employee.fromJson(employee));
      });
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error ${e.response!.data}');
      } else {
        print(e.message);
      }
    }
    return employees ;
  }
}