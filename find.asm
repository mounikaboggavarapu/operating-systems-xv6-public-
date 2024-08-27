
_find:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
// argv[3] - filename
// argv[4] - -type, -inum, -printi
// argv[5] - (+/-) inode, f,d

int main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	57                   	push   %edi
       e:	56                   	push   %esi
       f:	53                   	push   %ebx
      10:	51                   	push   %ecx
      11:	81 ec 38 02 00 00    	sub    $0x238,%esp
      17:	8b 39                	mov    (%ecx),%edi
      19:	8b 59 04             	mov    0x4(%ecx),%ebx
    struct stat file_info;

    char *flag;   // for argv[4]
    char *choice; // for argv[5]

    if (argc < 3) // find .
      1c:	83 ff 02             	cmp    $0x2,%edi
      1f:	7e 7f                	jle    a0 <main+0xa0>
    {
        printf(1, "Error:  Incomplete command.\n");
    }
    else if (argc < 4) // find . -name
      21:	83 ff 03             	cmp    $0x3,%edi
      24:	74 67                	je     8d <main+0x8d>
    {
        printf(1, "Error:  Target Directory/File name is either not provided or doesn't exist.\n");
    }
    else
    {
        flag = argv[4];   // parameter
      26:	8b 43 10             	mov    0x10(%ebx),%eax
        choice = argv[5]; // extra_args

        file_descriptor = open(argv[1], 0);
        fstat(file_descriptor, &file_info);
      29:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
        flag = argv[4];   // parameter
      2f:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%ebp)
        choice = argv[5]; // extra_args
      35:	8b 43 14             	mov    0x14(%ebx),%eax
      38:	89 85 bc fd ff ff    	mov    %eax,-0x244(%ebp)
        file_descriptor = open(argv[1], 0);
      3e:	50                   	push   %eax
      3f:	50                   	push   %eax
      40:	6a 00                	push   $0x0
      42:	ff 73 04             	push   0x4(%ebx)
      45:	e8 89 0d 00 00       	call   dd3 <open>
        fstat(file_descriptor, &file_info);
      4a:	5a                   	pop    %edx
      4b:	59                   	pop    %ecx
      4c:	56                   	push   %esi
      4d:	50                   	push   %eax
        file_descriptor = open(argv[1], 0);
      4e:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
        fstat(file_descriptor, &file_info);
      54:	e8 92 0d 00 00       	call   deb <fstat>
        if (file_info.type == 1) // if its a directory
      59:	83 c4 10             	add    $0x10,%esp
      5c:	66 83 bd d4 fd ff ff 	cmpw   $0x1,-0x22c(%ebp)
      63:	01 
      64:	74 4d                	je     b3 <main+0xb3>
                printf(1, "Error : Incorrect command, use '-name'.\n");
            }
        }
        else
        {
            printf(1, "Error : Location not present.\n");
      66:	50                   	push   %eax
      67:	50                   	push   %eax
      68:	68 a0 13 00 00       	push   $0x13a0
      6d:	6a 01                	push   $0x1
      6f:	e8 7c 0e 00 00       	call   ef0 <printf>
      74:	83 c4 10             	add    $0x10,%esp
        }
        close(file_descriptor);
      77:	83 ec 0c             	sub    $0xc,%esp
      7a:	ff b5 c4 fd ff ff    	push   -0x23c(%ebp)
      80:	e8 36 0d 00 00       	call   dbb <close>
      85:	83 c4 10             	add    $0x10,%esp
    }
    exit();
      88:	e8 06 0d 00 00       	call   d93 <exit>
        printf(1, "Error:  Target Directory/File name is either not provided or doesn't exist.\n");
      8d:	53                   	push   %ebx
      8e:	53                   	push   %ebx
      8f:	68 60 12 00 00       	push   $0x1260
      94:	6a 01                	push   $0x1
      96:	e8 55 0e 00 00       	call   ef0 <printf>
      9b:	83 c4 10             	add    $0x10,%esp
      9e:	eb e8                	jmp    88 <main+0x88>
        printf(1, "Error:  Incomplete command.\n");
      a0:	56                   	push   %esi
      a1:	56                   	push   %esi
      a2:	68 22 12 00 00       	push   $0x1222
      a7:	6a 01                	push   $0x1
      a9:	e8 42 0e 00 00       	call   ef0 <printf>
      ae:	83 c4 10             	add    $0x10,%esp
      b1:	eb d5                	jmp    88 <main+0x88>
            if (strcmp(argv[2], "-name") == 0)
      b3:	50                   	push   %eax
      b4:	50                   	push   %eax
      b5:	68 3f 12 00 00       	push   $0x123f
      ba:	ff 73 08             	push   0x8(%ebx)
      bd:	e8 ae 0a 00 00       	call   b70 <strcmp>
      c2:	83 c4 10             	add    $0x10,%esp
      c5:	85 c0                	test   %eax,%eax
      c7:	0f 85 bb 00 00 00    	jne    188 <main+0x188>
                if (argc == 4) // default find function
      cd:	83 ff 04             	cmp    $0x4,%edi
      d0:	0f 84 c8 00 00 00    	je     19e <main+0x19e>
                else if (strcmp(flag, "-type") == 0) // type function
      d6:	57                   	push   %edi
      d7:	57                   	push   %edi
      d8:	68 45 12 00 00       	push   $0x1245
      dd:	ff b5 c0 fd ff ff    	push   -0x240(%ebp)
      e3:	e8 88 0a 00 00       	call   b70 <strcmp>
      e8:	83 c4 10             	add    $0x10,%esp
      eb:	85 c0                	test   %eax,%eax
      ed:	74 4d                	je     13c <main+0x13c>
                else if (strcmp(flag, "-printi") == 0) //list all files that match the filename with inode number
      ef:	50                   	push   %eax
      f0:	50                   	push   %eax
      f1:	68 4f 12 00 00       	push   $0x124f
      f6:	ff b5 c0 fd ff ff    	push   -0x240(%ebp)
      fc:	e8 6f 0a 00 00       	call   b70 <strcmp>
     101:	83 c4 10             	add    $0x10,%esp
     104:	85 c0                	test   %eax,%eax
     106:	0f 85 9b 00 00 00    	jne    1a7 <main+0x1a7>
                    find(argv[1], argv[3], file_info, buffer, file_descriptor, 0);
     10c:	50                   	push   %eax
     10d:	50                   	push   %eax
     10e:	6a 00                	push   $0x0
     110:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     116:	ff b5 c4 fd ff ff    	push   -0x23c(%ebp)
     11c:	b9 05 00 00 00       	mov    $0x5,%ecx
     121:	50                   	push   %eax
     122:	83 ec 14             	sub    $0x14,%esp
     125:	89 e7                	mov    %esp,%edi
     127:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     129:	ff 73 0c             	push   0xc(%ebx)
     12c:	ff 73 04             	push   0x4(%ebx)
     12f:	e8 2c 08 00 00       	call   960 <find>
     134:	83 c4 30             	add    $0x30,%esp
     137:	e9 3b ff ff ff       	jmp    77 <main+0x77>
                    if (strcmp(choice, "d") == 0)
     13c:	51                   	push   %ecx
     13d:	51                   	push   %ecx
     13e:	68 4b 12 00 00       	push   $0x124b
     143:	ff b5 bc fd ff ff    	push   -0x244(%ebp)
     149:	e8 22 0a 00 00       	call   b70 <strcmp>
     14e:	83 c4 10             	add    $0x10,%esp
     151:	85 c0                	test   %eax,%eax
     153:	0f 85 c6 00 00 00    	jne    21f <main+0x21f>
                        find_dir(argv[1], argv[3], file_info, buffer, file_descriptor); // for type d - directories
     159:	83 ec 0c             	sub    $0xc,%esp
     15c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     162:	ff b5 c4 fd ff ff    	push   -0x23c(%ebp)
     168:	b9 05 00 00 00       	mov    $0x5,%ecx
     16d:	50                   	push   %eax
     16e:	83 ec 14             	sub    $0x14,%esp
     171:	89 e7                	mov    %esp,%edi
     173:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     175:	ff 73 0c             	push   0xc(%ebx)
     178:	ff 73 04             	push   0x4(%ebx)
     17b:	e8 00 05 00 00       	call   680 <find_dir>
     180:	83 c4 30             	add    $0x30,%esp
     183:	e9 ef fe ff ff       	jmp    77 <main+0x77>
                printf(1, "Error : Incorrect command, use '-name'.\n");
     188:	52                   	push   %edx
     189:	52                   	push   %edx
     18a:	68 74 13 00 00       	push   $0x1374
     18f:	6a 01                	push   $0x1
     191:	e8 5a 0d 00 00       	call   ef0 <printf>
     196:	83 c4 10             	add    $0x10,%esp
     199:	e9 d9 fe ff ff       	jmp    77 <main+0x77>
                    find(argv[1], argv[3], file_info, buffer, file_descriptor, 1);
     19e:	50                   	push   %eax
     19f:	50                   	push   %eax
     1a0:	6a 01                	push   $0x1
     1a2:	e9 69 ff ff ff       	jmp    110 <main+0x110>
                else if (strcmp(flag, "-inum") == 0) //inode number comparision
     1a7:	50                   	push   %eax
     1a8:	50                   	push   %eax
     1a9:	68 57 12 00 00       	push   $0x1257
     1ae:	ff b5 c0 fd ff ff    	push   -0x240(%ebp)
     1b4:	e8 b7 09 00 00       	call   b70 <strcmp>
     1b9:	83 c4 10             	add    $0x10,%esp
     1bc:	85 c0                	test   %eax,%eax
     1be:	0f 85 a3 00 00 00    	jne    267 <main+0x267>
                    if (strchr(choice, '+'))
     1c4:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     1ca:	50                   	push   %eax
     1cb:	50                   	push   %eax
     1cc:	6a 2b                	push   $0x2b
     1ce:	57                   	push   %edi
     1cf:	e8 4c 0a 00 00       	call   c20 <strchr>
     1d4:	83 c4 10             	add    $0x10,%esp
     1d7:	85 c0                	test   %eax,%eax
     1d9:	0f 84 b4 00 00 00    	je     293 <main+0x293>
                        choice = choice + 1;
     1df:	89 f8                	mov    %edi,%eax
                        inum(argv[1], argv[3], file_info, buffer, file_descriptor, atoi(choice), 1); // for +inum
     1e1:	83 ec 0c             	sub    $0xc,%esp
                        choice = choice + 1;
     1e4:	83 c0 01             	add    $0x1,%eax
                        inum(argv[1], argv[3], file_info, buffer, file_descriptor, atoi(choice), 1); // for +inum
     1e7:	50                   	push   %eax
     1e8:	e8 33 0b 00 00       	call   d20 <atoi>
     1ed:	83 c4 0c             	add    $0xc,%esp
     1f0:	6a 01                	push   $0x1
                        inum(argv[1], argv[3], file_info, buffer, file_descriptor, atoi(choice), 0); // for inum
     1f2:	50                   	push   %eax
     1f3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     1f9:	b9 05 00 00 00       	mov    $0x5,%ecx
     1fe:	ff b5 c4 fd ff ff    	push   -0x23c(%ebp)
     204:	50                   	push   %eax
     205:	83 ec 14             	sub    $0x14,%esp
     208:	89 e7                	mov    %esp,%edi
     20a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     20c:	ff 73 0c             	push   0xc(%ebx)
     20f:	ff 73 04             	push   0x4(%ebx)
     212:	e8 b9 02 00 00       	call   4d0 <inum>
     217:	83 c4 30             	add    $0x30,%esp
     21a:	e9 58 fe ff ff       	jmp    77 <main+0x77>
                    else if (strcmp(choice, "f") == 0)
     21f:	52                   	push   %edx
     220:	52                   	push   %edx
     221:	68 4d 12 00 00       	push   $0x124d
     226:	ff b5 bc fd ff ff    	push   -0x244(%ebp)
     22c:	e8 3f 09 00 00       	call   b70 <strcmp>
     231:	83 c4 10             	add    $0x10,%esp
     234:	85 c0                	test   %eax,%eax
     236:	75 45                	jne    27d <main+0x27d>
                        find_file(argv[1], argv[3], file_info, buffer, file_descriptor); // for type f - files
     238:	83 ec 0c             	sub    $0xc,%esp
     23b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     241:	ff b5 c4 fd ff ff    	push   -0x23c(%ebp)
     247:	b9 05 00 00 00       	mov    $0x5,%ecx
     24c:	50                   	push   %eax
     24d:	83 ec 14             	sub    $0x14,%esp
     250:	89 e7                	mov    %esp,%edi
     252:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     254:	ff 73 0c             	push   0xc(%ebx)
     257:	ff 73 04             	push   0x4(%ebx)
     25a:	e8 81 05 00 00       	call   7e0 <find_file>
     25f:	83 c4 30             	add    $0x30,%esp
     262:	e9 10 fe ff ff       	jmp    77 <main+0x77>
                    printf(1,"Error:  Incorrect option given.\nAvailable Options find . -name <name> [-type (d) (f)] [-inum (+/-inode)] [-printi]\n");
     267:	51                   	push   %ecx
     268:	51                   	push   %ecx
     269:	68 00 13 00 00       	push   $0x1300
     26e:	6a 01                	push   $0x1
     270:	e8 7b 0c 00 00       	call   ef0 <printf>
     275:	83 c4 10             	add    $0x10,%esp
     278:	e9 fa fd ff ff       	jmp    77 <main+0x77>
                        printf(1, "Error:  Incorrect flag provided. Available choices for type command: -f -d.\n");
     27d:	50                   	push   %eax
     27e:	50                   	push   %eax
     27f:	68 b0 12 00 00       	push   $0x12b0
     284:	6a 01                	push   $0x1
     286:	e8 65 0c 00 00       	call   ef0 <printf>
     28b:	83 c4 10             	add    $0x10,%esp
     28e:	e9 e4 fd ff ff       	jmp    77 <main+0x77>
                    else if (strchr(choice, '-'))
     293:	57                   	push   %edi
     294:	57                   	push   %edi
     295:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     29b:	6a 2d                	push   $0x2d
     29d:	57                   	push   %edi
     29e:	e8 7d 09 00 00       	call   c20 <strchr>
     2a3:	83 c4 10             	add    $0x10,%esp
     2a6:	85 c0                	test   %eax,%eax
     2a8:	74 18                	je     2c2 <main+0x2c2>
                        choice = choice + 1;
     2aa:	89 f8                	mov    %edi,%eax
                        inum(argv[1], argv[3], file_info, buffer, file_descriptor, atoi(choice), -1); // for -inum
     2ac:	83 ec 0c             	sub    $0xc,%esp
                        choice = choice + 1;
     2af:	83 c0 01             	add    $0x1,%eax
                        inum(argv[1], argv[3], file_info, buffer, file_descriptor, atoi(choice), -1); // for -inum
     2b2:	50                   	push   %eax
     2b3:	e8 68 0a 00 00       	call   d20 <atoi>
     2b8:	83 c4 0c             	add    $0xc,%esp
     2bb:	6a ff                	push   $0xffffffff
     2bd:	e9 30 ff ff ff       	jmp    1f2 <main+0x1f2>
                        inum(argv[1], argv[3], file_info, buffer, file_descriptor, atoi(choice), 0); // for inum
     2c2:	83 ec 0c             	sub    $0xc,%esp
     2c5:	ff b5 bc fd ff ff    	push   -0x244(%ebp)
     2cb:	e8 50 0a 00 00       	call   d20 <atoi>
     2d0:	83 c4 0c             	add    $0xc,%esp
     2d3:	6a 00                	push   $0x0
     2d5:	e9 18 ff ff ff       	jmp    1f2 <main+0x1f2>
     2da:	66 90                	xchg   %ax,%ax
     2dc:	66 90                	xchg   %ax,%ax
     2de:	66 90                	xchg   %ax,%ax

