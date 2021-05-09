#include <unistd.h>

void fufu(void (*ft)());

void pricia() {
	write(1, "ciao\n", 5);
	exit(5);
}

int	main(void) {
	fufu(&pricia);
	return (2);
}