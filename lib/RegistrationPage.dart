// import 'package:flutter/material.dart';
// //import 'package:login_coachapp/main.dart';

// class RegistrationPage extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();
//   String _selectedGender = 'Male'; 
//   String _selectedRole = 'Player'; 

//   final List<String> genderOptions = ['Male', 'Female', 'Other'];
//   final List<String> roleOptions = ['Player', 'Coach'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Image.asset(
//             'assets/images/reg.jpg',
//             fit: BoxFit.cover,
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Card(
//                 elevation: 8.0,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Container(
//                         width: 300,
//                         child: TextField(
//                           controller: _emailController,
//                           decoration: const InputDecoration(labelText: 'Email'),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Container(
//                         width: 300,
//                         child: TextField(
//                           controller: _passwordController,
//                           decoration: const InputDecoration(labelText: 'Password'),
//                           obscureText: true,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Container(
//                         width: 300,
//                         child: DropdownButtonFormField(
//                           value: _selectedGender,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedGender = value.toString();
//                             });
//                           },
//                           items: genderOptions.map((gender) {
//                             return DropdownMenuItem(
//                               value: gender,
//                               child: Text(gender),
//                             );
//                           }).toList(),
//                           decoration: InputDecoration(labelText: 'Gender'),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Container(
//                         width: 300,
//                         child: TextField(
//                           controller: _ageController,
//                           decoration: const InputDecoration(labelText: 'Age'),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Container(
//                         width: 300,
//                         child: TextField(
//                           controller: _weightController,
//                           decoration: const InputDecoration(labelText: 'Weight'),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Container(
//                         width: 300,
//                         child: DropdownButtonFormField(
//                           value: _selectedRole,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedRole = value.toString();
//                             });
//                           },
//                           items: roleOptions.map((role) {
//                             return DropdownMenuItem(
//                               value: role,
//                               child: Text(role),
//                             );
//                           }).toList(),
//                           decoration: InputDecoration(labelText: 'Coach or Player'),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Process registration logic here
//                           // You can access the entered values using _emailController.text, _passwordController.text, etc.
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => LoginPage(),
//                             ),
//                           );
//                         },
//                         child: const Text('Register'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
  
//   void setState(Null Function() param0) {}
// }
import 'package:flutter/material.dart';
import 'package:login_coachapp/main.dart';
import 'package:provider/provider.dart';

class RegistrationViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String? selectedGender = 'Male';
  String? selectedRole = 'Player';

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> roleOptions = ['Player', 'Coach'];

  void setGender(String? value) {
    selectedGender = value;
    notifyListeners();
  }

  void setRole(String? value) {
    selectedRole = value;
    notifyListeners();
  }

  void registerUser(BuildContext context) {
    // Process registration logic here
    // You can access the entered values using controllers

    // Navigate to another page (e.g., LoginPage)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  final RegistrationViewModel viewModel = RegistrationViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/reg.jpg',
              fit: BoxFit.cover,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 300,
                          child: TextField(
                            controller: viewModel.emailController,
                            decoration: const InputDecoration(labelText: 'Email'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: viewModel.passwordController,
                            decoration: const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: 300,
                          child: DropdownButtonFormField(
                            value: viewModel.selectedGender,
                            onChanged: viewModel.setGender,
                            items: viewModel.genderOptions.map((gender) {
                              return DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              );
                            }).toList(),
                            decoration: InputDecoration(labelText: 'Gender'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: viewModel.ageController,
                            decoration: const InputDecoration(labelText: 'Age'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: viewModel.weightController,
                            decoration: const InputDecoration(labelText: 'Weight'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: 300,
                          child: DropdownButtonFormField(
                            value: viewModel.selectedRole,
                            onChanged: viewModel.setRole,
                            items: viewModel.roleOptions.map((role) {
                              return DropdownMenuItem(
                                value: role,
                                child: Text(role),
                              );
                            }).toList(),
                            decoration: InputDecoration(labelText: 'Coach or Player'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            viewModel.registerUser(context);
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