000002e0 <format_name>:
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	56                   	push   %esi
     2e4:	53                   	push   %ebx
     2e5:	8b 75 08             	mov    0x8(%ebp),%esi
    for (i = string + strlen(string); i >= string && *i != '/'; i--)
     2e8:	83 ec 0c             	sub    $0xc,%esp
     2eb:	56                   	push   %esi
     2ec:	e8 df 08 00 00       	call   bd0 <strlen>
     2f1:	83 c4 10             	add    $0x10,%esp
     2f4:	01 f0                	add    %esi,%eax
     2f6:	89 c3                	mov    %eax,%ebx
     2f8:	73 0f                	jae    309 <format_name+0x29>
     2fa:	eb 12                	jmp    30e <format_name+0x2e>
     2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     300:	8d 43 ff             	lea    -0x1(%ebx),%eax
     303:	39 c6                	cmp    %eax,%esi
     305:	77 0a                	ja     311 <format_name+0x31>
     307:	89 c3                	mov    %eax,%ebx
     309:	80 3b 2f             	cmpb   $0x2f,(%ebx)
     30c:	75 f2                	jne    300 <format_name+0x20>
    i++;
     30e:	83 c3 01             	add    $0x1,%ebx
    len = strlen(i);
     311:	83 ec 0c             	sub    $0xc,%esp
     314:	53                   	push   %ebx
     315:	e8 b6 08 00 00       	call   bd0 <strlen>
    if (len >= DIR_SIZE)
     31a:	83 c4 10             	add    $0x10,%esp
    len = strlen(i);
     31d:	89 c6                	mov    %eax,%esi
    if (len >= DIR_SIZE)
     31f:	83 f8 13             	cmp    $0x13,%eax
     322:	7f 30                	jg     354 <format_name+0x74>
    memmove(store, i, len);
     324:	83 ec 04             	sub    $0x4,%esp
     327:	50                   	push   %eax
     328:	53                   	push   %ebx
    return store;
     329:	bb ec 17 00 00       	mov    $0x17ec,%ebx
    memmove(store, i, len);
     32e:	68 ec 17 00 00       	push   $0x17ec
     333:	e8 28 0a 00 00       	call   d60 <memmove>
    memset(store + len, '\0', DIR_SIZE - len);
     338:	b8 14 00 00 00       	mov    $0x14,%eax
     33d:	83 c4 0c             	add    $0xc,%esp
     340:	29 f0                	sub    %esi,%eax
     342:	81 c6 ec 17 00 00    	add    $0x17ec,%esi
     348:	50                   	push   %eax
     349:	6a 00                	push   $0x0
     34b:	56                   	push   %esi
     34c:	e8 af 08 00 00       	call   c00 <memset>
    return store;
     351:	83 c4 10             	add    $0x10,%esp
}
     354:	8d 65 f8             	lea    -0x8(%ebp),%esp
     357:	89 d8                	mov    %ebx,%eax
     359:	5b                   	pop    %ebx
     35a:	5e                   	pop    %esi
     35b:	5d                   	pop    %ebp
     35c:	c3                   	ret    
     35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <type_dir>:
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	57                   	push   %edi
     364:	56                   	push   %esi
     365:	53                   	push   %ebx
     366:	83 ec 54             	sub    $0x54,%esp
    strcpy(buffer, file_path);
     369:	ff 75 08             	push   0x8(%ebp)
{
     36c:	8b 5d 28             	mov    0x28(%ebp),%ebx
    strcpy(buffer, file_path);
     36f:	ff 75 24             	push   0x24(%ebp)
     372:	e8 c9 07 00 00       	call   b40 <strcpy>
    point = buffer + strlen(buffer);
     377:	5e                   	pop    %esi
     378:	ff 75 24             	push   0x24(%ebp)
     37b:	8d 75 c4             	lea    -0x3c(%ebp),%esi
     37e:	e8 4d 08 00 00       	call   bd0 <strlen>
     383:	03 45 24             	add    0x24(%ebp),%eax
    while (read(file_des, &entry, len) == len)
     386:	83 c4 10             	add    $0x10,%esp
    point = buffer + strlen(buffer);
     389:	89 c7                	mov    %eax,%edi
    *point++ = '/';
     38b:	83 c0 01             	add    $0x1,%eax
     38e:	89 45 b4             	mov    %eax,-0x4c(%ebp)
     391:	c6 07 2f             	movb   $0x2f,(%edi)
    while (read(file_des, &entry, len) == len)
     394:	eb 11                	jmp    3a7 <type_dir+0x47>
     396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     39d:	8d 76 00             	lea    0x0(%esi),%esi
        if (entry.inum != 0)
     3a0:	66 83 7d c4 00       	cmpw   $0x0,-0x3c(%ebp)
     3a5:	75 21                	jne    3c8 <type_dir+0x68>
    while (read(file_des, &entry, len) == len)
     3a7:	83 ec 04             	sub    $0x4,%esp
     3aa:	6a 10                	push   $0x10
     3ac:	56                   	push   %esi
     3ad:	53                   	push   %ebx
     3ae:	e8 f8 09 00 00       	call   dab <read>
     3b3:	83 c4 10             	add    $0x10,%esp
     3b6:	83 f8 10             	cmp    $0x10,%eax
     3b9:	74 e5                	je     3a0 <type_dir+0x40>
}
     3bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3be:	5b                   	pop    %ebx
     3bf:	5e                   	pop    %esi
     3c0:	5f                   	pop    %edi
     3c1:	5d                   	pop    %ebp
     3c2:	c3                   	ret    
     3c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     3c7:	90                   	nop
            stat(buffer, &metadata);
     3c8:	83 ec 08             	sub    $0x8,%esp
     3cb:	8d 45 10             	lea    0x10(%ebp),%eax
     3ce:	50                   	push   %eax
     3cf:	ff 75 24             	push   0x24(%ebp)
     3d2:	e8 f9 08 00 00       	call   cd0 <stat>
            memmove(point, entry.name, DIR_SIZE);
     3d7:	83 c4 0c             	add    $0xc,%esp
     3da:	8d 45 c6             	lea    -0x3a(%ebp),%eax
     3dd:	6a 14                	push   $0x14
     3df:	50                   	push   %eax
     3e0:	ff 75 b4             	push   -0x4c(%ebp)
     3e3:	e8 78 09 00 00       	call   d60 <memmove>
            if (metadata.type == 1 && strcmp(format_name(buffer), dirname) == 0)
     3e8:	83 c4 10             	add    $0x10,%esp
     3eb:	66 83 7d 10 01       	cmpw   $0x1,0x10(%ebp)
            point[DIR_SIZE] = 0;
     3f0:	c6 47 15 00          	movb   $0x0,0x15(%edi)
            if (metadata.type == 1 && strcmp(format_name(buffer), dirname) == 0)
     3f4:	75 b1                	jne    3a7 <type_dir+0x47>
     3f6:	83 ec 0c             	sub    $0xc,%esp
     3f9:	ff 75 24             	push   0x24(%ebp)
     3fc:	e8 df fe ff ff       	call   2e0 <format_name>
     401:	5a                   	pop    %edx
     402:	59                   	pop    %ecx
     403:	ff 75 0c             	push   0xc(%ebp)
     406:	50                   	push   %eax
     407:	e8 64 07 00 00       	call   b70 <strcmp>
     40c:	83 c4 10             	add    $0x10,%esp
     40f:	85 c0                	test   %eax,%eax
     411:	0f 84 9d 00 00 00    	je     4b4 <type_dir+0x154>
            else if (metadata.type == 1)
     417:	66 83 7d 10 01       	cmpw   $0x1,0x10(%ebp)
     41c:	75 89                	jne    3a7 <type_dir+0x47>
                if (strcmp(format_name(buffer), ".") != 0 && strcmp(format_name(buffer), "..") != 0)
     41e:	83 ec 0c             	sub    $0xc,%esp
     421:	ff 75 24             	push   0x24(%ebp)
     424:	e8 b7 fe ff ff       	call   2e0 <format_name>
     429:	5a                   	pop    %edx
     42a:	59                   	pop    %ecx
     42b:	68 19 12 00 00       	push   $0x1219
     430:	50                   	push   %eax
     431:	e8 3a 07 00 00       	call   b70 <strcmp>
     436:	83 c4 10             	add    $0x10,%esp
     439:	85 c0                	test   %eax,%eax
     43b:	0f 84 66 ff ff ff    	je     3a7 <type_dir+0x47>
     441:	83 ec 0c             	sub    $0xc,%esp
     444:	ff 75 24             	push   0x24(%ebp)
     447:	e8 94 fe ff ff       	call   2e0 <format_name>
     44c:	5a                   	pop    %edx
     44d:	59                   	pop    %ecx
     44e:	68 18 12 00 00       	push   $0x1218
     453:	50                   	push   %eax
     454:	e8 17 07 00 00       	call   b70 <strcmp>
     459:	83 c4 10             	add    $0x10,%esp
     45c:	85 c0                	test   %eax,%eax
     45e:	0f 84 43 ff ff ff    	je     3a7 <type_dir+0x47>
                    int new_file_des = open(buffer, 0);
     464:	83 ec 08             	sub    $0x8,%esp
     467:	6a 00                	push   $0x0
     469:	ff 75 24             	push   0x24(%ebp)
     46c:	e8 62 09 00 00       	call   dd3 <open>
     471:	89 45 b0             	mov    %eax,-0x50(%ebp)
                    fstat(file_des, &new_metadata);
     474:	58                   	pop    %eax
     475:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     478:	5a                   	pop    %edx
     479:	50                   	push   %eax
     47a:	53                   	push   %ebx
     47b:	e8 6b 09 00 00       	call   deb <fstat>
                    type_dir(buffer, dirname, new_metadata, buffer, new_file_des);
     480:	59                   	pop    %ecx
     481:	ff 75 b0             	push   -0x50(%ebp)
     484:	ff 75 24             	push   0x24(%ebp)
     487:	ff 75 e4             	push   -0x1c(%ebp)
     48a:	ff 75 e0             	push   -0x20(%ebp)
     48d:	ff 75 dc             	push   -0x24(%ebp)
     490:	ff 75 d8             	push   -0x28(%ebp)
     493:	ff 75 d4             	push   -0x2c(%ebp)
     496:	ff 75 0c             	push   0xc(%ebp)
     499:	ff 75 24             	push   0x24(%ebp)
     49c:	e8 bf fe ff ff       	call   360 <type_dir>
                    close(new_file_des);
     4a1:	83 c4 24             	add    $0x24,%esp
     4a4:	ff 75 b0             	push   -0x50(%ebp)
     4a7:	e8 0f 09 00 00       	call   dbb <close>
     4ac:	83 c4 10             	add    $0x10,%esp
     4af:	e9 f3 fe ff ff       	jmp    3a7 <type_dir+0x47>
                printf(1, "%s\n", buffer);
     4b4:	83 ec 04             	sub    $0x4,%esp
     4b7:	ff 75 24             	push   0x24(%ebp)
     4ba:	68 1e 12 00 00       	push   $0x121e
     4bf:	6a 01                	push   $0x1
     4c1:	e8 2a 0a 00 00       	call   ef0 <printf>
     4c6:	83 c4 10             	add    $0x10,%esp
     4c9:	e9 d9 fe ff ff       	jmp    3a7 <type_dir+0x47>
     4ce:	66 90                	xchg   %ax,%ax

