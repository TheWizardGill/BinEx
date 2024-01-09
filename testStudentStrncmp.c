#include <stdio.h>
#include <string.h>

// Declare the assembly function (assuming it takes the same parameters as strncmp)
extern int studentStrncmp(const char *str1, const char *str2, int n);

void test(const char *str1, const char *str2, int n) {
    int result1 = strncmp(str1, str2, n);
    if (result1 < 0){
        result1 = 1;
    }
    int result2 = studentStrncmp(str1, str2, n);

    printf("Testing with n = %d\n", n);
    printf("Original strncmp: %d\n", result1);
    printf("studentStrncmp: %d\n", result2);
    printf("Results are %s\n\n", (result1 == result2) ? "the same" : "different");
}

int main() {
    // Test with various strings and lengths
    test("hello", "hello", 5);
    test("hello", "hello", 3);
    test("hello", "world", 5);
    test("abcd", "abcf", 4);
    test("abcd", "abcf", 3);

    // Add more test cases as needed

    return 0;
}
