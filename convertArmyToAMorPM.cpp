#include <iostream>
#include <unistd.h>
#include <cstdlib>

int main(){
	char ch;
	std::string time="";
	while(read(STDIN_FILENO, &ch, 1) != NULL){
		time += ch;
	}
	int hour = atoi(time.c_str());
	time.erase(time.begin(), time.begin() + time.find(":") + 1);
	int min = atoi(time.c_str());
	if(hour == 0){
		hour = 12;
		time = std::to_string(hour) + ":" + (min < 10 ? "0":"") + std::to_string(min) + " AM";
	}else if(hour < 12){
		time = std::to_string(hour) + ":" + (min < 10 ? "0":"") + std::to_string(min) + " AM";
	}else{
		if(hour != 12){
			hour -= 12;
		}
		time = std::to_string(hour) + ":" + (min < 10 ? "0":"") + std::to_string(min) + " PM";
	}
	std::cout << time;
	fflush(stdout);
	return 0;
}
