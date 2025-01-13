import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeDetailsView extends StatelessWidget {
   const EmployeeDetailsView({super.key,required this.employee});
  final Employee employee ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 2,
        centerTitle: true,
        title: Text('Employee Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(employee.imageUrl),radius: 30,),
              Text('Name : ${employee.firstName} ${employee.lastName}',style: TextStyle(fontSize: 18),),
              Text('Address: ${employee.address} ',style: TextStyle(fontSize: 18),),
              Text('Date of Birth : ${employee.dob} ',style: TextStyle(fontSize: 18),),
              Text('Email : ${employee.email} ',style: TextStyle(fontSize: 18),),
              Text('Age : ${employee.age} ',style: TextStyle(fontSize: 18),),
              Text('Phone : ${employee.contactNumber} ',style: TextStyle(fontSize: 18),),
              Text('Salary : ${employee.salary} ',style: TextStyle(fontSize: 18),),


            ]
          ),
        ),
      ),
    );
  }
}