000004d0 <inum>:
{
     4d0:	55                   	push   %ebp
     4d1:	89 e5                	mov    %esp,%ebp
     4d3:	57                   	push   %edi
     4d4:	56                   	push   %esi
     4d5:	8d 75 c4             	lea    -0x3c(%ebp),%esi
     4d8:	53                   	push   %ebx
     4d9:	83 ec 54             	sub    $0x54,%esp
    strcpy(buffer, file_path);
     4dc:	ff 75 08             	push   0x8(%ebp)
{
     4df:	8b 5d 28             	mov    0x28(%ebp),%ebx
    strcpy(buffer, file_path);
     4e2:	ff 75 24             	push   0x24(%ebp)
     4e5:	e8 56 06 00 00       	call   b40 <strcpy>
    point = buffer + strlen(buffer);
     4ea:	59                   	pop    %ecx
     4eb:	ff 75 24             	push   0x24(%ebp)
     4ee:	e8 dd 06 00 00       	call   bd0 <strlen>
     4f3:	03 45 24             	add    0x24(%ebp),%eax
    while (read(file_des, &entry, len) == len)
     4f6:	83 c4 10             	add    $0x10,%esp
    point = buffer + strlen(buffer);
     4f9:	89 c7                	mov    %eax,%edi
    *point++ = '/';
     4fb:	83 c0 01             	add    $0x1,%eax
     4fe:	89 45 b4             	mov    %eax,-0x4c(%ebp)
     501:	c6 07 2f             	movb   $0x2f,(%edi)
    while (read(file_des, &entry, len) == len)
     504:	eb 11                	jmp    517 <inum+0x47>
     506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     50d:	8d 76 00             	lea    0x0(%esi),%esi
        if (entry.inum != 0)
     510:	66 83 7d c4 00       	cmpw   $0x0,-0x3c(%ebp)
     515:	75 21                	jne    538 <inum+0x68>
    while (read(file_des, &entry, len) == len)
     517:	83 ec 04             	sub    $0x4,%esp
     51a:	6a 10                	push   $0x10
     51c:	56                   	push   %esi
     51d:	53                   	push   %ebx
     51e:	e8 88 08 00 00       	call   dab <read>
     523:	83 c4 10             	add    $0x10,%esp
     526:	83 f8 10             	cmp    $0x10,%eax
     529:	74 e5                	je     510 <inum+0x40>
}
     52b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     52e:	5b                   	pop    %ebx
     52f:	5e                   	pop    %esi
     530:	5f                   	pop    %edi
     531:	5d                   	pop    %ebp
     532:	c3                   	ret    
     533:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     537:	90                   	nop
            memmove(point, entry.name, DIR_SIZE);
     538:	83 ec 04             	sub    $0x4,%esp
     53b:	8d 45 c6             	lea    -0x3a(%ebp),%eax
     53e:	6a 14                	push   $0x14
     540:	50                   	push   %eax
     541:	ff 75 b4             	push   -0x4c(%ebp)
     544:	e8 17 08 00 00       	call   d60 <memmove>
            point[DIR_SIZE] = 0;
     549:	c6 47 15 00          	movb   $0x0,0x15(%edi)
            stat(buffer, &metadata);
     54d:	58                   	pop    %eax
     54e:	8d 45 10             	lea    0x10(%ebp),%eax
     551:	5a                   	pop    %edx
     552:	50                   	push   %eax
     553:	ff 75 24             	push   0x24(%ebp)
     556:	e8 75 07 00 00       	call   cd0 <stat>
            if (metadata.type == 2 && strcmp(format_name(buffer), filename) == 0)
     55b:	0f b7 45 10          	movzwl 0x10(%ebp),%eax
     55f:	83 c4 10             	add    $0x10,%esp
     562:	66 83 f8 02          	cmp    $0x2,%ax
     566:	0f 84 a4 00 00 00    	je     610 <inum+0x140>
            else if (metadata.type == 1)
     56c:	66 83 f8 01          	cmp    $0x1,%ax
     570:	75 a5                	jne    517 <inum+0x47>
                if (strcmp(format_name(buffer), ".") != 0 && strcmp(format_name(buffer), "..") != 0)
     572:	83 ec 0c             	sub    $0xc,%esp
     575:	ff 75 24             	push   0x24(%ebp)
     578:	e8 63 fd ff ff       	call   2e0 <format_name>
     57d:	59                   	pop    %ecx
     57e:	5a                   	pop    %edx
     57f:	68 19 12 00 00       	push   $0x1219
     584:	50                   	push   %eax
     585:	e8 e6 05 00 00       	call   b70 <strcmp>
     58a:	83 c4 10             	add    $0x10,%esp
     58d:	85 c0                	test   %eax,%eax
     58f:	74 86                	je     517 <inum+0x47>
     591:	83 ec 0c             	sub    $0xc,%esp
     594:	ff 75 24             	push   0x24(%ebp)
     597:	e8 44 fd ff ff       	call   2e0 <format_name>
     59c:	59                   	pop    %ecx
     59d:	5a                   	pop    %edx
     59e:	68 18 12 00 00       	push   $0x1218
     5a3:	50                   	push   %eax
     5a4:	e8 c7 05 00 00       	call   b70 <strcmp>
     5a9:	83 c4 10             	add    $0x10,%esp
     5ac:	85 c0                	test   %eax,%eax
     5ae:	0f 84 63 ff ff ff    	je     517 <inum+0x47>
                    fstat(file_des, &new_metadata);
     5b4:	83 ec 08             	sub    $0x8,%esp
     5b7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     5ba:	50                   	push   %eax
     5bb:	53                   	push   %ebx
     5bc:	e8 2a 08 00 00       	call   deb <fstat>
                    int new_file_des = open(buffer, 0);
     5c1:	58                   	pop    %eax
     5c2:	5a                   	pop    %edx
     5c3:	6a 00                	push   $0x0
     5c5:	ff 75 24             	push   0x24(%ebp)
     5c8:	e8 06 08 00 00       	call   dd3 <open>
                    inum(buffer, filename, new_metadata, buffer, new_file_des, value, sign);
     5cd:	83 c4 0c             	add    $0xc,%esp
     5d0:	ff 75 30             	push   0x30(%ebp)
     5d3:	ff 75 2c             	push   0x2c(%ebp)
     5d6:	50                   	push   %eax
     5d7:	ff 75 24             	push   0x24(%ebp)
     5da:	ff 75 e4             	push   -0x1c(%ebp)
     5dd:	ff 75 e0             	push   -0x20(%ebp)
     5e0:	ff 75 dc             	push   -0x24(%ebp)
     5e3:	ff 75 d8             	push   -0x28(%ebp)
     5e6:	ff 75 d4             	push   -0x2c(%ebp)
     5e9:	ff 75 0c             	push   0xc(%ebp)
     5ec:	ff 75 24             	push   0x24(%ebp)
     5ef:	89 45 b0             	mov    %eax,-0x50(%ebp)
     5f2:	e8 d9 fe ff ff       	call   4d0 <inum>
                    close(new_file_des);
     5f7:	8b 45 b0             	mov    -0x50(%ebp),%eax
     5fa:	83 c4 24             	add    $0x24,%esp
     5fd:	50                   	push   %eax
     5fe:	e8 b8 07 00 00       	call   dbb <close>
     603:	83 c4 10             	add    $0x10,%esp
     606:	e9 0c ff ff ff       	jmp    517 <inum+0x47>
     60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     60f:	90                   	nop
            if (metadata.type == 2 && strcmp(format_name(buffer), filename) == 0)
     610:	83 ec 0c             	sub    $0xc,%esp
     613:	ff 75 24             	push   0x24(%ebp)
     616:	e8 c5 fc ff ff       	call   2e0 <format_name>
     61b:	5a                   	pop    %edx
     61c:	59                   	pop    %ecx
     61d:	ff 75 0c             	push   0xc(%ebp)
     620:	50                   	push   %eax
     621:	e8 4a 05 00 00       	call   b70 <strcmp>
     626:	83 c4 10             	add    $0x10,%esp
     629:	85 c0                	test   %eax,%eax
     62b:	74 09                	je     636 <inum+0x166>
            else if (metadata.type == 1)
     62d:	0f b7 45 10          	movzwl 0x10(%ebp),%eax
     631:	e9 36 ff ff ff       	jmp    56c <inum+0x9c>
                if ((metadata.ino == value && sign == 0) || (metadata.ino > value && sign == 1) || (metadata.ino < value && sign == -1))
     636:	8b 45 18             	mov    0x18(%ebp),%eax
     639:	3b 45 2c             	cmp    0x2c(%ebp),%eax
     63c:	74 35                	je     673 <inum+0x1a3>
     63e:	76 06                	jbe    646 <inum+0x176>
     640:	83 7d 30 01          	cmpl   $0x1,0x30(%ebp)
     644:	74 13                	je     659 <inum+0x189>
     646:	3b 45 2c             	cmp    0x2c(%ebp),%eax
     649:	0f 83 c8 fe ff ff    	jae    517 <inum+0x47>
     64f:	83 7d 30 ff          	cmpl   $0xffffffff,0x30(%ebp)
     653:	0f 85 be fe ff ff    	jne    517 <inum+0x47>
                    printf(1, "%s\n", buffer);
     659:	83 ec 04             	sub    $0x4,%esp
     65c:	ff 75 24             	push   0x24(%ebp)
     65f:	68 1e 12 00 00       	push   $0x121e
     664:	6a 01                	push   $0x1
     666:	e8 85 08 00 00       	call   ef0 <printf>
     66b:	83 c4 10             	add    $0x10,%esp
     66e:	e9 a4 fe ff ff       	jmp    517 <inum+0x47>
                if ((metadata.ino == value && sign == 0) || (metadata.ino > value && sign == 1) || (metadata.ino < value && sign == -1))
     673:	8b 4d 30             	mov    0x30(%ebp),%ecx
     676:	85 c9                	test   %ecx,%ecx
     678:	74 df                	je     659 <inum+0x189>
     67a:	e9 98 fe ff ff       	jmp    517 <inum+0x47>
     67f:	90                   	nop

00000680 <find_dir>:
{
     680:	55                   	push   %ebp
     681:	89 e5                	mov    %esp,%ebp
     683:	57                   	push   %edi
     684:	56                   	push   %esi
     685:	53                   	push   %ebx
     686:	8d 5d c4             	lea    -0x3c(%ebp),%ebx
     689:	83 ec 54             	sub    $0x54,%esp
    strcpy(buffer, file_path);
     68c:	ff 75 08             	push   0x8(%ebp)
     68f:	ff 75 24             	push   0x24(%ebp)
     692:	e8 a9 04 00 00       	call   b40 <strcpy>
    point = buffer + strlen(buffer);
     697:	58                   	pop    %eax
     698:	ff 75 24             	push   0x24(%ebp)
     69b:	e8 30 05 00 00       	call   bd0 <strlen>
     6a0:	03 45 24             	add    0x24(%ebp),%eax
    while (read(file_des, &entry, len) == len)
     6a3:	83 c4 10             	add    $0x10,%esp
    *point++ = '/';
     6a6:	8d 50 01             	lea    0x1(%eax),%edx
    point = buffer + strlen(buffer);
     6a9:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    *point++ = '/';
     6ac:	89 55 b0             	mov    %edx,-0x50(%ebp)
     6af:	c6 00 2f             	movb   $0x2f,(%eax)
    while (read(file_des, &entry, len) == len)
     6b2:	eb 0b                	jmp    6bf <find_dir+0x3f>
     6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (entry.inum != 0)
     6b8:	66 83 7d c4 00       	cmpw   $0x0,-0x3c(%ebp)
     6bd:	75 21                	jne    6e0 <find_dir+0x60>
    while (read(file_des, &entry, len) == len)
     6bf:	83 ec 04             	sub    $0x4,%esp
     6c2:	6a 10                	push   $0x10
     6c4:	53                   	push   %ebx
     6c5:	ff 75 28             	push   0x28(%ebp)
     6c8:	e8 de 06 00 00       	call   dab <read>
     6cd:	83 c4 10             	add    $0x10,%esp
     6d0:	83 f8 10             	cmp    $0x10,%eax
     6d3:	74 e3                	je     6b8 <find_dir+0x38>
}
     6d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6d8:	5b                   	pop    %ebx
     6d9:	5e                   	pop    %esi
     6da:	5f                   	pop    %edi
     6db:	5d                   	pop    %ebp
     6dc:	c3                   	ret    
     6dd:	8d 76 00             	lea    0x0(%esi),%esi
            memmove(point, entry.name, DIR_SIZE);
     6e0:	83 ec 04             	sub    $0x4,%esp
     6e3:	8d 45 c6             	lea    -0x3a(%ebp),%eax
     6e6:	6a 14                	push   $0x14
     6e8:	50                   	push   %eax
     6e9:	ff 75 b0             	push   -0x50(%ebp)
     6ec:	e8 6f 06 00 00       	call   d60 <memmove>
            stat(buffer, &metadata);
     6f1:	8d 45 10             	lea    0x10(%ebp),%eax
     6f4:	5e                   	pop    %esi
     6f5:	5f                   	pop    %edi
     6f6:	50                   	push   %eax
     6f7:	ff 75 24             	push   0x24(%ebp)
     6fa:	e8 d1 05 00 00       	call   cd0 <stat>
            point[DIR_SIZE] = 0;
     6ff:	8b 45 b4             	mov    -0x4c(%ebp),%eax
            if (metadata.type == 1)
     702:	83 c4 10             	add    $0x10,%esp
     705:	66 83 7d 10 01       	cmpw   $0x1,0x10(%ebp)
            point[DIR_SIZE] = 0;
     70a:	c6 40 15 00          	movb   $0x0,0x15(%eax)
            if (metadata.type == 1)
     70e:	75 af                	jne    6bf <find_dir+0x3f>
                if (strcmp(format_name(buffer), ".") != 0 && strcmp(format_name(buffer), "..") != 0)
     710:	83 ec 0c             	sub    $0xc,%esp
     713:	ff 75 24             	push   0x24(%ebp)
     716:	e8 c5 fb ff ff       	call   2e0 <format_name>
     71b:	5a                   	pop    %edx
     71c:	59                   	pop    %ecx
     71d:	68 19 12 00 00       	push   $0x1219
     722:	50                   	push   %eax
     723:	e8 48 04 00 00       	call   b70 <strcmp>
     728:	83 c4 10             	add    $0x10,%esp
     72b:	85 c0                	test   %eax,%eax
     72d:	74 90                	je     6bf <find_dir+0x3f>
     72f:	83 ec 0c             	sub    $0xc,%esp
     732:	ff 75 24             	push   0x24(%ebp)
     735:	e8 a6 fb ff ff       	call   2e0 <format_name>
     73a:	5e                   	pop    %esi
     73b:	5f                   	pop    %edi
     73c:	68 18 12 00 00       	push   $0x1218
     741:	50                   	push   %eax
     742:	e8 29 04 00 00       	call   b70 <strcmp>
     747:	83 c4 10             	add    $0x10,%esp
     74a:	85 c0                	test   %eax,%eax
     74c:	0f 84 6d ff ff ff    	je     6bf <find_dir+0x3f>
                    fstat(file_des, &new_metadata);
     752:	8d 75 d4             	lea    -0x2c(%ebp),%esi
     755:	52                   	push   %edx
     756:	52                   	push   %edx
     757:	56                   	push   %esi
     758:	ff 75 28             	push   0x28(%ebp)
     75b:	e8 8b 06 00 00       	call   deb <fstat>
                    int new_file_des = open(buffer, 0);
     760:	59                   	pop    %ecx
     761:	5f                   	pop    %edi
     762:	6a 00                	push   $0x0
     764:	ff 75 24             	push   0x24(%ebp)
     767:	e8 67 06 00 00       	call   dd3 <open>
     76c:	89 45 ac             	mov    %eax,-0x54(%ebp)
                    if (strcmp(format_name(buffer), dirname) == 0)
     76f:	58                   	pop    %eax
     770:	ff 75 24             	push   0x24(%ebp)
     773:	e8 68 fb ff ff       	call   2e0 <format_name>
     778:	5a                   	pop    %edx
     779:	59                   	pop    %ecx
     77a:	ff 75 0c             	push   0xc(%ebp)
     77d:	50                   	push   %eax
     77e:	e8 ed 03 00 00       	call   b70 <strcmp>
     783:	83 c4 10             	add    $0x10,%esp
     786:	85 c0                	test   %eax,%eax
     788:	74 33                	je     7bd <find_dir+0x13d>
                    find_dir(buffer, dirname, new_metadata, buffer, new_file_des);
     78a:	83 ec 0c             	sub    $0xc,%esp
     78d:	ff 75 ac             	push   -0x54(%ebp)
     790:	b9 05 00 00 00       	mov    $0x5,%ecx
     795:	ff 75 24             	push   0x24(%ebp)
     798:	83 ec 14             	sub    $0x14,%esp
     79b:	89 e7                	mov    %esp,%edi
     79d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     79f:	ff 75 0c             	push   0xc(%ebp)
     7a2:	ff 75 24             	push   0x24(%ebp)
     7a5:	e8 d6 fe ff ff       	call   680 <find_dir>
                    close(new_file_des);
     7aa:	83 c4 24             	add    $0x24,%esp
     7ad:	ff 75 ac             	push   -0x54(%ebp)
     7b0:	e8 06 06 00 00       	call   dbb <close>
     7b5:	83 c4 10             	add    $0x10,%esp
     7b8:	e9 02 ff ff ff       	jmp    6bf <find_dir+0x3f>
                        printf(1, "%s\n", buffer);
     7bd:	50                   	push   %eax
     7be:	ff 75 24             	push   0x24(%ebp)
     7c1:	68 1e 12 00 00       	push   $0x121e
     7c6:	6a 01                	push   $0x1
     7c8:	e8 23 07 00 00       	call   ef0 <printf>
     7cd:	83 c4 10             	add    $0x10,%esp
     7d0:	eb b8                	jmp    78a <find_dir+0x10a>
     7d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007e0 <find_file>:
{
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	57                   	push   %edi
     7e4:	56                   	push   %esi
     7e5:	8d 75 c4             	lea    -0x3c(%ebp),%esi
     7e8:	53                   	push   %ebx
     7e9:	83 ec 54             	sub    $0x54,%esp
    strcpy(buffer, file_path);
     7ec:	ff 75 08             	push   0x8(%ebp)
{
     7ef:	8b 5d 28             	mov    0x28(%ebp),%ebx
    strcpy(buffer, file_path);
     7f2:	ff 75 24             	push   0x24(%ebp)
     7f5:	e8 46 03 00 00       	call   b40 <strcpy>
    point = buffer + strlen(buffer);
     7fa:	58                   	pop    %eax
     7fb:	ff 75 24             	push   0x24(%ebp)
     7fe:	e8 cd 03 00 00       	call   bd0 <strlen>
     803:	03 45 24             	add    0x24(%ebp),%eax
    while (read(file_des, &entry, len) == len)
     806:	83 c4 10             	add    $0x10,%esp
    point = buffer + strlen(buffer);
     809:	89 c7                	mov    %eax,%edi
    *point++ = '/';
     80b:	83 c0 01             	add    $0x1,%eax
     80e:	89 45 b4             	mov    %eax,-0x4c(%ebp)
     811:	c6 07 2f             	movb   $0x2f,(%edi)
    while (read(file_des, &entry, len) == len)
     814:	eb 11                	jmp    827 <find_file+0x47>
     816:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     81d:	8d 76 00             	lea    0x0(%esi),%esi
        if (entry.inum != 0)
     820:	66 83 7d c4 00       	cmpw   $0x0,-0x3c(%ebp)
     825:	75 21                	jne    848 <find_file+0x68>
    while (read(file_des, &entry, len) == len)
     827:	83 ec 04             	sub    $0x4,%esp
     82a:	6a 10                	push   $0x10
     82c:	56                   	push   %esi
     82d:	53                   	push   %ebx
     82e:	e8 78 05 00 00       	call   dab <read>
     833:	83 c4 10             	add    $0x10,%esp
     836:	83 f8 10             	cmp    $0x10,%eax
     839:	74 e5                	je     820 <find_file+0x40>
}
     83b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     83e:	5b                   	pop    %ebx
     83f:	5e                   	pop    %esi
     840:	5f                   	pop    %edi
     841:	5d                   	pop    %ebp
     842:	c3                   	ret    
     843:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     847:	90                   	nop
            memmove(point, entry.name, DIR_SIZE);
     848:	83 ec 04             	sub    $0x4,%esp
     84b:	8d 45 c6             	lea    -0x3a(%ebp),%eax
     84e:	6a 14                	push   $0x14
     850:	50                   	push   %eax
     851:	ff 75 b4             	push   -0x4c(%ebp)
     854:	e8 07 05 00 00       	call   d60 <memmove>
            stat(buffer, &metadata);
     859:	59                   	pop    %ecx
     85a:	58                   	pop    %eax
     85b:	8d 45 10             	lea    0x10(%ebp),%eax
     85e:	50                   	push   %eax
     85f:	ff 75 24             	push   0x24(%ebp)
     862:	e8 69 04 00 00       	call   cd0 <stat>
            if (metadata.type == 2 && strcmp(format_name(buffer), filename) == 0)
     867:	0f b7 45 10          	movzwl 0x10(%ebp),%eax
            point[DIR_SIZE] = 0;
     86b:	c6 47 15 00          	movb   $0x0,0x15(%edi)
            if (metadata.type == 2 && strcmp(format_name(buffer), filename) == 0)
     86f:	83 c4 10             	add    $0x10,%esp
     872:	66 83 f8 02          	cmp    $0x2,%ax
     876:	0f 84 9c 00 00 00    	je     918 <find_file+0x138>
            else if (metadata.type == 1)
     87c:	66 83 f8 01          	cmp    $0x1,%ax
     880:	75 a5                	jne    827 <find_file+0x47>
                if (strcmp(format_name(buffer), ".") != 0 && strcmp(format_name(buffer), "..") != 0)
     882:	83 ec 0c             	sub    $0xc,%esp
     885:	ff 75 24             	push   0x24(%ebp)
     888:	e8 53 fa ff ff       	call   2e0 <format_name>
     88d:	59                   	pop    %ecx
     88e:	5a                   	pop    %edx
     88f:	68 19 12 00 00       	push   $0x1219
     894:	50                   	push   %eax
     895:	e8 d6 02 00 00       	call   b70 <strcmp>
     89a:	83 c4 10             	add    $0x10,%esp
     89d:	85 c0                	test   %eax,%eax
     89f:	74 86                	je     827 <find_file+0x47>
     8a1:	83 ec 0c             	sub    $0xc,%esp
     8a4:	ff 75 24             	push   0x24(%ebp)
     8a7:	e8 34 fa ff ff       	call   2e0 <format_name>
     8ac:	59                   	pop    %ecx
     8ad:	5a                   	pop    %edx
     8ae:	68 18 12 00 00       	push   $0x1218
     8b3:	50                   	push   %eax
     8b4:	e8 b7 02 00 00       	call   b70 <strcmp>
     8b9:	83 c4 10             	add    $0x10,%esp
     8bc:	85 c0                	test   %eax,%eax
     8be:	0f 84 63 ff ff ff    	je     827 <find_file+0x47>
                    fstat(file_des, &new_metadata);
     8c4:	83 ec 08             	sub    $0x8,%esp
     8c7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     8ca:	50                   	push   %eax
     8cb:	53                   	push   %ebx
     8cc:	e8 1a 05 00 00       	call   deb <fstat>
                    int new_file_des = open(buffer, 0);
     8d1:	58                   	pop    %eax
     8d2:	5a                   	pop    %edx
     8d3:	6a 00                	push   $0x0
     8d5:	ff 75 24             	push   0x24(%ebp)
     8d8:	e8 f6 04 00 00       	call   dd3 <open>
                    find_file(buffer, filename, new_metadata, buffer, new_file_des);
     8dd:	89 04 24             	mov    %eax,(%esp)
     8e0:	ff 75 24             	push   0x24(%ebp)
     8e3:	ff 75 e4             	push   -0x1c(%ebp)
     8e6:	ff 75 e0             	push   -0x20(%ebp)
     8e9:	ff 75 dc             	push   -0x24(%ebp)
     8ec:	ff 75 d8             	push   -0x28(%ebp)
     8ef:	ff 75 d4             	push   -0x2c(%ebp)
     8f2:	ff 75 0c             	push   0xc(%ebp)
     8f5:	ff 75 24             	push   0x24(%ebp)
     8f8:	89 45 b0             	mov    %eax,-0x50(%ebp)
     8fb:	e8 e0 fe ff ff       	call   7e0 <find_file>
                    close(new_file_des);
     900:	8b 45 b0             	mov    -0x50(%ebp),%eax
     903:	83 c4 24             	add    $0x24,%esp
     906:	50                   	push   %eax
     907:	e8 af 04 00 00       	call   dbb <close>
     90c:	83 c4 10             	add    $0x10,%esp
     90f:	e9 13 ff ff ff       	jmp    827 <find_file+0x47>
     914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            if (metadata.type == 2 && strcmp(format_name(buffer), filename) == 0)
     918:	83 ec 0c             	sub    $0xc,%esp
     91b:	ff 75 24             	push   0x24(%ebp)
     91e:	e8 bd f9 ff ff       	call   2e0 <format_name>
     923:	59                   	pop    %ecx
     924:	5a                   	pop    %edx
     925:	ff 75 0c             	push   0xc(%ebp)
     928:	50                   	push   %eax
     929:	e8 42 02 00 00       	call   b70 <strcmp>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	74 09                	je     93e <find_file+0x15e>
            else if (metadata.type == 1)
     935:	0f b7 45 10          	movzwl 0x10(%ebp),%eax
     939:	e9 3e ff ff ff       	jmp    87c <find_file+0x9c>
                printf(1, "%s\n", buffer);
     93e:	83 ec 04             	sub    $0x4,%esp
     941:	ff 75 24             	push   0x24(%ebp)
     944:	68 1e 12 00 00       	push   $0x121e
     949:	6a 01                	push   $0x1
     94b:	e8 a0 05 00 00       	call   ef0 <printf>
     950:	83 c4 10             	add    $0x10,%esp
     953:	e9 cf fe ff ff       	jmp    827 <find_file+0x47>
     958:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     95f:	90                   	nop

00000960 <find>:
{
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	57                   	push   %edi
     964:	56                   	push   %esi
     965:	8d 75 c4             	lea    -0x3c(%ebp),%esi
     968:	53                   	push   %ebx
     969:	83 ec 54             	sub    $0x54,%esp
    strcpy(buffer, file_path);
     96c:	ff 75 08             	push   0x8(%ebp)
{
     96f:	8b 5d 28             	mov    0x28(%ebp),%ebx
    strcpy(buffer, file_path);
     972:	ff 75 24             	push   0x24(%ebp)
     975:	e8 c6 01 00 00       	call   b40 <strcpy>
    point = buffer + strlen(buffer);
     97a:	59                   	pop    %ecx
     97b:	ff 75 24             	push   0x24(%ebp)
     97e:	e8 4d 02 00 00       	call   bd0 <strlen>
     983:	03 45 24             	add    0x24(%ebp),%eax
    while (read(file_des, &entry, len) == len)
     986:	83 c4 10             	add    $0x10,%esp
    point = buffer + strlen(buffer);
     989:	89 c7                	mov    %eax,%edi
    *point++ = '/';
     98b:	83 c0 01             	add    $0x1,%eax
     98e:	89 45 b4             	mov    %eax,-0x4c(%ebp)
     991:	c6 07 2f             	movb   $0x2f,(%edi)
    while (read(file_des, &entry, len) == len)
     994:	eb 11                	jmp    9a7 <find+0x47>
     996:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     99d:	8d 76 00             	lea    0x0(%esi),%esi
        if (entry.inum != 0)
     9a0:	66 83 7d c4 00       	cmpw   $0x0,-0x3c(%ebp)
     9a5:	75 21                	jne    9c8 <find+0x68>
    while (read(file_des, &entry, len) == len)
     9a7:	83 ec 04             	sub    $0x4,%esp
     9aa:	6a 10                	push   $0x10
     9ac:	56                   	push   %esi
     9ad:	53                   	push   %ebx
     9ae:	e8 f8 03 00 00       	call   dab <read>
     9b3:	83 c4 10             	add    $0x10,%esp
     9b6:	83 f8 10             	cmp    $0x10,%eax
     9b9:	74 e5                	je     9a0 <find+0x40>
}
     9bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9be:	5b                   	pop    %ebx
     9bf:	5e                   	pop    %esi
     9c0:	5f                   	pop    %edi
     9c1:	5d                   	pop    %ebp
     9c2:	c3                   	ret    
     9c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9c7:	90                   	nop
            memmove(point, entry.name, DIR_SIZE);
     9c8:	83 ec 04             	sub    $0x4,%esp
     9cb:	8d 45 c6             	lea    -0x3a(%ebp),%eax
     9ce:	6a 14                	push   $0x14
     9d0:	50                   	push   %eax
     9d1:	ff 75 b4             	push   -0x4c(%ebp)
     9d4:	e8 87 03 00 00       	call   d60 <memmove>
            stat(buffer, &metadata);
     9d9:	58                   	pop    %eax
     9da:	8d 45 10             	lea    0x10(%ebp),%eax
     9dd:	5a                   	pop    %edx
     9de:	50                   	push   %eax
     9df:	ff 75 24             	push   0x24(%ebp)
     9e2:	e8 e9 02 00 00       	call   cd0 <stat>
            if (metadata.type == 2 && strcmp(format_name(buffer), filename) == 0)
     9e7:	0f b7 45 10          	movzwl 0x10(%ebp),%eax
            point[DIR_SIZE] = 0;
     9eb:	c6 47 15 00          	movb   $0x0,0x15(%edi)
            if (metadata.type == 2 && strcmp(format_name(buffer), filename) == 0)
     9ef:	83 c4 10             	add    $0x10,%esp
     9f2:	66 83 f8 02          	cmp    $0x2,%ax
     9f6:	0f 84 c4 00 00 00    	je     ac0 <find+0x160>
            else if (metadata.type == 1)
     9fc:	66 83 f8 01          	cmp    $0x1,%ax
     a00:	75 a5                	jne    9a7 <find+0x47>
                if (strcmp(format_name(buffer), ".") != 0 && strcmp(format_name(buffer), "..") != 0)
     a02:	83 ec 0c             	sub    $0xc,%esp
     a05:	ff 75 24             	push   0x24(%ebp)
     a08:	e8 d3 f8 ff ff       	call   2e0 <format_name>
     a0d:	59                   	pop    %ecx
     a0e:	5a                   	pop    %edx
     a0f:	68 19 12 00 00       	push   $0x1219
     a14:	50                   	push   %eax
     a15:	e8 56 01 00 00       	call   b70 <strcmp>
     a1a:	83 c4 10             	add    $0x10,%esp
     a1d:	85 c0                	test   %eax,%eax
     a1f:	74 86                	je     9a7 <find+0x47>
     a21:	83 ec 0c             	sub    $0xc,%esp
     a24:	ff 75 24             	push   0x24(%ebp)
     a27:	e8 b4 f8 ff ff       	call   2e0 <format_name>
     a2c:	59                   	pop    %ecx
     a2d:	5a                   	pop    %edx
     a2e:	68 18 12 00 00       	push   $0x1218
     a33:	50                   	push   %eax
     a34:	e8 37 01 00 00       	call   b70 <strcmp>
     a39:	83 c4 10             	add    $0x10,%esp
     a3c:	85 c0                	test   %eax,%eax
     a3e:	0f 84 63 ff ff ff    	je     9a7 <find+0x47>
                    fstat(file_des, &new_metadata);
     a44:	83 ec 08             	sub    $0x8,%esp
     a47:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     a4a:	50                   	push   %eax
     a4b:	53                   	push   %ebx
     a4c:	e8 9a 03 00 00       	call   deb <fstat>
                    int new_file_des = open(buffer, 0);
     a51:	58                   	pop    %eax
     a52:	5a                   	pop    %edx
     a53:	6a 00                	push   $0x0
     a55:	ff 75 24             	push   0x24(%ebp)
     a58:	e8 76 03 00 00       	call   dd3 <open>
                    if (strcmp(format_name(buffer), filename) == 0 && flag != 0)
     a5d:	59                   	pop    %ecx
     a5e:	ff 75 24             	push   0x24(%ebp)
                    int new_file_des = open(buffer, 0);
     a61:	89 45 b0             	mov    %eax,-0x50(%ebp)
                    if (strcmp(format_name(buffer), filename) == 0 && flag != 0)
     a64:	e8 77 f8 ff ff       	call   2e0 <format_name>
     a69:	5a                   	pop    %edx
     a6a:	59                   	pop    %ecx
     a6b:	ff 75 0c             	push   0xc(%ebp)
     a6e:	50                   	push   %eax
     a6f:	e8 fc 00 00 00       	call   b70 <strcmp>
     a74:	8b 55 2c             	mov    0x2c(%ebp),%edx
     a77:	83 c4 10             	add    $0x10,%esp
     a7a:	85 d2                	test   %edx,%edx
     a7c:	74 08                	je     a86 <find+0x126>
     a7e:	85 c0                	test   %eax,%eax
     a80:	0f 84 9b 00 00 00    	je     b21 <find+0x1c1>
                    find(buffer, filename, new_metadata, buffer, new_file_des, flag);
     a86:	83 ec 08             	sub    $0x8,%esp
     a89:	ff 75 2c             	push   0x2c(%ebp)
     a8c:	ff 75 b0             	push   -0x50(%ebp)
     a8f:	ff 75 24             	push   0x24(%ebp)
     a92:	ff 75 e4             	push   -0x1c(%ebp)
     a95:	ff 75 e0             	push   -0x20(%ebp)
     a98:	ff 75 dc             	push   -0x24(%ebp)
     a9b:	ff 75 d8             	push   -0x28(%ebp)
     a9e:	ff 75 d4             	push   -0x2c(%ebp)
     aa1:	ff 75 0c             	push   0xc(%ebp)
     aa4:	ff 75 24             	push   0x24(%ebp)
     aa7:	e8 b4 fe ff ff       	call   960 <find>
                    close(new_file_des);
     aac:	83 c4 24             	add    $0x24,%esp
     aaf:	ff 75 b0             	push   -0x50(%ebp)
     ab2:	e8 04 03 00 00       	call   dbb <close>
     ab7:	83 c4 10             	add    $0x10,%esp
     aba:	e9 e8 fe ff ff       	jmp    9a7 <find+0x47>
     abf:	90                   	nop
            if (metadata.type == 2 && strcmp(format_name(buffer), filename) == 0)
     ac0:	83 ec 0c             	sub    $0xc,%esp
     ac3:	ff 75 24             	push   0x24(%ebp)
     ac6:	e8 15 f8 ff ff       	call   2e0 <format_name>
     acb:	5a                   	pop    %edx
     acc:	59                   	pop    %ecx
     acd:	ff 75 0c             	push   0xc(%ebp)
     ad0:	50                   	push   %eax
     ad1:	e8 9a 00 00 00       	call   b70 <strcmp>
     ad6:	83 c4 10             	add    $0x10,%esp
     ad9:	85 c0                	test   %eax,%eax
     adb:	74 09                	je     ae6 <find+0x186>
            else if (metadata.type == 1)
     add:	0f b7 45 10          	movzwl 0x10(%ebp),%eax
     ae1:	e9 16 ff ff ff       	jmp    9fc <find+0x9c>
                if (flag == 0)
     ae6:	8b 4d 2c             	mov    0x2c(%ebp),%ecx
     ae9:	85 c9                	test   %ecx,%ecx
     aeb:	75 1a                	jne    b07 <find+0x1a7>
                    printf(1, "%d %s\n", metadata.ino, buffer); // to cover -printi
     aed:	ff 75 24             	push   0x24(%ebp)
     af0:	ff 75 18             	push   0x18(%ebp)
     af3:	68 1b 12 00 00       	push   $0x121b
     af8:	6a 01                	push   $0x1
     afa:	e8 f1 03 00 00       	call   ef0 <printf>
     aff:	83 c4 10             	add    $0x10,%esp
     b02:	e9 a0 fe ff ff       	jmp    9a7 <find+0x47>
                    printf(1, "%s\n", buffer);
     b07:	83 ec 04             	sub    $0x4,%esp
     b0a:	ff 75 24             	push   0x24(%ebp)
     b0d:	68 1e 12 00 00       	push   $0x121e
     b12:	6a 01                	push   $0x1
     b14:	e8 d7 03 00 00       	call   ef0 <printf>
     b19:	83 c4 10             	add    $0x10,%esp
     b1c:	e9 86 fe ff ff       	jmp    9a7 <find+0x47>
                        printf(1, "%s\n", buffer);
     b21:	83 ec 04             	sub    $0x4,%esp
     b24:	ff 75 24             	push   0x24(%ebp)
     b27:	68 1e 12 00 00       	push   $0x121e
     b2c:	6a 01                	push   $0x1
     b2e:	e8 bd 03 00 00       	call   ef0 <printf>
     b33:	83 c4 10             	add    $0x10,%esp
     b36:	e9 4b ff ff ff       	jmp    a86 <find+0x126>
     b3b:	66 90                	xchg   %ax,%ax
     b3d:	66 90                	xchg   %ax,%ax
     b3f:	90                   	nop

00000b40 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     b40:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b41:	31 c0                	xor    %eax,%eax
{
     b43:	89 e5                	mov    %esp,%ebp
     b45:	53                   	push   %ebx
     b46:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b49:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     b50:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     b54:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     b57:	83 c0 01             	add    $0x1,%eax
     b5a:	84 d2                	test   %dl,%dl
     b5c:	75 f2                	jne    b50 <strcpy+0x10>
    ;
  return os;
}
     b5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b61:	89 c8                	mov    %ecx,%eax
     b63:	c9                   	leave  
     b64:	c3                   	ret    
     b65:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b70 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	53                   	push   %ebx
     b74:	8b 55 08             	mov    0x8(%ebp),%edx
     b77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     b7a:	0f b6 02             	movzbl (%edx),%eax
     b7d:	84 c0                	test   %al,%al
     b7f:	75 17                	jne    b98 <strcmp+0x28>
     b81:	eb 3a                	jmp    bbd <strcmp+0x4d>
     b83:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b87:	90                   	nop
     b88:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     b8c:	83 c2 01             	add    $0x1,%edx
     b8f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     b92:	84 c0                	test   %al,%al
     b94:	74 1a                	je     bb0 <strcmp+0x40>
    p++, q++;
     b96:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     b98:	0f b6 19             	movzbl (%ecx),%ebx
     b9b:	38 c3                	cmp    %al,%bl
     b9d:	74 e9                	je     b88 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     b9f:	29 d8                	sub    %ebx,%eax
}
     ba1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ba4:	c9                   	leave  
     ba5:	c3                   	ret    
     ba6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     bb0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     bb4:	31 c0                	xor    %eax,%eax
     bb6:	29 d8                	sub    %ebx,%eax
}
     bb8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bbb:	c9                   	leave  
     bbc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     bbd:	0f b6 19             	movzbl (%ecx),%ebx
     bc0:	31 c0                	xor    %eax,%eax
     bc2:	eb db                	jmp    b9f <strcmp+0x2f>
     bc4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bcb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bcf:	90                   	nop

00000bd0 <strlen>:

uint
strlen(const char *s)
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     bd6:	80 3a 00             	cmpb   $0x0,(%edx)
     bd9:	74 15                	je     bf0 <strlen+0x20>
     bdb:	31 c0                	xor    %eax,%eax
     bdd:	8d 76 00             	lea    0x0(%esi),%esi
     be0:	83 c0 01             	add    $0x1,%eax
     be3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     be7:	89 c1                	mov    %eax,%ecx
     be9:	75 f5                	jne    be0 <strlen+0x10>
    ;
  return n;
}
     beb:	89 c8                	mov    %ecx,%eax
     bed:	5d                   	pop    %ebp
     bee:	c3                   	ret    
     bef:	90                   	nop
  for(n = 0; s[n]; n++)
     bf0:	31 c9                	xor    %ecx,%ecx
}
     bf2:	5d                   	pop    %ebp
     bf3:	89 c8                	mov    %ecx,%eax
     bf5:	c3                   	ret    
     bf6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfd:	8d 76 00             	lea    0x0(%esi),%esi

