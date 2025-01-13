import 'dart:convert';
import 'package:api_employee_dio/views/employee_details_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee_model.dart';


class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  bool loaded = true;
  List<Employee> cachedEmployees = [];

  getEmployeeDataCached()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var employeeData =jsonDecode(prefs.getString('Employees Data')??"") ;
    employeeData.forEach((item){
      cachedEmployees.add(Employee.fromJson(item));
    });
    setState(() {

    });
    loaded = false;

  }


  @override
  void initState() {
    super.initState();
    getEmployeeDataCached();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Employees',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: loaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(itemCount: cachedEmployees.length,
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeDetailsView(employee: cachedEmployees[index],)));
            },
            child: ListTile(
              leading: CircleAvatar(backgroundImage:  NetworkImage(cachedEmployees[index].imageUrl,),radius: 20,),
                    title: Text("${cachedEmployees[index].firstName} ${cachedEmployees[index].lastName}"),
              subtitle:Text("${cachedEmployees[index].salary}"),
              trailing: Icon(Icons.arrow_forward_ios),

                  ),
          )),
    );
  }
}


