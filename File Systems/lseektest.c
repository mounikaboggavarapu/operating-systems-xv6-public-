#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"


int main()
{
    char* filename = "lseektest.txt";
    int fd = open(filename, O_CREATE | O_RDWR);
    
    printf(1, "Testing lseek functionality:\n");
    
    write(fd, "Deadpool", 8);

    printf(1, "Increasing the Offset by 15\n");
    lseek(fd, 15);                      //Increasing the offset by 15
    write(fd, "Wolverine - Hero", 16);


    printf(1, "Decreasing Offset by 6\n");
    lseek(fd, -6);                      //Decreasing the offset by 6
    write(fd, "- Villain", 9);
    
    close(fd);
    exit();

}
