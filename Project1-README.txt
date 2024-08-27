Task - 1: Modifying ls command

1. Modified 'ls' command to hide the hidden files. 
2. We're checking if a string is a file or directory, if its a directory we add a / at the end and print it. 
3. Added a flag, -a , which prints the hidden files and directories (which  starts with .) along with the other files and directories. 

Task - 2: Implementing sleep command

1. The sleep command takes one argument - number of ticks.
2. We're using the existing system call sleep() from sysproc.c
3. Error handling scenarios - If number of arguments is less than or greater than 2.
                              Upon giving a negative integer for number of ticks.

Task - 3: Implementing uniq command

We iterate the text file, line by line using a while loop and store each line into buffer. Using currentbuffer and previousbuffer, we compare each line with it's precedent adjacent line. 
We use a line counter to count the number of times a line has been repeated. 
A function strncmp is written to compare strings, which is called to compare 2 lines and return 0 if the lines are same. 
1. In default case, we print each line exactly once
2. In case of -u, we print a line only when the lincounter is 1, i.e the line occurs only once. 
3. In case of -c, we print each line preceding with linecounter, i.e the number of times the line is written adjacently.
4. In case of -w [N], we compare no more than N characters.

Task - 4: Implementing find command

1. In this functionality, we give a target directory, a filename/directory name and the command checks for all possible files and directories with that name.
2. We have implemented the following flags -
    -type : f , prints all the files with the given name from all sub-directories - find_file()
          : d, prints all the directories with the given name from all sub-directories - find_dir()
    -inum : +<inode> , prints all files of same given name with inode number greater than the given number - inum()
          : -<inode> , prints all files of same given name with inode number lesser than the given number - inum()
          : <inode> , prints all files of same given name with inode number equal to the given number - inum()
    -printi : Prints all the inode numbers along with the file name - passing a flag variable as 0, 
3. Error Handling Scenarios - 
If insufficient number of arguments are given
Target Directory is missing or incorrect
Incorrect flags provided, other than -type, -printi, -inum
Incorrect options for flags 