00000c00 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	57                   	push   %edi
     c04:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c07:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c0a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c0d:	89 d7                	mov    %edx,%edi
     c0f:	fc                   	cld    
     c10:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     c12:	8b 7d fc             	mov    -0x4(%ebp),%edi
     c15:	89 d0                	mov    %edx,%eax
     c17:	c9                   	leave  
     c18:	c3                   	ret    
     c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c20 <strchr>:

char*
strchr(const char *s, char c)
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	8b 45 08             	mov    0x8(%ebp),%eax
     c26:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     c2a:	0f b6 10             	movzbl (%eax),%edx
     c2d:	84 d2                	test   %dl,%dl
     c2f:	75 12                	jne    c43 <strchr+0x23>
     c31:	eb 1d                	jmp    c50 <strchr+0x30>
     c33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c37:	90                   	nop
     c38:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     c3c:	83 c0 01             	add    $0x1,%eax
     c3f:	84 d2                	test   %dl,%dl
     c41:	74 0d                	je     c50 <strchr+0x30>
    if(*s == c)
     c43:	38 d1                	cmp    %dl,%cl
     c45:	75 f1                	jne    c38 <strchr+0x18>
      return (char*)s;
  return 0;
}
     c47:	5d                   	pop    %ebp
     c48:	c3                   	ret    
     c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     c50:	31 c0                	xor    %eax,%eax
}
     c52:	5d                   	pop    %ebp
     c53:	c3                   	ret    
     c54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c5f:	90                   	nop

