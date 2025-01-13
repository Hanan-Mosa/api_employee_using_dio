# api_employee_using_dio
Fetch employee data using Dio and implement error handling using try-catch then parse JSON responses and map them to model then cache the employee list locally.
## models
create  model for employee (employee_model)
## services
 create employee service to take data form api, parse it & cache data using shared preferences .
 ## views 
  - Employee view
     - it has app bar and body is a list view that show listTile of name & salary and image in circleAvatar 
  - employee details view
     - it show details of employee when it selected.
### screenshot
| Employee view | Employee details View |
| ---- | ------------- | 
![employees](https://github.com/user-attachments/assets/d4ea0815-69cb-4e19-bde0-4e17d656f905) | ![employee_details](https://github.com/user-attachments/assets/39c81ca6-c975-4656-89c9-e611dbce88ec)

