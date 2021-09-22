#include <stdio.h>

int main(void) {
    for (int i = 0; i <= 100; i += 10) {
        if (i < 30) {
            printf("%d 😂\n", i);
        } else if (i < 60) {
            printf("%d 😮\n", i);
        } else if (i < 80) {
            printf("%d 😃\n", i);
        } else if (i < 100) {
            printf("%d 😊\n", i);
        } else {
            printf("%d 😆\n", i);
        }
    }
    return 0;
}
