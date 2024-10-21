import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.055,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const RotatedBox(
                      quarterTurns: 1,
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 130,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Joined',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            'June 2021',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Displaying user's name
                Text(
                  '${userProvider.email}',  // You can change this to user name when available
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildDivider(),
                _buildInfoRow('Email', userProvider.email),
                _buildDivider(),
                _buildInfoRow('Gender', userProvider.gender),
                _buildDivider(),
                _buildInfoRow('Age', '${userProvider.age}'),
                _buildDivider(),
                _buildInfoRow('Height', '${userProvider.height} cm'),
                _buildDivider(),
                _buildInfoRow('Weight', '${userProvider.weight} kg'),
                _buildDivider(),
                _buildInfoRow('Activity Level', userProvider.activityLevel),
                _buildDivider(),
                _buildInfoRow('Goal', userProvider.goal),
                const Spacer(),
                _buildDivider(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
                _buildDivider(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.shade200.withOpacity(0.15),
      thickness: 1,
      height: 16,
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 18),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}

// profilePage.dart
class IconRow extends StatelessWidget {
  final String text;
  final Function onTap;

  const IconRow({required this.text, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white),
        ],
      ),
    );
  }
}

