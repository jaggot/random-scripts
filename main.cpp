#include <iostream>
#include <cstdlib>
#include <unistd.h>

//over-use of comments so I can read this in the future


//to-do: sanitize inputs better. There's no error handling. Fix this.

// made an object to make things more organized
struct Time{
	int hour,
	    min ;
	Time(int h, int m) : hour(h), min(m){}
};

//convert a string into a Time object
Time toTime(const std::string& s_time){

	// take time, cut and get the hour, convert to int
	std::string s_hour = s_time;
		s_hour.erase(s_hour.begin() + s_hour.find(":"), s_hour.end());
	int i_hour = atoi(s_hour.c_str());

	// take time, get minute, convert to int
	std::string s_min = s_time;
		s_min.erase(s_min.begin(), s_min.begin() + s_min.find(":")+1);
	int i_min = atoi(s_min.c_str());

	return Time(i_hour, i_min);
}

char compareTimes(const std::string& timeA, const std::string& timeB){
	Time A = toTime(timeA);
	Time B = toTime(timeB);
	if(A.hour == B.hour){
		if(A.min < B.min){
			return 2;
		}
		if(A.min > B.min){
			return 1; // first is greater (a later time)
		}
		return 3; // equal
	}
	if(A.hour > B.hour){
		return 1; // first is greater (a later time)
	}
	if(A.hour < B.hour){
		return 2; // first is greater (a later time)
	}
	return 0; // error for some reason (this should basically never happen)
}

int main(int argc, char* argv[]){
	std::string time1 = argv[1];
	std::string time2 ="";
	char ch; // could put this in a closed scope, but it's LITERALLY 1 BYTE OF MEMORY THAT WILL ONLY EXIST FOR A TIME SO SHORT IT WOULD BE ON THE SCALE OF MILLISECONDS
	while(read(STDIN_FILENO, &ch, 1) > 0)
	{
		time2 += ch;
	}
	//std::cin >> time2;
	char result = compareTimes(time1, time2);

	switch(result){
		case 1:
			std::cout << "1";
			//std::cout << time1 << " comes after " << time2 << "!\n";
			break;
		case 2:
			std::cout << "2";
			//std::cout << time1 << " comes before " << time2 << "!\n";
			break;
		case 3:
			std::cout << "3";
			//std::cout << time1 << " and " << time2 << " are the same!\n";
			break;
		default:
			std::cout << "Error calculating result for some reason...\n";
	}
	return 0;
}
