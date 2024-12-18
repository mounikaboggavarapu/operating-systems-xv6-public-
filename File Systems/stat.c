#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#define NDIRECT 10
// test to read and display the file info - pointer based and extent based
int main(int argc, char *argv[]){
    int fd;
    struct stat st;
    fd = open(argv[1], O_RDONLY);
    int rc = fstat(fd, &st);
    if(rc<0){
        printf(1, "Read Operation Failed");
        exit();
    }
    else{
        if(st.type == T_FILE){
            printf(1, "type: %s\n", "It is a pointer-based file");    
            printf(1, "size: %d\n", st.size);
            exit();
        }
        if(st.type == T_EXTENT){
            printf(1, "type: %s\n", "It is an extent-based file");    
            printf(1, "size: %d\n", st.size);

            for(int i = 0; i < NDIRECT; i++) {
                printf(1,"Extent Block: %d Start Pointer Address: %d Length: %d\n", i+1, st.extents[i].start_pointer,st.extents[i].length);
            }
        }
        exit();
    }
}