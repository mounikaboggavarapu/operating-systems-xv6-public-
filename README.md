# operating-systems-xv6-public

Shell Commands Implementation in xv6
Overview
This project extends the functionality of the xv6 operating system by implementing simplified versions of several Unix commands. The following commands have been implemented:

ls: Enhanced to hide hidden files by default, differentiate directories with a /, and include a -a flag to show hidden files.
sleep: Pauses execution for a specified number of ticks, as defined by the xv6 kernel's timer interrupt.
uniq: Filters out adjacent duplicate lines from a file and supports flags like -c, -u, and -w to modify its behavior.
find: Searches for files in a directory tree by name and supports additional flags such as -type, -inum, and -printi.

Project Details
Modifications to the ls Command
Hidden files and directories are hidden by default.
Directories are indicated with a / at the end.
The -a flag allows hidden files and directories to be shown.

Implementation of the sleep Command
The sleep command pauses the program for a user-specified number of ticks.
Error handling is included for cases where no argument is provided.
Integrated with xv6's Makefile for easy compilation and execution.

Implementation of the uniq Command
Basic functionality to filter out adjacent duplicate lines.
Supports flags:
-c: Count occurrences of each line.
-u: Print only unique lines.
-w N: Compare only the first N characters in each line.
Compatible with input redirection (e.g., cat filename | uniq).

Implementation of the find Command
Basic search functionality to locate files by name within a directory tree.
Supports flags:
-type f/d: Filter search by file or directory type.
-inum: Search by inode number.
-printi: Print inode numbers along with filenames.

Project Structure
Files Modified:
ls.c, sleep.c, uniq.c, find.c: Core implementation files.
Makefile: Updated to include the new commands for compilation.

Directory Structure:
ls/: Contains the ls.c implementation and related files.
sleep/: Contains the sleep.c implementation and related files.
uniq/: Contains the uniq.c implementation and related files.
find/: Contains the find.c implementation and related files.

How to Compile and Run
Clone the repository and navigate to the xv6-public directory.
Run the following commands to compile and run the xv6 operating system:
make clean
make
make qemu

Use the new commands within the xv6 shell as follows:
ls
sleep [ticks]
uniq [options] [filename]
find [folder] -name [name] [options]
