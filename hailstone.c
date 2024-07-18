#include <stdio.h>

int main() {

	int hailstone(int n) {
		if ( n != 1 ) {
			if (n % 2 == 0) {
				printf("%d\n", n/2);
				return hailstone(n/2);
			}
			else {
				printf("%d\n",(n*3)+1);
				return hailstone((n*3)+1);
			}
		}
	}

	return hailstone(12);
}
