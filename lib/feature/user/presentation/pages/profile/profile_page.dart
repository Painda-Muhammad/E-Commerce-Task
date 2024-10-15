// import 'dart:io';


// import 'package:e_commerce_task/core/commom_widgets/buttonContainer.dart';
// import 'package:e_commerce_task/core/commom_widgets/text_field_container.dart';
// import 'package:e_commerce_task/feature/user/domain/entity/user_entity.dart';
// import 'package:e_commerce_task/feature/user/presentation/cubit/auth/cubit/auth_cubit.dart';
// import 'package:e_commerce_task/feature/user/presentation/cubit/single_user/cubit/single_user_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:image_picker/image_picker.dart';


// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController statusController = TextEditingController();

//   File? selectedImage;
//   Future<void> _pickImage() async {
//     final pickImage = await ImagePicker()
//         .pickImage(source: ImageSource.camera, imageQuality: 50);

//     final imagePath = File(pickImage!.path);
//     setState(() {
//       selectedImage = imagePath;
//     });
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     statusController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return BlocBuilder<SingleUserCubit,SingleUserState>(builder:(context, state) {
//         if(state is SingleUserLoaded){
//           return  _buildContent(context, state.singleUser);
//         }
//         return const Center(child: CircularProgressIndicator(),);
//     },);
//   }

//   Column _buildContent(BuildContext context,UserEntity userData) {
//     nameController = TextEditingController(text:userData.name );
//     emailController = TextEditingController(text: userData.email);
//     statusController = TextEditingController(text: userData.status);
//     return Column(
//       children: [
//          CircleAvatar(
//             radius: 70,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 NetworkImageWidget(
//                   imageFile: selectedImage,
//                   borderRadiusImageFile: 45,
//                   imageFileBoxFit: BoxFit.cover ,
//                   placeHolderBoxFit: BoxFit.cover,
//                   placeHolder: 'assets/person_icon.jpg',
//                 ),
//                 Positioned(
//                     bottom: -20,
//                     right: 5,
//                     child: InkWell(
//                         onTap: _pickImage,
//                         child: Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               color: Theme.of(context).colorScheme.onPrimary,
//                               borderRadius: BorderRadius.circular(20),
//                               ),
//                           child:  Icon(Icons.add,color: Theme.of(context).colorScheme.primary,),
//                         )))
//               ],
//             )),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFieldContainer(
//           title: 'name',
//           controller: nameController,
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         AbsorbPointer(
//             child: TextFieldContainer(
//                 title:'email', controller: emailController)),
//        const SizedBox(
//           height: 10,
//         ),
//         TextFieldContainer(title: 'status', controller: statusController),
//         const SizedBox(
//           height: 25,
//         ),
//         ButtonContainer(ontap: _submitUpdateData, title: 'Update Profile'),
//          SizedBox(
//           height: MediaQuery.of(context).size.height*.25,
//         ),
       
      
//          ButtonContainer(ontap: (){
//           context.read<AuthCubit>().loggedOut();
//          }, title: 'Logout!')
//       ],
//     );
//   }

//   _submitUpdateData(){
//     BlocProvider.of<SingleUserCubit>(context).updateUserUsecase;
//   }
  
// }
