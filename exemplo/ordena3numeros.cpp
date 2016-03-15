#include <iostream>

void troca(int &a, int &b){
	int c = b; b = a; a = c;
}

int main() {
	int x, y, z;
	while (std::cin >> x >> y >> z) {
		if (x > y) troca(x,y);
		if (x > z) troca(x,z);
		if (y > z) troca(y,z);
		std::cout << x << "," << y << "," << z << std::endl;
	}
	return 0;
}
