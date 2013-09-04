#include <iostream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
char wait();

main()
{
	// Declare Variables
	char name[20];
	int feel;
	int yon;
	char eow[20];


	cout << "What is your name? ";
	cin >> name;
	cout << "\n";
	cout << "Hi " << name << " it is nice to meet you! \n";
	cout << "\n";
	cout << name << " Are you ready to play race day? \n";
	cout << "\n";
        cout << "Press 1 for yes, or 2 for no! \n";
	cin >> yon;
	
		if (yon == 2){
			cout << "Ok " << name << ", See ya next time! \n";
			return 0;
		}
		
		else if (yon == 1)
			cout << "OK then lets get started! \n";
			 
	cout << "\n";
	cout << "You are staging to ride your sportbike on the track.\n";
	cout << "The light is green and you enter the track in 5th place.\n";
	cout << "You start to accelerate, but there is a sharp turn coming up.\n";
	cout << "Do you accelerate hard getting ready to drag knee, or do you maintain speed?\n";
	cout << "Press 1 for accelerate or 2 for maintain ";
	cin >> feel;
	cout << "\n";
	{	
		if (feel == 1) {
		
			cout << "Oops it was too early in the race to accellerate, and you crashed.\n";
			return 0;
		} else if (feel == 2)
			cout << "Great the guy in front accelerated and spun out in the corner you are now in 4th place!!\n";
	}
	cout << "\n";
	cout << "After running the first lap in 4th place, you start getting excited. You give it more throttle in the straight.\n";
	cout << "You throttle hard in the beginning and pass another bike.\n";
	cout << "The corner is coming up fast do you wait to the last minute or start braking early?\n";
	cout << "type early or wait! ";
	cin >> eow;
			
		if (strcmp(eow, "early") == 0){
			cout << "You slowed down too soon before the corner and two people passed you.\n";
		}
		else if (strcmp(eow, "wait") == 0){
			cout << "You waited, squeezed the brakes perfectly, and passed two riders! \n";
			char wait();
			cout << "TEST!";
       		}
}
	// Subroutines *****

	char wait()
	{
//		char ioo[20];
		cout << "You are in 2nd place now!\n";
//		cout << "The time is running out and you need to make a risky move.\n";
//		cout << "You know you're tires are warmed up, so do you pass on the inside or outside?\n";
//		cout << "inside or outside? ";
//		cin >> ioo; 
//			if(strcmp(ioo, "inside") == 0){
//				cout << "You passed everybody on the inside then raced across the finish line in first place\n";
//			}
	}