00000c60 <gets>:

char*
gets(char *buf, int max)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	57                   	push   %edi
     c64:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     c65:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     c68:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     c69:	31 db                	xor    %ebx,%ebx
{
     c6b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     c6e:	eb 27                	jmp    c97 <gets+0x37>
    cc = read(0, &c, 1);
     c70:	83 ec 04             	sub    $0x4,%esp
     c73:	6a 01                	push   $0x1
     c75:	57                   	push   %edi
     c76:	6a 00                	push   $0x0
     c78:	e8 2e 01 00 00       	call   dab <read>
    if(cc < 1)
     c7d:	83 c4 10             	add    $0x10,%esp
     c80:	85 c0                	test   %eax,%eax
     c82:	7e 1d                	jle    ca1 <gets+0x41>
      break;
    buf[i++] = c;
     c84:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c88:	8b 55 08             	mov    0x8(%ebp),%edx
     c8b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     c8f:	3c 0a                	cmp    $0xa,%al
     c91:	74 1d                	je     cb0 <gets+0x50>
     c93:	3c 0d                	cmp    $0xd,%al
     c95:	74 19                	je     cb0 <gets+0x50>
  for(i=0; i+1 < max; ){
     c97:	89 de                	mov    %ebx,%esi
     c99:	83 c3 01             	add    $0x1,%ebx
     c9c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     c9f:	7c cf                	jl     c70 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     ca1:	8b 45 08             	mov    0x8(%ebp),%eax
     ca4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     ca8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cab:	5b                   	pop    %ebx
     cac:	5e                   	pop    %esi
     cad:	5f                   	pop    %edi
     cae:	5d                   	pop    %ebp
     caf:	c3                   	ret    
  buf[i] = '\0';
     cb0:	8b 45 08             	mov    0x8(%ebp),%eax
     cb3:	89 de                	mov    %ebx,%esi
     cb5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     cb9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cbc:	5b                   	pop    %ebx
     cbd:	5e                   	pop    %esi
     cbe:	5f                   	pop    %edi
     cbf:	5d                   	pop    %ebp
     cc0:	c3                   	ret    
     cc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cc8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ccf:	90                   	nop

00000cd0 <stat>:

int
stat(const char *n, struct stat *st)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	56                   	push   %esi
     cd4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     cd5:	83 ec 08             	sub    $0x8,%esp
     cd8:	6a 00                	push   $0x0
     cda:	ff 75 08             	push   0x8(%ebp)
     cdd:	e8 f1 00 00 00       	call   dd3 <open>
  if(fd < 0)
     ce2:	83 c4 10             	add    $0x10,%esp
     ce5:	85 c0                	test   %eax,%eax
     ce7:	78 27                	js     d10 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     ce9:	83 ec 08             	sub    $0x8,%esp
     cec:	ff 75 0c             	push   0xc(%ebp)
     cef:	89 c3                	mov    %eax,%ebx
     cf1:	50                   	push   %eax
     cf2:	e8 f4 00 00 00       	call   deb <fstat>
  close(fd);
     cf7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     cfa:	89 c6                	mov    %eax,%esi
  close(fd);
     cfc:	e8 ba 00 00 00       	call   dbb <close>
  return r;
     d01:	83 c4 10             	add    $0x10,%esp
}
     d04:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d07:	89 f0                	mov    %esi,%eax
     d09:	5b                   	pop    %ebx
     d0a:	5e                   	pop    %esi
     d0b:	5d                   	pop    %ebp
     d0c:	c3                   	ret    
     d0d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     d10:	be ff ff ff ff       	mov    $0xffffffff,%esi
     d15:	eb ed                	jmp    d04 <stat+0x34>
     d17:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d1e:	66 90                	xchg   %ax,%ax

00000d20 <atoi>:

int
atoi(const char *s)
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	53                   	push   %ebx
     d24:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d27:	0f be 02             	movsbl (%edx),%eax
     d2a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     d2d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     d30:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     d35:	77 1e                	ja     d55 <atoi+0x35>
     d37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d3e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     d40:	83 c2 01             	add    $0x1,%edx
     d43:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     d46:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     d4a:	0f be 02             	movsbl (%edx),%eax
     d4d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     d50:	80 fb 09             	cmp    $0x9,%bl
     d53:	76 eb                	jbe    d40 <atoi+0x20>
  return n;
}
     d55:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d58:	89 c8                	mov    %ecx,%eax
     d5a:	c9                   	leave  
     d5b:	c3                   	ret    
     d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d60 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	57                   	push   %edi
     d64:	8b 45 10             	mov    0x10(%ebp),%eax
     d67:	8b 55 08             	mov    0x8(%ebp),%edx
     d6a:	56                   	push   %esi
     d6b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d6e:	85 c0                	test   %eax,%eax
     d70:	7e 13                	jle    d85 <memmove+0x25>
     d72:	01 d0                	add    %edx,%eax
  dst = vdst;
     d74:	89 d7                	mov    %edx,%edi
     d76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d7d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     d80:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     d81:	39 f8                	cmp    %edi,%eax
     d83:	75 fb                	jne    d80 <memmove+0x20>
  return vdst;
}
     d85:	5e                   	pop    %esi
     d86:	89 d0                	mov    %edx,%eax
     d88:	5f                   	pop    %edi
     d89:	5d                   	pop    %ebp
     d8a:	c3                   	ret    

