#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int array_input(int* a) {
    int length;
    scanf("%d", &length);
    for (int i = 0; i < length; ++i) {
        scanf("%d", &a[i]);
    }
    return length;
}

int create_b_by_a(int* a, int length, int* b) {
    if (length == 0) {
      return 0;
    }
    int last = a[0];
    b[0] = last;
    int b_length = 1;
    for (int i = 1; i < length; ++i) {
        if (a[i] >= last) {
            b[b_length] = a[i];
            last = a[i];
            b_length++;
        }
    }
    return b_length;
}

void array_output(int* a, int length) {
    printf("%d\n", length);
    for (int i = 0; i < length; ++i) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

int main() {
    int a[100], b[100];
    int is_random_input;
    scanf("%d", &is_random_input);
    srand(time(0));
    int length;
    if (is_random_input) {
        length = rand() % 100;
        for (int i = 0; i < length; ++i) {
            a[i] = rand() % 100;
        }
        array_output(a, length);
    } else {
        length = array_input(a);
    }
    int length_b = create_b_by_a(a, length, b);
    array_output(b, length_b);
}
