#include <stdio.h>
#include <unistd.h>

int main(){
	const char* TIME = "11:59";
	char ch;
	while(read(STDIN_FILENO, &ch, 1) > 0)
	{
		printf("%c", ch);
	}
	printf("\n");
	return 0;
}
