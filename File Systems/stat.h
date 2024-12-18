#define T_DIR  1   // Directory
#define T_FILE 2   // File
#define T_DEV  3   // Device
#define T_SYMLINK 4
#define T_EXTENT 5

struct file_extent{
  uint start_pointer: 24; 
  uint length: 8;   
  };

struct stat {
  short type;  // Type of file
  int dev;     // File system's disk device
  uint ino;    // Inode number
  short nlink; // Number of links to file
  uint size;   // Size of file in bytes
  struct file_extent extents[10]; // as we have 10 direct pointers
};
