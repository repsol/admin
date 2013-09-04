#include <iostream>
using namespace std;
int main()
{
	int feel;
	cout << "How are you feeling?\n";
	cout << "Press 1 for shitty or 2 for great!";
	cin >> feel;
	
		if (feel == 1)
			cout << "Sorry to hear that!\n";
		else if (feel == 2)
			cout << "Great to hear!\n";
	
}
