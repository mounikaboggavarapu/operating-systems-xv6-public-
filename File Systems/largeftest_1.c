#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#define FILE_SIZE 16523
#define BLOCK_SIZE 512

char buf[BLOCK_SIZE];

int main(int argc, char* argv[]) {
    int fd;

    fd = open("largeftest_1.txt", O_CREATE | O_WRONLY);

    for (int i = 0; i < FILE_SIZE; i++) {
        // printf(1,"%d ", i);
        if (write(fd, buf, BLOCK_SIZE) != BLOCK_SIZE) {
            printf(1, "Error -  Unable to write blocks as requested into the file.\n");
            exit();
        }
    }
    printf(2, "A file by the name - largefiletest_1 is created of 16,523 blocks\n ");

    close(fd);
    exit();
}