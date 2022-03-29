
#include <iostream>

using namespace std;

int main()
{
    const int n = 3;

    int arr_stack[n] = {1, 2, 3};  // in the stack memory
    int *p = arr_stack;  // pointer to the first location of the list

    // adding more space, dangerously
    p += n;
    *p = 0;  // or simply arr_stack[n] = 0

    cout << arr_stack[0] << " " << arr_stack[1]  << " "<< arr_stack[2] << " " << arr_stack[3];
    return 0;
}