00000d8b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d8b:	b8 01 00 00 00       	mov    $0x1,%eax
     d90:	cd 40                	int    $0x40
     d92:	c3                   	ret    

00000d93 <exit>:
SYSCALL(exit)
     d93:	b8 02 00 00 00       	mov    $0x2,%eax
     d98:	cd 40                	int    $0x40
     d9a:	c3                   	ret    

00000d9b <wait>:
SYSCALL(wait)
     d9b:	b8 03 00 00 00       	mov    $0x3,%eax
     da0:	cd 40                	int    $0x40
     da2:	c3                   	ret    

00000da3 <pipe>:
SYSCALL(pipe)
     da3:	b8 04 00 00 00       	mov    $0x4,%eax
     da8:	cd 40                	int    $0x40
     daa:	c3                   	ret    

00000dab <read>:
SYSCALL(read)
     dab:	b8 05 00 00 00       	mov    $0x5,%eax
     db0:	cd 40                	int    $0x40
     db2:	c3                   	ret    

00000db3 <write>:
SYSCALL(write)
     db3:	b8 10 00 00 00       	mov    $0x10,%eax
     db8:	cd 40                	int    $0x40
     dba:	c3                   	ret    

00000dbb <close>:
SYSCALL(close)
     dbb:	b8 15 00 00 00       	mov    $0x15,%eax
     dc0:	cd 40                	int    $0x40
     dc2:	c3                   	ret    

