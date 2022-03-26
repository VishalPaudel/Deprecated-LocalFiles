#include <iostream>
using namespace std;

int main() {
    int t;
    cin >> t;
    while (t-- > 0) {
        int n;
        cin >> n;
        int count = 0;

        if (n % 5 != 0) {
            count = -1;
        }
        else {
            while(n > 0) {
                if (n % 10 == 0) {
                    count = count + n / 10;
                    n = n - count * 10;
                }
                else {
                    count = count + 1;
                    n = n - 5;
                }
            }
        }
        cout << count << endl;
    }
}
