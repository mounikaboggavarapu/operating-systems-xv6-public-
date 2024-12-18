#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#define k 512
#define EXTENT_SIZE 256
#define NDIRECT 10

//Test to create and write to a file
int main(int argc, char *argv[]){
    int fd;
    if(strlen(argv[1]) == 0 ){
        printf(1,"File name missing. Please provide a name");
    }
    else{

        fd = open(argv[1], O_CREATE | O_RDWR | O_EXTENT);
        if(fd < 0){
            printf(1, "Creation Failed\n");
            exit();
        }
        else{
            printf(1, "%s created successfully\n",argv[1]);
        }

        char arr[k];
        memset(arr, '.', k);
        arr[k-1] = '\n';

        for(int i = 0; i < (EXTENT_SIZE*NDIRECT); i++)
        {
            if (write(fd, arr, k) != k)
            {
                printf(1, "Write operation failed\n");
                exit();
            }

        }
        exit();
    }

}