00000dc3 <kill>:
SYSCALL(kill)
     dc3:	b8 06 00 00 00       	mov    $0x6,%eax
     dc8:	cd 40                	int    $0x40
     dca:	c3                   	ret    

00000dcb <exec>:
SYSCALL(exec)
     dcb:	b8 07 00 00 00       	mov    $0x7,%eax
     dd0:	cd 40                	int    $0x40
     dd2:	c3                   	ret    

00000dd3 <open>:
SYSCALL(open)
     dd3:	b8 0f 00 00 00       	mov    $0xf,%eax
     dd8:	cd 40                	int    $0x40
     dda:	c3                   	ret    

00000ddb <mknod>:
SYSCALL(mknod)
     ddb:	b8 11 00 00 00       	mov    $0x11,%eax
     de0:	cd 40                	int    $0x40
     de2:	c3                   	ret    

00000de3 <unlink>:
SYSCALL(unlink)
     de3:	b8 12 00 00 00       	mov    $0x12,%eax
     de8:	cd 40                	int    $0x40
     dea:	c3                   	ret    

00000deb <fstat>:
SYSCALL(fstat)
     deb:	b8 08 00 00 00       	mov    $0x8,%eax
     df0:	cd 40                	int    $0x40
     df2:	c3                   	ret    

00000df3 <link>:
SYSCALL(link)
     df3:	b8 13 00 00 00       	mov    $0x13,%eax
     df8:	cd 40                	int    $0x40
     dfa:	c3                   	ret    

00000dfb <mkdir>:
SYSCALL(mkdir)
     dfb:	b8 14 00 00 00       	mov    $0x14,%eax
     e00:	cd 40                	int    $0x40
     e02:	c3                   	ret    

00000e03 <chdir>:
SYSCALL(chdir)
     e03:	b8 09 00 00 00       	mov    $0x9,%eax
     e08:	cd 40                	int    $0x40
     e0a:	c3                   	ret    

00000e0b <dup>:
SYSCALL(dup)
     e0b:	b8 0a 00 00 00       	mov    $0xa,%eax
     e10:	cd 40                	int    $0x40
     e12:	c3                   	ret    

00000e13 <getpid>:
SYSCALL(getpid)
     e13:	b8 0b 00 00 00       	mov    $0xb,%eax
     e18:	cd 40                	int    $0x40
     e1a:	c3                   	ret    

00000e1b <sbrk>:
SYSCALL(sbrk)
     e1b:	b8 0c 00 00 00       	mov    $0xc,%eax
     e20:	cd 40                	int    $0x40
     e22:	c3                   	ret    

00000e23 <sleep>:
SYSCALL(sleep)
     e23:	b8 0d 00 00 00       	mov    $0xd,%eax
     e28:	cd 40                	int    $0x40
     e2a:	c3                   	ret    

00000e2b <uptime>:
SYSCALL(uptime)
     e2b:	b8 0e 00 00 00       	mov    $0xe,%eax
     e30:	cd 40                	int    $0x40
     e32:	c3                   	ret    
     e33:	66 90                	xchg   %ax,%ax
     e35:	66 90                	xchg   %ax,%ax
     e37:	66 90                	xchg   %ax,%ax
     e39:	66 90                	xchg   %ax,%ax
     e3b:	66 90                	xchg   %ax,%ax
     e3d:	66 90                	xchg   %ax,%ax
     e3f:	90                   	nop

00000e40 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
     e46:	83 ec 3c             	sub    $0x3c,%esp
     e49:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     e4c:	89 d1                	mov    %edx,%ecx
{
     e4e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     e51:	85 d2                	test   %edx,%edx
     e53:	0f 89 7f 00 00 00    	jns    ed8 <printint+0x98>
     e59:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     e5d:	74 79                	je     ed8 <printint+0x98>
    neg = 1;
     e5f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     e66:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     e68:	31 db                	xor    %ebx,%ebx
     e6a:	8d 75 d7             	lea    -0x29(%ebp),%esi
     e6d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     e70:	89 c8                	mov    %ecx,%eax
     e72:	31 d2                	xor    %edx,%edx
     e74:	89 cf                	mov    %ecx,%edi
     e76:	f7 75 c4             	divl   -0x3c(%ebp)
     e79:	0f b6 92 20 14 00 00 	movzbl 0x1420(%edx),%edx
     e80:	89 45 c0             	mov    %eax,-0x40(%ebp)
     e83:	89 d8                	mov    %ebx,%eax
     e85:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     e88:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     e8b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     e8e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     e91:	76 dd                	jbe    e70 <printint+0x30>
  if(neg)
     e93:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     e96:	85 c9                	test   %ecx,%ecx
     e98:	74 0c                	je     ea6 <printint+0x66>
    buf[i++] = '-';
     e9a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     e9f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     ea1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     ea6:	8b 7d b8             	mov    -0x48(%ebp),%edi
     ea9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     ead:	eb 07                	jmp    eb6 <printint+0x76>
     eaf:	90                   	nop
    putc(fd, buf[i]);
     eb0:	0f b6 13             	movzbl (%ebx),%edx
     eb3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     eb6:	83 ec 04             	sub    $0x4,%esp
     eb9:	88 55 d7             	mov    %dl,-0x29(%ebp)
     ebc:	6a 01                	push   $0x1
     ebe:	56                   	push   %esi
     ebf:	57                   	push   %edi
     ec0:	e8 ee fe ff ff       	call   db3 <write>
  while(--i >= 0)
     ec5:	83 c4 10             	add    $0x10,%esp
     ec8:	39 de                	cmp    %ebx,%esi
     eca:	75 e4                	jne    eb0 <printint+0x70>
}
     ecc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ecf:	5b                   	pop    %ebx
     ed0:	5e                   	pop    %esi
     ed1:	5f                   	pop    %edi
     ed2:	5d                   	pop    %ebp
     ed3:	c3                   	ret    
     ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     ed8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
     edf:	eb 87                	jmp    e68 <printint+0x28>
     ee1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ee8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eef:	90                   	nop

