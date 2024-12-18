#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"

char buf[512];

int main(int argc, char* argv[]) {
    int fd;

    fd = open("innerlink.txt", O_CREATE | O_RDWR);
    write(fd, "file present in current targeted link\n", 37);
    close(fd);

    fd = open("outerlink.txt", O_CREATE | O_RDWR);
    write(fd, "refer inner link\n", 17);
    close(fd);

    // Create a symbolic link from mainlink.txt to maintarget.txt
    int result = symlink("innerlink.txt", "outerlink.txt");
    if (result == 0) {
        printf(1, "Symbolic link 'outerlink.txt' created pointing to 'innerlink.txt'\n");
    }
    else {
        printf(1, "Error! in creation of symbolic link\n");
        return 1;
    }

    fd = open("mainlink.txt", O_CREATE | O_RDWR);
    write(fd, "file present in innerlink via outerlink.txt\n", 44);
    close(fd);

    symlink("nonexistent.txt", "nonexist.txt");

    fd = open("nonexist.txt", O_CREATE | O_RDWR);
    write(fd, "cannot open nonexist.txt\n", 37);
    close(fd);

    // Setup for symbolic link cycles
    symlink("cyclelink1.txt", "cyclelink2.txt");
    symlink("cyclelink2.txt", "cyclelink3.txt");
    symlink("cyclelink3.txt", "cyclelink4.txt");
    symlink("cyclelink4.txt", "cyclelink5.txt");
    symlink("cyclelink5.txt", "cyclelink6.txt");
    symlink("cyclelink6.txt", "cyclelink1.txt");

    // Create a message file for the cycle link
    fd = open("cyclelink1.txt", O_CREATE | O_RDWR);
    write(fd, "cannot open cyclelink1.txt\n", 21);
    close(fd);
    fd = open("cyclelink2.txt", O_CREATE | O_RDWR);
    write(fd, "cannot open cyclelink2.txt\n", 21);
    close(fd);
    fd = open("cyclelink3.txt", O_CREATE | O_RDWR);
    write(fd, "cannot open cyclelink3.txt\n", 21);
    close(fd);
    fd = open("cyclelink4.txt", O_CREATE | O_RDWR);
    write(fd, "cannot open cyclelink4.txt\n", 21);
    close(fd);
    fd = open("cyclelink5.txt", O_CREATE | O_RDWR);
    write(fd, "cannot open cyclelink5.txt\n", 21);
    close(fd);
    fd = open("cyclelink6.txt", O_CREATE | O_RDWR);
    write(fd, "cannot open cyclelink6.txt\n", 21);
    close(fd);

    exit();
}