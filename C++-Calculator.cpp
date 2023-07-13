#include <iostream>
#include <cmath>
using namespace std;

int main() {
    double num1, num2;
    char operation;

    cout << "Enter the first number: ";
    cin >> num1;

    cout << "Enter an operator (+, -, *, /, %, ^, s): ";
    cin >> operation;

    double result;
    bool validOperation = true;

    switch (operation) {
        case '+':
            cout << "Enter the second number: ";
            cin >> num2;
            result = num1 + num2;
            break;
        case '-':
            cout << "Enter the second number: ";
            cin >> num2;
            result = num1 - num2;
            break;
        case '*':
            cout << "Enter the second number: ";
            cin >> num2;
            result = num1 * num2;
            break;
        case '/':
            cout << "Enter the second number: ";
            cin >> num2;
            if (num2 != 0) {
                result = num1 / num2;
            } else {
                cout << "Error: Division by zero is not allowed." << endl;
                validOperation = false;
            }
            break;
        case '%':
            cout << "Enter the second number: ";
            cin >> num2;
            if (num2 != 0) {
                result = fmod(num1, num2);
            } else {
                cout << "Error: Division by zero is not allowed." << endl;
                validOperation = false;
            }
            break;
        case '^':
            cout << "Enter the exponent: ";
            cin >> num2;
            result = pow(num1, num2);
            break;
        case 's':
            result = sqrt(num1);
            break;
        default:
            cout << "Error: Invalid operator." << endl;
            validOperation = false;
            break;
    }

    if (validOperation) {
        cout << "Result: " << result << endl;
    }

    return 0;
}