00000ef0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	57                   	push   %edi
     ef4:	56                   	push   %esi
     ef5:	53                   	push   %ebx
     ef6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ef9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
     efc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
     eff:	0f b6 13             	movzbl (%ebx),%edx
     f02:	84 d2                	test   %dl,%dl
     f04:	74 6a                	je     f70 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
     f06:	8d 45 10             	lea    0x10(%ebp),%eax
     f09:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     f0c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
     f0f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
     f11:	89 45 d0             	mov    %eax,-0x30(%ebp)
     f14:	eb 36                	jmp    f4c <printf+0x5c>
     f16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f1d:	8d 76 00             	lea    0x0(%esi),%esi
     f20:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     f23:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
     f28:	83 f8 25             	cmp    $0x25,%eax
     f2b:	74 15                	je     f42 <printf+0x52>
  write(fd, &c, 1);
     f2d:	83 ec 04             	sub    $0x4,%esp
     f30:	88 55 e7             	mov    %dl,-0x19(%ebp)
     f33:	6a 01                	push   $0x1
     f35:	57                   	push   %edi
     f36:	56                   	push   %esi
     f37:	e8 77 fe ff ff       	call   db3 <write>
     f3c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
     f3f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     f42:	0f b6 13             	movzbl (%ebx),%edx
     f45:	83 c3 01             	add    $0x1,%ebx
     f48:	84 d2                	test   %dl,%dl
     f4a:	74 24                	je     f70 <printf+0x80>
    c = fmt[i] & 0xff;
     f4c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
     f4f:	85 c9                	test   %ecx,%ecx
     f51:	74 cd                	je     f20 <printf+0x30>
      }
    } else if(state == '%'){
     f53:	83 f9 25             	cmp    $0x25,%ecx
     f56:	75 ea                	jne    f42 <printf+0x52>
      if(c == 'd'){
     f58:	83 f8 25             	cmp    $0x25,%eax
     f5b:	0f 84 07 01 00 00    	je     1068 <printf+0x178>
     f61:	83 e8 63             	sub    $0x63,%eax
     f64:	83 f8 15             	cmp    $0x15,%eax
     f67:	77 17                	ja     f80 <printf+0x90>
     f69:	ff 24 85 c8 13 00 00 	jmp    *0x13c8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     f70:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f73:	5b                   	pop    %ebx
     f74:	5e                   	pop    %esi
     f75:	5f                   	pop    %edi
     f76:	5d                   	pop    %ebp
     f77:	c3                   	ret    
     f78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f7f:	90                   	nop
  write(fd, &c, 1);
     f80:	83 ec 04             	sub    $0x4,%esp
     f83:	88 55 d4             	mov    %dl,-0x2c(%ebp)
     f86:	6a 01                	push   $0x1
     f88:	57                   	push   %edi
     f89:	56                   	push   %esi
     f8a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f8e:	e8 20 fe ff ff       	call   db3 <write>
        putc(fd, c);
     f93:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
     f97:	83 c4 0c             	add    $0xc,%esp
     f9a:	88 55 e7             	mov    %dl,-0x19(%ebp)
     f9d:	6a 01                	push   $0x1
     f9f:	57                   	push   %edi
     fa0:	56                   	push   %esi
     fa1:	e8 0d fe ff ff       	call   db3 <write>
        putc(fd, c);
     fa6:	83 c4 10             	add    $0x10,%esp
      state = 0;
     fa9:	31 c9                	xor    %ecx,%ecx
     fab:	eb 95                	jmp    f42 <printf+0x52>
     fad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
     fb0:	83 ec 0c             	sub    $0xc,%esp
     fb3:	b9 10 00 00 00       	mov    $0x10,%ecx
     fb8:	6a 00                	push   $0x0
     fba:	8b 45 d0             	mov    -0x30(%ebp),%eax
     fbd:	8b 10                	mov    (%eax),%edx
     fbf:	89 f0                	mov    %esi,%eax
     fc1:	e8 7a fe ff ff       	call   e40 <printint>
        ap++;
     fc6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
     fca:	83 c4 10             	add    $0x10,%esp
      state = 0;
     fcd:	31 c9                	xor    %ecx,%ecx
     fcf:	e9 6e ff ff ff       	jmp    f42 <printf+0x52>
     fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     fd8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     fdb:	8b 10                	mov    (%eax),%edx
        ap++;
     fdd:	83 c0 04             	add    $0x4,%eax
     fe0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     fe3:	85 d2                	test   %edx,%edx
     fe5:	0f 84 8d 00 00 00    	je     1078 <printf+0x188>
        while(*s != 0){
     feb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
     fee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
     ff0:	84 c0                	test   %al,%al
     ff2:	0f 84 4a ff ff ff    	je     f42 <printf+0x52>
     ff8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     ffb:	89 d3                	mov    %edx,%ebx
     ffd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1000:	83 ec 04             	sub    $0x4,%esp
          s++;
    1003:	83 c3 01             	add    $0x1,%ebx
    1006:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1009:	6a 01                	push   $0x1
    100b:	57                   	push   %edi
    100c:	56                   	push   %esi
    100d:	e8 a1 fd ff ff       	call   db3 <write>
        while(*s != 0){
    1012:	0f b6 03             	movzbl (%ebx),%eax
    1015:	83 c4 10             	add    $0x10,%esp
    1018:	84 c0                	test   %al,%al
    101a:	75 e4                	jne    1000 <printf+0x110>
      state = 0;
    101c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    101f:	31 c9                	xor    %ecx,%ecx
    1021:	e9 1c ff ff ff       	jmp    f42 <printf+0x52>
    1026:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1038:	6a 01                	push   $0x1
    103a:	e9 7b ff ff ff       	jmp    fba <printf+0xca>
    103f:	90                   	nop
        putc(fd, *ap);
    1040:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1043:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1046:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1048:	6a 01                	push   $0x1
    104a:	57                   	push   %edi
    104b:	56                   	push   %esi
        putc(fd, *ap);
    104c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    104f:	e8 5f fd ff ff       	call   db3 <write>
        ap++;
    1054:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1058:	83 c4 10             	add    $0x10,%esp
      state = 0;
    105b:	31 c9                	xor    %ecx,%ecx
    105d:	e9 e0 fe ff ff       	jmp    f42 <printf+0x52>
    1062:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    1068:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    106b:	83 ec 04             	sub    $0x4,%esp
    106e:	e9 2a ff ff ff       	jmp    f9d <printf+0xad>
    1073:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1077:	90                   	nop
          s = "(null)";
    1078:	ba bf 13 00 00       	mov    $0x13bf,%edx
        while(*s != 0){
    107d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    1080:	b8 28 00 00 00       	mov    $0x28,%eax
    1085:	89 d3                	mov    %edx,%ebx
    1087:	e9 74 ff ff ff       	jmp    1000 <printf+0x110>
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1090:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1091:	a1 04 18 00 00       	mov    0x1804,%eax
{
    1096:	89 e5                	mov    %esp,%ebp
    1098:	57                   	push   %edi
    1099:	56                   	push   %esi
    109a:	53                   	push   %ebx
    109b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    109e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10a8:	89 c2                	mov    %eax,%edx
    10aa:	8b 00                	mov    (%eax),%eax
    10ac:	39 ca                	cmp    %ecx,%edx
    10ae:	73 30                	jae    10e0 <free+0x50>
    10b0:	39 c1                	cmp    %eax,%ecx
    10b2:	72 04                	jb     10b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10b4:	39 c2                	cmp    %eax,%edx
    10b6:	72 f0                	jb     10a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    10b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    10bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    10be:	39 f8                	cmp    %edi,%eax
    10c0:	74 30                	je     10f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    10c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    10c5:	8b 42 04             	mov    0x4(%edx),%eax
    10c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    10cb:	39 f1                	cmp    %esi,%ecx
    10cd:	74 3a                	je     1109 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    10cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    10d1:	5b                   	pop    %ebx
  freep = p;
    10d2:	89 15 04 18 00 00    	mov    %edx,0x1804
}
    10d8:	5e                   	pop    %esi
    10d9:	5f                   	pop    %edi
    10da:	5d                   	pop    %ebp
    10db:	c3                   	ret    
    10dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10e0:	39 c2                	cmp    %eax,%edx
    10e2:	72 c4                	jb     10a8 <free+0x18>
    10e4:	39 c1                	cmp    %eax,%ecx
    10e6:	73 c0                	jae    10a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    10e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    10eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    10ee:	39 f8                	cmp    %edi,%eax
    10f0:	75 d0                	jne    10c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    10f2:	03 70 04             	add    0x4(%eax),%esi
    10f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    10f8:	8b 02                	mov    (%edx),%eax
    10fa:	8b 00                	mov    (%eax),%eax
    10fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    10ff:	8b 42 04             	mov    0x4(%edx),%eax
    1102:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1105:	39 f1                	cmp    %esi,%ecx
    1107:	75 c6                	jne    10cf <free+0x3f>
    p->s.size += bp->s.size;
    1109:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    110c:	89 15 04 18 00 00    	mov    %edx,0x1804
    p->s.size += bp->s.size;
    1112:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1115:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1118:	89 0a                	mov    %ecx,(%edx)
}
    111a:	5b                   	pop    %ebx
    111b:	5e                   	pop    %esi
    111c:	5f                   	pop    %edi
    111d:	5d                   	pop    %ebp
    111e:	c3                   	ret    
    111f:	90                   	nop

00001120 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	57                   	push   %edi
    1124:	56                   	push   %esi
    1125:	53                   	push   %ebx
    1126:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1129:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    112c:	8b 3d 04 18 00 00    	mov    0x1804,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1132:	8d 70 07             	lea    0x7(%eax),%esi
    1135:	c1 ee 03             	shr    $0x3,%esi
    1138:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    113b:	85 ff                	test   %edi,%edi
    113d:	0f 84 9d 00 00 00    	je     11e0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1143:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1145:	8b 4a 04             	mov    0x4(%edx),%ecx
    1148:	39 f1                	cmp    %esi,%ecx
    114a:	73 6a                	jae    11b6 <malloc+0x96>
    114c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1151:	39 de                	cmp    %ebx,%esi
    1153:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1156:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    115d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1160:	eb 17                	jmp    1179 <malloc+0x59>
    1162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1168:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    116a:	8b 48 04             	mov    0x4(%eax),%ecx
    116d:	39 f1                	cmp    %esi,%ecx
    116f:	73 4f                	jae    11c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1171:	8b 3d 04 18 00 00    	mov    0x1804,%edi
    1177:	89 c2                	mov    %eax,%edx
    1179:	39 d7                	cmp    %edx,%edi
    117b:	75 eb                	jne    1168 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    117d:	83 ec 0c             	sub    $0xc,%esp
    1180:	ff 75 e4             	push   -0x1c(%ebp)
    1183:	e8 93 fc ff ff       	call   e1b <sbrk>
  if(p == (char*)-1)
    1188:	83 c4 10             	add    $0x10,%esp
    118b:	83 f8 ff             	cmp    $0xffffffff,%eax
    118e:	74 1c                	je     11ac <malloc+0x8c>
  hp->s.size = nu;
    1190:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1193:	83 ec 0c             	sub    $0xc,%esp
    1196:	83 c0 08             	add    $0x8,%eax
    1199:	50                   	push   %eax
    119a:	e8 f1 fe ff ff       	call   1090 <free>
  return freep;
    119f:	8b 15 04 18 00 00    	mov    0x1804,%edx
      if((p = morecore(nunits)) == 0)
    11a5:	83 c4 10             	add    $0x10,%esp
    11a8:	85 d2                	test   %edx,%edx
    11aa:	75 bc                	jne    1168 <malloc+0x48>
        return 0;
  }
}
    11ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    11af:	31 c0                	xor    %eax,%eax
}
    11b1:	5b                   	pop    %ebx
    11b2:	5e                   	pop    %esi
    11b3:	5f                   	pop    %edi
    11b4:	5d                   	pop    %ebp
    11b5:	c3                   	ret    
    if(p->s.size >= nunits){
    11b6:	89 d0                	mov    %edx,%eax
    11b8:	89 fa                	mov    %edi,%edx
    11ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    11c0:	39 ce                	cmp    %ecx,%esi
    11c2:	74 4c                	je     1210 <malloc+0xf0>
        p->s.size -= nunits;
    11c4:	29 f1                	sub    %esi,%ecx
    11c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    11c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    11cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    11cf:	89 15 04 18 00 00    	mov    %edx,0x1804
}
    11d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    11d8:	83 c0 08             	add    $0x8,%eax
}
    11db:	5b                   	pop    %ebx
    11dc:	5e                   	pop    %esi
    11dd:	5f                   	pop    %edi
    11de:	5d                   	pop    %ebp
    11df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    11e0:	c7 05 04 18 00 00 08 	movl   $0x1808,0x1804
    11e7:	18 00 00 
    base.s.size = 0;
    11ea:	bf 08 18 00 00       	mov    $0x1808,%edi
    base.s.ptr = freep = prevp = &base;
    11ef:	c7 05 08 18 00 00 08 	movl   $0x1808,0x1808
    11f6:	18 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    11fb:	c7 05 0c 18 00 00 00 	movl   $0x0,0x180c
    1202:	00 00 00 
    if(p->s.size >= nunits){
    1205:	e9 42 ff ff ff       	jmp    114c <malloc+0x2c>
    120a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1210:	8b 08                	mov    (%eax),%ecx
    1212:	89 0a                	mov    %ecx,(%edx)
    1214:	eb b9                	jmp    11cf <malloc+0xaf>
