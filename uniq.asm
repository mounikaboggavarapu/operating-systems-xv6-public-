
_uniq:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    exit();
  }
}

// Main function
int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd;
  char *option;
  //initialize w for strong number in -w flag
  int w = 0;

  if(argc <= 1){
  19:	83 f8 01             	cmp    $0x1,%eax
  1c:	7e 2a                	jle    48 <main+0x48>
    uniq(0, 0, 0);  
    exit();
  }

  // -w flag in format [N]
  if (argc == 4 && strcmp(argv[1], "-w") == 0 && argv[2][0] =='[') {
  1e:	83 f8 04             	cmp    $0x4,%eax
  21:	0f 84 ce 00 00 00    	je     f5 <main+0xf5>
    exit();
  }    
    

  // handling the -c, -u
  if(argc == 3) {
  27:	83 f8 03             	cmp    $0x3,%eax
  2a:	74 2d                	je     59 <main+0x59>
      printf(1, "unable to open the file %s\n", option);
      close(fd);
      exit();
    }
    close(fd);
  } else if(argc == 2) {
  2c:	83 f8 02             	cmp    $0x2,%eax
  2f:	0f 84 8c 00 00 00    	je     c1 <main+0xc1>
      exit();
    }
    uniq(fd, 0, 0);
    close(fd);
  } else {
    printf(1, "format: uniq [-c | -u | -w [N]] [file]\n");
  35:	52                   	push   %edx
  36:	52                   	push   %edx
  37:	68 a0 0c 00 00       	push   $0xca0
  3c:	6a 01                	push   $0x1
  3e:	e8 dd 08 00 00       	call   920 <printf>
    exit();
  43:	e8 7b 07 00 00       	call   7c3 <exit>
    uniq(0, 0, 0);  
  48:	50                   	push   %eax
  49:	6a 00                	push   $0x0
  4b:	6a 00                	push   $0x0
  4d:	6a 00                	push   $0x0
  4f:	e8 3c 02 00 00       	call   290 <uniq>
    exit();
  54:	e8 6a 07 00 00       	call   7c3 <exit>
    option = argv[1];
  59:	8b 7b 04             	mov    0x4(%ebx),%edi
    if((fd = open(argv[2], 0)) < 0){
  5c:	51                   	push   %ecx
  5d:	51                   	push   %ecx
  5e:	6a 00                	push   $0x0
  60:	ff 73 08             	push   0x8(%ebx)
  63:	e8 9b 07 00 00       	call   803 <open>
  68:	83 c4 10             	add    $0x10,%esp
  6b:	89 c6                	mov    %eax,%esi
  6d:	85 c0                	test   %eax,%eax
  6f:	0f 88 0c 01 00 00    	js     181 <main+0x181>
    if(strcmp(option, "-c") == 0) {
  75:	50                   	push   %eax
  76:	50                   	push   %eax
  77:	68 80 0c 00 00       	push   $0xc80
  7c:	57                   	push   %edi
  7d:	e8 1e 05 00 00       	call   5a0 <strcmp>
  82:	83 c4 10             	add    $0x10,%esp
  85:	85 c0                	test   %eax,%eax
  87:	0f 84 09 01 00 00    	je     196 <main+0x196>
    } else if(strcmp(option, "-u") == 0) {
  8d:	50                   	push   %eax
  8e:	50                   	push   %eax
  8f:	68 83 0c 00 00       	push   $0xc83
  94:	57                   	push   %edi
  95:	e8 06 05 00 00       	call   5a0 <strcmp>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	85 c0                	test   %eax,%eax
  9f:	0f 85 19 01 00 00    	jne    1be <main+0x1be>
      uniq(fd, 2, 0);
  a5:	50                   	push   %eax
  a6:	6a 00                	push   $0x0
  a8:	6a 02                	push   $0x2
  aa:	56                   	push   %esi
  ab:	e8 e0 01 00 00       	call   290 <uniq>
  b0:	83 c4 10             	add    $0x10,%esp
    close(fd);
  b3:	83 ec 0c             	sub    $0xc,%esp
  b6:	56                   	push   %esi
  b7:	e8 2f 07 00 00       	call   7eb <close>
  bc:	83 c4 10             	add    $0x10,%esp
  bf:	eb 2f                	jmp    f0 <main+0xf0>
    if((fd = open(argv[1], 0)) < 0){
  c1:	57                   	push   %edi
  c2:	57                   	push   %edi
  c3:	6a 00                	push   $0x0
  c5:	ff 73 04             	push   0x4(%ebx)
  c8:	e8 36 07 00 00       	call   803 <open>
  cd:	83 c4 10             	add    $0x10,%esp
  d0:	89 c6                	mov    %eax,%esi
  d2:	85 c0                	test   %eax,%eax
  d4:	0f 88 92 00 00 00    	js     16c <main+0x16c>
    uniq(fd, 0, 0);
  da:	51                   	push   %ecx
  db:	6a 00                	push   $0x0
  dd:	6a 00                	push   $0x0
  df:	50                   	push   %eax
  e0:	e8 ab 01 00 00       	call   290 <uniq>
    close(fd);
  e5:	89 34 24             	mov    %esi,(%esp)
  e8:	e8 fe 06 00 00       	call   7eb <close>
  ed:	83 c4 10             	add    $0x10,%esp
  }
  exit();
  f0:	e8 ce 06 00 00       	call   7c3 <exit>
  if (argc == 4 && strcmp(argv[1], "-w") == 0 && argv[2][0] =='[') {
  f5:	50                   	push   %eax
  f6:	50                   	push   %eax
  f7:	68 61 0c 00 00       	push   $0xc61
  fc:	ff 73 04             	push   0x4(%ebx)
  ff:	e8 9c 04 00 00       	call   5a0 <strcmp>
 104:	83 c4 10             	add    $0x10,%esp
 107:	89 c6                	mov    %eax,%esi
 109:	85 c0                	test   %eax,%eax
 10b:	75 0c                	jne    119 <main+0x119>
 10d:	8b 7b 08             	mov    0x8(%ebx),%edi
 110:	80 3f 5b             	cmpb   $0x5b,(%edi)
 113:	0f 84 c0 00 00 00    	je     1d9 <main+0x1d9>
  else if(argc == 4 && strcmp(argv[1], "-w") == 0){
 119:	50                   	push   %eax
 11a:	50                   	push   %eax
 11b:	68 61 0c 00 00       	push   $0xc61
 120:	ff 73 04             	push   0x4(%ebx)
 123:	e8 78 04 00 00       	call   5a0 <strcmp>
 128:	83 c4 10             	add    $0x10,%esp
 12b:	85 c0                	test   %eax,%eax
 12d:	0f 85 02 ff ff ff    	jne    35 <main+0x35>
    w = atoi(argv[2]);
 133:	83 ec 0c             	sub    $0xc,%esp
 136:	ff 73 08             	push   0x8(%ebx)
 139:	e8 12 06 00 00       	call   750 <atoi>
 13e:	89 c7                	mov    %eax,%edi
    if((fd = open(argv[3], 0)) < 0){
 140:	58                   	pop    %eax
 141:	5a                   	pop    %edx
 142:	6a 00                	push   $0x0
 144:	ff 73 0c             	push   0xc(%ebx)
 147:	e8 b7 06 00 00       	call   803 <open>
 14c:	83 c4 10             	add    $0x10,%esp
 14f:	89 c6                	mov    %eax,%esi
 151:	85 c0                	test   %eax,%eax
 153:	78 54                	js     1a9 <main+0x1a9>
    uniq(fd, 3, w);
 155:	53                   	push   %ebx
 156:	57                   	push   %edi
 157:	6a 03                	push   $0x3
 159:	50                   	push   %eax
 15a:	e8 31 01 00 00       	call   290 <uniq>
    close(fd);
 15f:	89 34 24             	mov    %esi,(%esp)
 162:	e8 84 06 00 00       	call   7eb <close>
    exit();
 167:	e8 57 06 00 00       	call   7c3 <exit>
      printf(1, "unable to open file %s\n", argv[1]);
 16c:	56                   	push   %esi
 16d:	ff 73 04             	push   0x4(%ebx)
 170:	68 86 0c 00 00       	push   $0xc86
 175:	6a 01                	push   $0x1
 177:	e8 a4 07 00 00       	call   920 <printf>
      exit();
 17c:	e8 42 06 00 00       	call   7c3 <exit>
      printf(1, "unable to open the file %s\n", argv[2]);
 181:	52                   	push   %edx
 182:	ff 73 08             	push   0x8(%ebx)
 185:	68 64 0c 00 00       	push   $0xc64
 18a:	6a 01                	push   $0x1
 18c:	e8 8f 07 00 00       	call   920 <printf>
      exit();
 191:	e8 2d 06 00 00       	call   7c3 <exit>
      uniq(fd, 1, 0);
 196:	50                   	push   %eax
 197:	6a 00                	push   $0x0
 199:	6a 01                	push   $0x1
 19b:	56                   	push   %esi
 19c:	e8 ef 00 00 00       	call   290 <uniq>
 1a1:	83 c4 10             	add    $0x10,%esp
 1a4:	e9 0a ff ff ff       	jmp    b3 <main+0xb3>
      printf(1, "unable to open the file %s\n", argv[3]);
 1a9:	56                   	push   %esi
 1aa:	ff 73 0c             	push   0xc(%ebx)
 1ad:	68 64 0c 00 00       	push   $0xc64
 1b2:	6a 01                	push   $0x1
 1b4:	e8 67 07 00 00       	call   920 <printf>
      exit();
 1b9:	e8 05 06 00 00       	call   7c3 <exit>
      printf(1, "unable to open the file %s\n", option);
 1be:	50                   	push   %eax
 1bf:	57                   	push   %edi
 1c0:	68 64 0c 00 00       	push   $0xc64
 1c5:	6a 01                	push   $0x1
 1c7:	e8 54 07 00 00       	call   920 <printf>
      close(fd);
 1cc:	89 34 24             	mov    %esi,(%esp)
 1cf:	e8 17 06 00 00       	call   7eb <close>
      exit();
 1d4:	e8 ea 05 00 00       	call   7c3 <exit>
    int len = strlen(arg);
 1d9:	83 ec 0c             	sub    $0xc,%esp
 1dc:	57                   	push   %edi
 1dd:	e8 1e 04 00 00       	call   600 <strlen>
    if (arg[0] == '[' && arg[len - 1] == ']') {
 1e2:	83 c4 10             	add    $0x10,%esp
 1e5:	80 3f 5b             	cmpb   $0x5b,(%edi)
 1e8:	74 2c                	je     216 <main+0x216>
    if((fd = open(argv[3], 0)) < 0){
 1ea:	57                   	push   %edi
 1eb:	57                   	push   %edi
 1ec:	6a 00                	push   $0x0
 1ee:	ff 73 0c             	push   0xc(%ebx)
 1f1:	e8 0d 06 00 00       	call   803 <open>
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	89 c7                	mov    %eax,%edi
 1fb:	85 c0                	test   %eax,%eax
 1fd:	78 aa                	js     1a9 <main+0x1a9>
    uniq(fd, 3, w);
 1ff:	51                   	push   %ecx
 200:	56                   	push   %esi
 201:	6a 03                	push   $0x3
 203:	50                   	push   %eax
 204:	e8 87 00 00 00       	call   290 <uniq>
    close(fd);
 209:	89 3c 24             	mov    %edi,(%esp)
 20c:	e8 da 05 00 00       	call   7eb <close>
    exit();
 211:	e8 ad 05 00 00       	call   7c3 <exit>
    if (arg[0] == '[' && arg[len - 1] == ']') {
 216:	8d 44 07 ff          	lea    -0x1(%edi,%eax,1),%eax
 21a:	80 38 5d             	cmpb   $0x5d,(%eax)
 21d:	75 cb                	jne    1ea <main+0x1ea>
        w = atoi(arg + 1);
 21f:	83 ec 0c             	sub    $0xc,%esp
 222:	83 c7 01             	add    $0x1,%edi
        arg[len - 1] = '\0'; 
 225:	c6 00 00             	movb   $0x0,(%eax)
        w = atoi(arg + 1);
 228:	57                   	push   %edi
 229:	e8 22 05 00 00       	call   750 <atoi>
 22e:	83 c4 10             	add    $0x10,%esp
 231:	89 c6                	mov    %eax,%esi
 233:	eb b5                	jmp    1ea <main+0x1ea>
 235:	66 90                	xchg   %ax,%ax
 237:	66 90                	xchg   %ax,%ax
 239:	66 90                	xchg   %ax,%ax
 23b:	66 90                	xchg   %ax,%ax
 23d:	66 90                	xchg   %ax,%ax
 23f:	90                   	nop

00000240 <strncmp>:
int strncmp(const char *string1, const char *string2, int n) {
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	8b 45 10             	mov    0x10(%ebp),%eax
    while (n && *string1 && (*string1 == *string2)) {                         
 247:	8b 55 0c             	mov    0xc(%ebp),%edx
int strncmp(const char *string1, const char *string2, int n) {
 24a:	53                   	push   %ebx
 24b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    while (n && *string1 && (*string1 == *string2)) {                         
 24e:	8d 34 02             	lea    (%edx,%eax,1),%esi
 251:	85 c0                	test   %eax,%eax
 253:	75 19                	jne    26e <strncmp+0x2e>
 255:	eb 23                	jmp    27a <strncmp+0x3a>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax
 260:	38 d8                	cmp    %bl,%al
 262:	75 14                	jne    278 <strncmp+0x38>
        string1++, string2++;
 264:	83 c2 01             	add    $0x1,%edx
 267:	83 c1 01             	add    $0x1,%ecx
    while (n && *string1 && (*string1 == *string2)) {                         
 26a:	39 f2                	cmp    %esi,%edx
 26c:	74 12                	je     280 <strncmp+0x40>
 26e:	0f b6 01             	movzbl (%ecx),%eax
 271:	0f b6 1a             	movzbl (%edx),%ebx
 274:	84 c0                	test   %al,%al
 276:	75 e8                	jne    260 <strncmp+0x20>
    return (uchar)*string1 - (uchar)*string2;
 278:	29 d8                	sub    %ebx,%eax
}
 27a:	5b                   	pop    %ebx
 27b:	5e                   	pop    %esi
 27c:	5d                   	pop    %ebp
 27d:	c3                   	ret    
 27e:	66 90                	xchg   %ax,%ax
 280:	5b                   	pop    %ebx
    if (n == 0) return 0;
 281:	31 c0                	xor    %eax,%eax
}
 283:	5e                   	pop    %esi
 284:	5d                   	pop    %ebp
 285:	c3                   	ret    
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <uniq>:
void uniq(int fd, int flag, int w) {
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
 295:	53                   	push   %ebx
  int n, m = 0, loop = 0;
 296:	31 db                	xor    %ebx,%ebx
void uniq(int fd, int flag, int w) {
 298:	83 ec 20             	sub    $0x20,%esp
  memset(previousbuffer, 0, sizeof(previousbuffer));
 29b:	68 00 02 00 00       	push   $0x200
 2a0:	6a 00                	push   $0x0
 2a2:	68 40 12 00 00       	push   $0x1240
 2a7:	e8 84 03 00 00       	call   630 <memset>
  int fl = 1;
 2ac:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  while((n = read(fd, buffer, sizeof(buffer))) > 0) {
 2b3:	83 c4 10             	add    $0x10,%esp
  int count, linecount = 1;                                       
 2b6:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
  int n, m = 0, loop = 0;
 2bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 2c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buffer, sizeof(buffer))) > 0) {
 2c8:	83 ec 04             	sub    $0x4,%esp
 2cb:	68 00 02 00 00       	push   $0x200
 2d0:	68 40 14 00 00       	push   $0x1440
 2d5:	ff 75 08             	push   0x8(%ebp)
 2d8:	e8 fe 04 00 00       	call   7db <read>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	85 c0                	test   %eax,%eax
 2e2:	0f 8e 67 02 00 00    	jle    54f <uniq+0x2bf>
    x = buffer;
 2e8:	bf 40 14 00 00       	mov    $0x1440,%edi
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    while(strlen(buffer) != m){
 2f0:	83 ec 0c             	sub    $0xc,%esp
 2f3:	68 40 14 00 00       	push   $0x1440
 2f8:	e8 03 03 00 00       	call   600 <strlen>
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	39 d8                	cmp    %ebx,%eax
 302:	0f 84 78 01 00 00    	je     480 <uniq+0x1f0>
      count = 0;
 308:	31 c9                	xor    %ecx,%ecx
      for(p = x; *p != '\n'; p++) count++;
 30a:	80 3f 0a             	cmpb   $0xa,(%edi)
 30d:	be 01 00 00 00       	mov    $0x1,%esi
 312:	74 14                	je     328 <uniq+0x98>
 314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 318:	89 ce                	mov    %ecx,%esi
 31a:	83 c1 01             	add    $0x1,%ecx
 31d:	80 3c 0f 0a          	cmpb   $0xa,(%edi,%ecx,1)
 321:	75 f5                	jne    318 <uniq+0x88>
      x = x + count + 1;
 323:	83 c6 02             	add    $0x2,%esi
      m = m + count + 1;
 326:	01 cb                	add    %ecx,%ebx
      memmove(currentbuffer, x, count);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      m = m + count + 1;
 32e:	83 c3 01             	add    $0x1,%ebx
      memmove(currentbuffer, x, count);
 331:	51                   	push   %ecx
 332:	57                   	push   %edi
      x = x + count + 1;
 333:	01 f7                	add    %esi,%edi
      memmove(currentbuffer, x, count);
 335:	68 40 10 00 00       	push   $0x1040
 33a:	e8 51 04 00 00       	call   790 <memmove>
      currentbuffer[count] = 0;
 33f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
      if (flag == 2) {  
 342:	83 c4 10             	add    $0x10,%esp
 345:	83 7d 0c 02          	cmpl   $0x2,0xc(%ebp)
      currentbuffer[count] = 0;
 349:	c6 81 40 10 00 00 00 	movb   $0x0,0x1040(%ecx)
      if (flag == 2) {  
 350:	0f 84 ba 00 00 00    	je     410 <uniq+0x180>
      else if (flag == 1) { 
 356:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 35a:	0f 84 e0 00 00 00    	je     440 <uniq+0x1b0>
      } else if (flag == 3) {
 360:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
 364:	0f 85 7e 00 00 00    	jne    3e8 <uniq+0x158>
    while (n && *string1 && (*string1 == *string2)) {                         
 36a:	8b 55 10             	mov    0x10(%ebp),%edx
 36d:	8b 75 10             	mov    0x10(%ebp),%esi
 370:	31 c0                	xor    %eax,%eax
 372:	85 d2                	test   %edx,%edx
 374:	75 15                	jne    38b <uniq+0xfb>
 376:	e9 86 00 00 00       	jmp    401 <uniq+0x171>
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop
 380:	38 d1                	cmp    %dl,%cl
 382:	75 1d                	jne    3a1 <uniq+0x111>
 384:	83 c0 01             	add    $0x1,%eax
 387:	39 f0                	cmp    %esi,%eax
 389:	74 76                	je     401 <uniq+0x171>
 38b:	0f b6 88 40 12 00 00 	movzbl 0x1240(%eax),%ecx
 392:	0f b6 90 40 10 00 00 	movzbl 0x1040(%eax),%edx
 399:	84 c9                	test   %cl,%cl
 39b:	75 e3                	jne    380 <uniq+0xf0>
        if (strncmp(previousbuffer, currentbuffer, w) == 0) {
 39d:	84 d2                	test   %dl,%dl
 39f:	74 60                	je     401 <uniq+0x171>
          if(loop > 0) {
 3a1:	8b 75 e0             	mov    -0x20(%ebp),%esi
 3a4:	85 f6                	test   %esi,%esi
 3a6:	74 17                	je     3bf <uniq+0x12f>
            printf(1, "%s\n", previousbuffer);
 3a8:	83 ec 04             	sub    $0x4,%esp
 3ab:	68 40 12 00 00       	push   $0x1240
 3b0:	68 4b 0c 00 00       	push   $0xc4b
 3b5:	6a 01                	push   $0x1
 3b7:	e8 64 05 00 00       	call   920 <printf>
 3bc:	83 c4 10             	add    $0x10,%esp
          strcpy(previousbuffer, currentbuffer);
 3bf:	83 ec 08             	sub    $0x8,%esp
 3c2:	68 40 10 00 00       	push   $0x1040
 3c7:	68 40 12 00 00       	push   $0x1240
 3cc:	e8 9f 01 00 00       	call   570 <strcpy>
          linecount = 1;
 3d1:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
          strcpy(previousbuffer, currentbuffer);
 3d8:	83 c4 10             	add    $0x10,%esp
      loop++;
 3db:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
 3df:	e9 0c ff ff ff       	jmp    2f0 <uniq+0x60>
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if(strcmp(previousbuffer, currentbuffer) == 0) {
 3e8:	83 ec 08             	sub    $0x8,%esp
 3eb:	68 40 10 00 00       	push   $0x1040
 3f0:	68 40 12 00 00       	push   $0x1240
 3f5:	e8 a6 01 00 00       	call   5a0 <strcmp>
 3fa:	83 c4 10             	add    $0x10,%esp
 3fd:	85 c0                	test   %eax,%eax
 3ff:	75 a0                	jne    3a1 <uniq+0x111>
          linecount++;
 401:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
 405:	eb d4                	jmp    3db <uniq+0x14b>
 407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40e:	66 90                	xchg   %ax,%ax
        if(strcmp(previousbuffer, currentbuffer) == 0) {
 410:	83 ec 08             	sub    $0x8,%esp
 413:	68 40 10 00 00       	push   $0x1040
 418:	68 40 12 00 00       	push   $0x1240
 41d:	e8 7e 01 00 00       	call   5a0 <strcmp>
 422:	83 c4 10             	add    $0x10,%esp
 425:	85 c0                	test   %eax,%eax
 427:	0f 85 a3 00 00 00    	jne    4d0 <uniq+0x240>
          linecount++;
 42d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        fl = 0;
 431:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 438:	eb a1                	jmp    3db <uniq+0x14b>
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if(strcmp(previousbuffer, currentbuffer) == 0) {
 440:	83 ec 08             	sub    $0x8,%esp
 443:	68 40 10 00 00       	push   $0x1040
 448:	68 40 12 00 00       	push   $0x1240
 44d:	e8 4e 01 00 00       	call   5a0 <strcmp>
 452:	83 c4 10             	add    $0x10,%esp
 455:	85 c0                	test   %eax,%eax
 457:	74 a8                	je     401 <uniq+0x171>
          if(loop > 0) {
 459:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 45c:	85 c9                	test   %ecx,%ecx
 45e:	0f 84 5b ff ff ff    	je     3bf <uniq+0x12f>
            printf(1, "%d %s\n", linecount, previousbuffer);
 464:	68 40 12 00 00       	push   $0x1240
 469:	ff 75 dc             	push   -0x24(%ebp)
 46c:	68 48 0c 00 00       	push   $0xc48
 471:	6a 01                	push   $0x1
 473:	e8 a8 04 00 00       	call   920 <printf>
 478:	83 c4 10             	add    $0x10,%esp
          strcpy(previousbuffer, currentbuffer);
 47b:	e9 3f ff ff ff       	jmp    3bf <uniq+0x12f>
    if ((flag == 1 || flag == 2 || flag == 3 || flag==0) && linecount >= 1) {
 480:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
 484:	0f 87 3e fe ff ff    	ja     2c8 <uniq+0x38>
      if (flag == 1) {
 48a:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
 48e:	0f 84 9f 00 00 00    	je     533 <uniq+0x2a3>
        write(1, previousbuffer, strlen(previousbuffer));
 494:	83 ec 0c             	sub    $0xc,%esp
 497:	68 40 12 00 00       	push   $0x1240
 49c:	e8 5f 01 00 00       	call   600 <strlen>
 4a1:	83 c4 0c             	add    $0xc,%esp
 4a4:	50                   	push   %eax
 4a5:	68 40 12 00 00       	push   $0x1240
 4aa:	6a 01                	push   $0x1
 4ac:	e8 32 03 00 00       	call   7e3 <write>
        printf(1, "\n");
 4b1:	5a                   	pop    %edx
 4b2:	59                   	pop    %ecx
 4b3:	68 5f 0c 00 00       	push   $0xc5f
 4b8:	6a 01                	push   $0x1
 4ba:	e8 61 04 00 00       	call   920 <printf>
 4bf:	83 c4 10             	add    $0x10,%esp
 4c2:	e9 01 fe ff ff       	jmp    2c8 <uniq+0x38>
 4c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ce:	66 90                	xchg   %ax,%ax
          if(linecount == 1 && !fl) {
 4d0:	83 7d dc 01          	cmpl   $0x1,-0x24(%ebp)
 4d4:	75 35                	jne    50b <uniq+0x27b>
 4d6:	8b 45 d8             	mov    -0x28(%ebp),%eax
 4d9:	85 c0                	test   %eax,%eax
 4db:	75 2e                	jne    50b <uniq+0x27b>
            write(1, previousbuffer, strlen(previousbuffer));
 4dd:	83 ec 0c             	sub    $0xc,%esp
 4e0:	68 40 12 00 00       	push   $0x1240
 4e5:	e8 16 01 00 00       	call   600 <strlen>
 4ea:	83 c4 0c             	add    $0xc,%esp
 4ed:	50                   	push   %eax
 4ee:	68 40 12 00 00       	push   $0x1240
 4f3:	6a 01                	push   $0x1
 4f5:	e8 e9 02 00 00       	call   7e3 <write>
            printf(1, "\n");
 4fa:	5e                   	pop    %esi
 4fb:	58                   	pop    %eax
 4fc:	68 5f 0c 00 00       	push   $0xc5f
 501:	6a 01                	push   $0x1
 503:	e8 18 04 00 00       	call   920 <printf>
 508:	83 c4 10             	add    $0x10,%esp
          strcpy(previousbuffer, currentbuffer);
 50b:	83 ec 08             	sub    $0x8,%esp
 50e:	68 40 10 00 00       	push   $0x1040
 513:	68 40 12 00 00       	push   $0x1240
 518:	e8 53 00 00 00       	call   570 <strcpy>
        fl = 0;
 51d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
          strcpy(previousbuffer, currentbuffer);
 524:	83 c4 10             	add    $0x10,%esp
          linecount = 1;
 527:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
 52e:	e9 a8 fe ff ff       	jmp    3db <uniq+0x14b>
        printf(1, "%d %s\n", linecount, previousbuffer);
 533:	68 40 12 00 00       	push   $0x1240
 538:	ff 75 dc             	push   -0x24(%ebp)
 53b:	68 48 0c 00 00       	push   $0xc48
 540:	6a 01                	push   $0x1
 542:	e8 d9 03 00 00       	call   920 <printf>
 547:	83 c4 10             	add    $0x10,%esp
 54a:	e9 79 fd ff ff       	jmp    2c8 <uniq+0x38>
  if(n < 0){
 54f:	75 08                	jne    559 <uniq+0x2c9>
}
 551:	8d 65 f4             	lea    -0xc(%ebp),%esp
 554:	5b                   	pop    %ebx
 555:	5e                   	pop    %esi
 556:	5f                   	pop    %edi
 557:	5d                   	pop    %ebp
 558:	c3                   	ret    
    printf(1, "uniq: read error\n");
 559:	50                   	push   %eax
 55a:	50                   	push   %eax
 55b:	68 4f 0c 00 00       	push   $0xc4f
 560:	6a 01                	push   $0x1
 562:	e8 b9 03 00 00       	call   920 <printf>
    exit();
 567:	e8 57 02 00 00       	call   7c3 <exit>
 56c:	66 90                	xchg   %ax,%ax
 56e:	66 90                	xchg   %ax,%ax

00000570 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 570:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 571:	31 c0                	xor    %eax,%eax
{
 573:	89 e5                	mov    %esp,%ebp
 575:	53                   	push   %ebx
 576:	8b 4d 08             	mov    0x8(%ebp),%ecx
 579:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 580:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 584:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 587:	83 c0 01             	add    $0x1,%eax
 58a:	84 d2                	test   %dl,%dl
 58c:	75 f2                	jne    580 <strcpy+0x10>
    ;
  return os;
}
 58e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 591:	89 c8                	mov    %ecx,%eax
 593:	c9                   	leave  
 594:	c3                   	ret    
 595:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	53                   	push   %ebx
 5a4:	8b 55 08             	mov    0x8(%ebp),%edx
 5a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 5aa:	0f b6 02             	movzbl (%edx),%eax
 5ad:	84 c0                	test   %al,%al
 5af:	75 17                	jne    5c8 <strcmp+0x28>
 5b1:	eb 3a                	jmp    5ed <strcmp+0x4d>
 5b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b7:	90                   	nop
 5b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 5bc:	83 c2 01             	add    $0x1,%edx
 5bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 5c2:	84 c0                	test   %al,%al
 5c4:	74 1a                	je     5e0 <strcmp+0x40>
    p++, q++;
 5c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 5c8:	0f b6 19             	movzbl (%ecx),%ebx
 5cb:	38 c3                	cmp    %al,%bl
 5cd:	74 e9                	je     5b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 5cf:	29 d8                	sub    %ebx,%eax
}
 5d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d4:	c9                   	leave  
 5d5:	c3                   	ret    
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 5e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 5e4:	31 c0                	xor    %eax,%eax
 5e6:	29 d8                	sub    %ebx,%eax
}
 5e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5eb:	c9                   	leave  
 5ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 5ed:	0f b6 19             	movzbl (%ecx),%ebx
 5f0:	31 c0                	xor    %eax,%eax
 5f2:	eb db                	jmp    5cf <strcmp+0x2f>
 5f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <strlen>:

uint
strlen(const char *s)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 606:	80 3a 00             	cmpb   $0x0,(%edx)
 609:	74 15                	je     620 <strlen+0x20>
 60b:	31 c0                	xor    %eax,%eax
 60d:	8d 76 00             	lea    0x0(%esi),%esi
 610:	83 c0 01             	add    $0x1,%eax
 613:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 617:	89 c1                	mov    %eax,%ecx
 619:	75 f5                	jne    610 <strlen+0x10>
    ;
  return n;
}
 61b:	89 c8                	mov    %ecx,%eax
 61d:	5d                   	pop    %ebp
 61e:	c3                   	ret    
 61f:	90                   	nop
  for(n = 0; s[n]; n++)
 620:	31 c9                	xor    %ecx,%ecx
}
 622:	5d                   	pop    %ebp
 623:	89 c8                	mov    %ecx,%eax
 625:	c3                   	ret    
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi

00000630 <memset>:

void*
memset(void *dst, int c, uint n)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 637:	8b 4d 10             	mov    0x10(%ebp),%ecx
 63a:	8b 45 0c             	mov    0xc(%ebp),%eax
 63d:	89 d7                	mov    %edx,%edi
 63f:	fc                   	cld    
 640:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 642:	8b 7d fc             	mov    -0x4(%ebp),%edi
 645:	89 d0                	mov    %edx,%eax
 647:	c9                   	leave  
 648:	c3                   	ret    
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000650 <strchr>:

char*
strchr(const char *s, char c)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 65a:	0f b6 10             	movzbl (%eax),%edx
 65d:	84 d2                	test   %dl,%dl
 65f:	75 12                	jne    673 <strchr+0x23>
 661:	eb 1d                	jmp    680 <strchr+0x30>
 663:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 667:	90                   	nop
 668:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 66c:	83 c0 01             	add    $0x1,%eax
 66f:	84 d2                	test   %dl,%dl
 671:	74 0d                	je     680 <strchr+0x30>
    if(*s == c)
 673:	38 d1                	cmp    %dl,%cl
 675:	75 f1                	jne    668 <strchr+0x18>
      return (char*)s;
  return 0;
}
 677:	5d                   	pop    %ebp
 678:	c3                   	ret    
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 680:	31 c0                	xor    %eax,%eax
}
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    
 684:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop

00000690 <gets>:

char*
gets(char *buf, int max)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 695:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 698:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 699:	31 db                	xor    %ebx,%ebx
{
 69b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 69e:	eb 27                	jmp    6c7 <gets+0x37>
    cc = read(0, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	6a 01                	push   $0x1
 6a5:	57                   	push   %edi
 6a6:	6a 00                	push   $0x0
 6a8:	e8 2e 01 00 00       	call   7db <read>
    if(cc < 1)
 6ad:	83 c4 10             	add    $0x10,%esp
 6b0:	85 c0                	test   %eax,%eax
 6b2:	7e 1d                	jle    6d1 <gets+0x41>
      break;
    buf[i++] = c;
 6b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 6b8:	8b 55 08             	mov    0x8(%ebp),%edx
 6bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 6bf:	3c 0a                	cmp    $0xa,%al
 6c1:	74 1d                	je     6e0 <gets+0x50>
 6c3:	3c 0d                	cmp    $0xd,%al
 6c5:	74 19                	je     6e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 6c7:	89 de                	mov    %ebx,%esi
 6c9:	83 c3 01             	add    $0x1,%ebx
 6cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 6cf:	7c cf                	jl     6a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 6d1:	8b 45 08             	mov    0x8(%ebp),%eax
 6d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 6d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6db:	5b                   	pop    %ebx
 6dc:	5e                   	pop    %esi
 6dd:	5f                   	pop    %edi
 6de:	5d                   	pop    %ebp
 6df:	c3                   	ret    
  buf[i] = '\0';
 6e0:	8b 45 08             	mov    0x8(%ebp),%eax
 6e3:	89 de                	mov    %ebx,%esi
 6e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 6e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ec:	5b                   	pop    %ebx
 6ed:	5e                   	pop    %esi
 6ee:	5f                   	pop    %edi
 6ef:	5d                   	pop    %ebp
 6f0:	c3                   	ret    
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ff:	90                   	nop

00000700 <stat>:

int
stat(const char *n, struct stat *st)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	56                   	push   %esi
 704:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 705:	83 ec 08             	sub    $0x8,%esp
 708:	6a 00                	push   $0x0
 70a:	ff 75 08             	push   0x8(%ebp)
 70d:	e8 f1 00 00 00       	call   803 <open>
  if(fd < 0)
 712:	83 c4 10             	add    $0x10,%esp
 715:	85 c0                	test   %eax,%eax
 717:	78 27                	js     740 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 719:	83 ec 08             	sub    $0x8,%esp
 71c:	ff 75 0c             	push   0xc(%ebp)
 71f:	89 c3                	mov    %eax,%ebx
 721:	50                   	push   %eax
 722:	e8 f4 00 00 00       	call   81b <fstat>
  close(fd);
 727:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 72a:	89 c6                	mov    %eax,%esi
  close(fd);
 72c:	e8 ba 00 00 00       	call   7eb <close>
  return r;
 731:	83 c4 10             	add    $0x10,%esp
}
 734:	8d 65 f8             	lea    -0x8(%ebp),%esp
 737:	89 f0                	mov    %esi,%eax
 739:	5b                   	pop    %ebx
 73a:	5e                   	pop    %esi
 73b:	5d                   	pop    %ebp
 73c:	c3                   	ret    
 73d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 740:	be ff ff ff ff       	mov    $0xffffffff,%esi
 745:	eb ed                	jmp    734 <stat+0x34>
 747:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74e:	66 90                	xchg   %ax,%ax

00000750 <atoi>:

int
atoi(const char *s)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	53                   	push   %ebx
 754:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 757:	0f be 02             	movsbl (%edx),%eax
 75a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 75d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 760:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 765:	77 1e                	ja     785 <atoi+0x35>
 767:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 770:	83 c2 01             	add    $0x1,%edx
 773:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 776:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 77a:	0f be 02             	movsbl (%edx),%eax
 77d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 780:	80 fb 09             	cmp    $0x9,%bl
 783:	76 eb                	jbe    770 <atoi+0x20>
  return n;
}
 785:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 788:	89 c8                	mov    %ecx,%eax
 78a:	c9                   	leave  
 78b:	c3                   	ret    
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000790 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	8b 45 10             	mov    0x10(%ebp),%eax
 797:	8b 55 08             	mov    0x8(%ebp),%edx
 79a:	56                   	push   %esi
 79b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 79e:	85 c0                	test   %eax,%eax
 7a0:	7e 13                	jle    7b5 <memmove+0x25>
 7a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 7a4:	89 d7                	mov    %edx,%edi
 7a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 7b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 7b1:	39 f8                	cmp    %edi,%eax
 7b3:	75 fb                	jne    7b0 <memmove+0x20>
  return vdst;
}
 7b5:	5e                   	pop    %esi
 7b6:	89 d0                	mov    %edx,%eax
 7b8:	5f                   	pop    %edi
 7b9:	5d                   	pop    %ebp
 7ba:	c3                   	ret    

000007bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7bb:	b8 01 00 00 00       	mov    $0x1,%eax
 7c0:	cd 40                	int    $0x40
 7c2:	c3                   	ret    

000007c3 <exit>:
SYSCALL(exit)
 7c3:	b8 02 00 00 00       	mov    $0x2,%eax
 7c8:	cd 40                	int    $0x40
 7ca:	c3                   	ret    

000007cb <wait>:
SYSCALL(wait)
 7cb:	b8 03 00 00 00       	mov    $0x3,%eax
 7d0:	cd 40                	int    $0x40
 7d2:	c3                   	ret    

000007d3 <pipe>:
SYSCALL(pipe)
 7d3:	b8 04 00 00 00       	mov    $0x4,%eax
 7d8:	cd 40                	int    $0x40
 7da:	c3                   	ret    

000007db <read>:
SYSCALL(read)
 7db:	b8 05 00 00 00       	mov    $0x5,%eax
 7e0:	cd 40                	int    $0x40
 7e2:	c3                   	ret    

000007e3 <write>:
SYSCALL(write)
 7e3:	b8 10 00 00 00       	mov    $0x10,%eax
 7e8:	cd 40                	int    $0x40
 7ea:	c3                   	ret    

000007eb <close>:
SYSCALL(close)
 7eb:	b8 15 00 00 00       	mov    $0x15,%eax
 7f0:	cd 40                	int    $0x40
 7f2:	c3                   	ret    

000007f3 <kill>:
SYSCALL(kill)
 7f3:	b8 06 00 00 00       	mov    $0x6,%eax
 7f8:	cd 40                	int    $0x40
 7fa:	c3                   	ret    

000007fb <exec>:
SYSCALL(exec)
 7fb:	b8 07 00 00 00       	mov    $0x7,%eax
 800:	cd 40                	int    $0x40
 802:	c3                   	ret    

00000803 <open>:
SYSCALL(open)
 803:	b8 0f 00 00 00       	mov    $0xf,%eax
 808:	cd 40                	int    $0x40
 80a:	c3                   	ret    

0000080b <mknod>:
SYSCALL(mknod)
 80b:	b8 11 00 00 00       	mov    $0x11,%eax
 810:	cd 40                	int    $0x40
 812:	c3                   	ret    

00000813 <unlink>:
SYSCALL(unlink)
 813:	b8 12 00 00 00       	mov    $0x12,%eax
 818:	cd 40                	int    $0x40
 81a:	c3                   	ret    

0000081b <fstat>:
SYSCALL(fstat)
 81b:	b8 08 00 00 00       	mov    $0x8,%eax
 820:	cd 40                	int    $0x40
 822:	c3                   	ret    

00000823 <link>:
SYSCALL(link)
 823:	b8 13 00 00 00       	mov    $0x13,%eax
 828:	cd 40                	int    $0x40
 82a:	c3                   	ret    

0000082b <mkdir>:
SYSCALL(mkdir)
 82b:	b8 14 00 00 00       	mov    $0x14,%eax
 830:	cd 40                	int    $0x40
 832:	c3                   	ret    

00000833 <chdir>:
SYSCALL(chdir)
 833:	b8 09 00 00 00       	mov    $0x9,%eax
 838:	cd 40                	int    $0x40
 83a:	c3                   	ret    

0000083b <dup>:
SYSCALL(dup)
 83b:	b8 0a 00 00 00       	mov    $0xa,%eax
 840:	cd 40                	int    $0x40
 842:	c3                   	ret    

00000843 <getpid>:
SYSCALL(getpid)
 843:	b8 0b 00 00 00       	mov    $0xb,%eax
 848:	cd 40                	int    $0x40
 84a:	c3                   	ret    

0000084b <sbrk>:
SYSCALL(sbrk)
 84b:	b8 0c 00 00 00       	mov    $0xc,%eax
 850:	cd 40                	int    $0x40
 852:	c3                   	ret    

00000853 <sleep>:
SYSCALL(sleep)
 853:	b8 0d 00 00 00       	mov    $0xd,%eax
 858:	cd 40                	int    $0x40
 85a:	c3                   	ret    

0000085b <uptime>:
SYSCALL(uptime)
 85b:	b8 0e 00 00 00       	mov    $0xe,%eax
 860:	cd 40                	int    $0x40
 862:	c3                   	ret    
 863:	66 90                	xchg   %ax,%ax
 865:	66 90                	xchg   %ax,%ax
 867:	66 90                	xchg   %ax,%ax
 869:	66 90                	xchg   %ax,%ax
 86b:	66 90                	xchg   %ax,%ax
 86d:	66 90                	xchg   %ax,%ax
 86f:	90                   	nop

00000870 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 3c             	sub    $0x3c,%esp
 879:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 87c:	89 d1                	mov    %edx,%ecx
{
 87e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 881:	85 d2                	test   %edx,%edx
 883:	0f 89 7f 00 00 00    	jns    908 <printint+0x98>
 889:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 88d:	74 79                	je     908 <printint+0x98>
    neg = 1;
 88f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 896:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 898:	31 db                	xor    %ebx,%ebx
 89a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 89d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 8a0:	89 c8                	mov    %ecx,%eax
 8a2:	31 d2                	xor    %edx,%edx
 8a4:	89 cf                	mov    %ecx,%edi
 8a6:	f7 75 c4             	divl   -0x3c(%ebp)
 8a9:	0f b6 92 28 0d 00 00 	movzbl 0xd28(%edx),%edx
 8b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8b3:	89 d8                	mov    %ebx,%eax
 8b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 8b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 8bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 8be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 8c1:	76 dd                	jbe    8a0 <printint+0x30>
  if(neg)
 8c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 8c6:	85 c9                	test   %ecx,%ecx
 8c8:	74 0c                	je     8d6 <printint+0x66>
    buf[i++] = '-';
 8ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 8cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 8d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 8d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 8d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 8dd:	eb 07                	jmp    8e6 <printint+0x76>
 8df:	90                   	nop
    putc(fd, buf[i]);
 8e0:	0f b6 13             	movzbl (%ebx),%edx
 8e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 8e6:	83 ec 04             	sub    $0x4,%esp
 8e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 8ec:	6a 01                	push   $0x1
 8ee:	56                   	push   %esi
 8ef:	57                   	push   %edi
 8f0:	e8 ee fe ff ff       	call   7e3 <write>
  while(--i >= 0)
 8f5:	83 c4 10             	add    $0x10,%esp
 8f8:	39 de                	cmp    %ebx,%esi
 8fa:	75 e4                	jne    8e0 <printint+0x70>
}
 8fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ff:	5b                   	pop    %ebx
 900:	5e                   	pop    %esi
 901:	5f                   	pop    %edi
 902:	5d                   	pop    %ebp
 903:	c3                   	ret    
 904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 908:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 90f:	eb 87                	jmp    898 <printint+0x28>
 911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 918:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91f:	90                   	nop

00000920 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
 924:	56                   	push   %esi
 925:	53                   	push   %ebx
 926:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 929:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 92c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 92f:	0f b6 13             	movzbl (%ebx),%edx
 932:	84 d2                	test   %dl,%dl
 934:	74 6a                	je     9a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 936:	8d 45 10             	lea    0x10(%ebp),%eax
 939:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 93c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 93f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 941:	89 45 d0             	mov    %eax,-0x30(%ebp)
 944:	eb 36                	jmp    97c <printf+0x5c>
 946:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 94d:	8d 76 00             	lea    0x0(%esi),%esi
 950:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 953:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 958:	83 f8 25             	cmp    $0x25,%eax
 95b:	74 15                	je     972 <printf+0x52>
  write(fd, &c, 1);
 95d:	83 ec 04             	sub    $0x4,%esp
 960:	88 55 e7             	mov    %dl,-0x19(%ebp)
 963:	6a 01                	push   $0x1
 965:	57                   	push   %edi
 966:	56                   	push   %esi
 967:	e8 77 fe ff ff       	call   7e3 <write>
 96c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 96f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 972:	0f b6 13             	movzbl (%ebx),%edx
 975:	83 c3 01             	add    $0x1,%ebx
 978:	84 d2                	test   %dl,%dl
 97a:	74 24                	je     9a0 <printf+0x80>
    c = fmt[i] & 0xff;
 97c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 97f:	85 c9                	test   %ecx,%ecx
 981:	74 cd                	je     950 <printf+0x30>
      }
    } else if(state == '%'){
 983:	83 f9 25             	cmp    $0x25,%ecx
 986:	75 ea                	jne    972 <printf+0x52>
      if(c == 'd'){
 988:	83 f8 25             	cmp    $0x25,%eax
 98b:	0f 84 07 01 00 00    	je     a98 <printf+0x178>
 991:	83 e8 63             	sub    $0x63,%eax
 994:	83 f8 15             	cmp    $0x15,%eax
 997:	77 17                	ja     9b0 <printf+0x90>
 999:	ff 24 85 d0 0c 00 00 	jmp    *0xcd0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9a3:	5b                   	pop    %ebx
 9a4:	5e                   	pop    %esi
 9a5:	5f                   	pop    %edi
 9a6:	5d                   	pop    %ebp
 9a7:	c3                   	ret    
 9a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9af:	90                   	nop
  write(fd, &c, 1);
 9b0:	83 ec 04             	sub    $0x4,%esp
 9b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 9b6:	6a 01                	push   $0x1
 9b8:	57                   	push   %edi
 9b9:	56                   	push   %esi
 9ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 9be:	e8 20 fe ff ff       	call   7e3 <write>
        putc(fd, c);
 9c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 9c7:	83 c4 0c             	add    $0xc,%esp
 9ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 9cd:	6a 01                	push   $0x1
 9cf:	57                   	push   %edi
 9d0:	56                   	push   %esi
 9d1:	e8 0d fe ff ff       	call   7e3 <write>
        putc(fd, c);
 9d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9d9:	31 c9                	xor    %ecx,%ecx
 9db:	eb 95                	jmp    972 <printf+0x52>
 9dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 9e0:	83 ec 0c             	sub    $0xc,%esp
 9e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 9e8:	6a 00                	push   $0x0
 9ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 9ed:	8b 10                	mov    (%eax),%edx
 9ef:	89 f0                	mov    %esi,%eax
 9f1:	e8 7a fe ff ff       	call   870 <printint>
        ap++;
 9f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 9fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 9fd:	31 c9                	xor    %ecx,%ecx
 9ff:	e9 6e ff ff ff       	jmp    972 <printf+0x52>
 a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 a08:	8b 45 d0             	mov    -0x30(%ebp),%eax
 a0b:	8b 10                	mov    (%eax),%edx
        ap++;
 a0d:	83 c0 04             	add    $0x4,%eax
 a10:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 a13:	85 d2                	test   %edx,%edx
 a15:	0f 84 8d 00 00 00    	je     aa8 <printf+0x188>
        while(*s != 0){
 a1b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 a1e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 a20:	84 c0                	test   %al,%al
 a22:	0f 84 4a ff ff ff    	je     972 <printf+0x52>
 a28:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 a2b:	89 d3                	mov    %edx,%ebx
 a2d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 a30:	83 ec 04             	sub    $0x4,%esp
          s++;
 a33:	83 c3 01             	add    $0x1,%ebx
 a36:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a39:	6a 01                	push   $0x1
 a3b:	57                   	push   %edi
 a3c:	56                   	push   %esi
 a3d:	e8 a1 fd ff ff       	call   7e3 <write>
        while(*s != 0){
 a42:	0f b6 03             	movzbl (%ebx),%eax
 a45:	83 c4 10             	add    $0x10,%esp
 a48:	84 c0                	test   %al,%al
 a4a:	75 e4                	jne    a30 <printf+0x110>
      state = 0;
 a4c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 a4f:	31 c9                	xor    %ecx,%ecx
 a51:	e9 1c ff ff ff       	jmp    972 <printf+0x52>
 a56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a5d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a60:	83 ec 0c             	sub    $0xc,%esp
 a63:	b9 0a 00 00 00       	mov    $0xa,%ecx
 a68:	6a 01                	push   $0x1
 a6a:	e9 7b ff ff ff       	jmp    9ea <printf+0xca>
 a6f:	90                   	nop
        putc(fd, *ap);
 a70:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 a73:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 a76:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 a78:	6a 01                	push   $0x1
 a7a:	57                   	push   %edi
 a7b:	56                   	push   %esi
        putc(fd, *ap);
 a7c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 a7f:	e8 5f fd ff ff       	call   7e3 <write>
        ap++;
 a84:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 a88:	83 c4 10             	add    $0x10,%esp
      state = 0;
 a8b:	31 c9                	xor    %ecx,%ecx
 a8d:	e9 e0 fe ff ff       	jmp    972 <printf+0x52>
 a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 a98:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 a9b:	83 ec 04             	sub    $0x4,%esp
 a9e:	e9 2a ff ff ff       	jmp    9cd <printf+0xad>
 aa3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 aa7:	90                   	nop
          s = "(null)";
 aa8:	ba c8 0c 00 00       	mov    $0xcc8,%edx
        while(*s != 0){
 aad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 ab0:	b8 28 00 00 00       	mov    $0x28,%eax
 ab5:	89 d3                	mov    %edx,%ebx
 ab7:	e9 74 ff ff ff       	jmp    a30 <printf+0x110>
 abc:	66 90                	xchg   %ax,%ax
 abe:	66 90                	xchg   %ax,%ax

00000ac0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ac0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac1:	a1 40 16 00 00       	mov    0x1640,%eax
{
 ac6:	89 e5                	mov    %esp,%ebp
 ac8:	57                   	push   %edi
 ac9:	56                   	push   %esi
 aca:	53                   	push   %ebx
 acb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 ace:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ad8:	89 c2                	mov    %eax,%edx
 ada:	8b 00                	mov    (%eax),%eax
 adc:	39 ca                	cmp    %ecx,%edx
 ade:	73 30                	jae    b10 <free+0x50>
 ae0:	39 c1                	cmp    %eax,%ecx
 ae2:	72 04                	jb     ae8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae4:	39 c2                	cmp    %eax,%edx
 ae6:	72 f0                	jb     ad8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ae8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 aeb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 aee:	39 f8                	cmp    %edi,%eax
 af0:	74 30                	je     b22 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 af2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 af5:	8b 42 04             	mov    0x4(%edx),%eax
 af8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 afb:	39 f1                	cmp    %esi,%ecx
 afd:	74 3a                	je     b39 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 aff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 b01:	5b                   	pop    %ebx
  freep = p;
 b02:	89 15 40 16 00 00    	mov    %edx,0x1640
}
 b08:	5e                   	pop    %esi
 b09:	5f                   	pop    %edi
 b0a:	5d                   	pop    %ebp
 b0b:	c3                   	ret    
 b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b10:	39 c2                	cmp    %eax,%edx
 b12:	72 c4                	jb     ad8 <free+0x18>
 b14:	39 c1                	cmp    %eax,%ecx
 b16:	73 c0                	jae    ad8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 b18:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b1b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 b1e:	39 f8                	cmp    %edi,%eax
 b20:	75 d0                	jne    af2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 b22:	03 70 04             	add    0x4(%eax),%esi
 b25:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b28:	8b 02                	mov    (%edx),%eax
 b2a:	8b 00                	mov    (%eax),%eax
 b2c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 b2f:	8b 42 04             	mov    0x4(%edx),%eax
 b32:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 b35:	39 f1                	cmp    %esi,%ecx
 b37:	75 c6                	jne    aff <free+0x3f>
    p->s.size += bp->s.size;
 b39:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 b3c:	89 15 40 16 00 00    	mov    %edx,0x1640
    p->s.size += bp->s.size;
 b42:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 b45:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 b48:	89 0a                	mov    %ecx,(%edx)
}
 b4a:	5b                   	pop    %ebx
 b4b:	5e                   	pop    %esi
 b4c:	5f                   	pop    %edi
 b4d:	5d                   	pop    %ebp
 b4e:	c3                   	ret    
 b4f:	90                   	nop

00000b50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	57                   	push   %edi
 b54:	56                   	push   %esi
 b55:	53                   	push   %ebx
 b56:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b59:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 b5c:	8b 3d 40 16 00 00    	mov    0x1640,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b62:	8d 70 07             	lea    0x7(%eax),%esi
 b65:	c1 ee 03             	shr    $0x3,%esi
 b68:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 b6b:	85 ff                	test   %edi,%edi
 b6d:	0f 84 9d 00 00 00    	je     c10 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b73:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 b75:	8b 4a 04             	mov    0x4(%edx),%ecx
 b78:	39 f1                	cmp    %esi,%ecx
 b7a:	73 6a                	jae    be6 <malloc+0x96>
 b7c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b81:	39 de                	cmp    %ebx,%esi
 b83:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 b86:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 b8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 b90:	eb 17                	jmp    ba9 <malloc+0x59>
 b92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b98:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b9a:	8b 48 04             	mov    0x4(%eax),%ecx
 b9d:	39 f1                	cmp    %esi,%ecx
 b9f:	73 4f                	jae    bf0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ba1:	8b 3d 40 16 00 00    	mov    0x1640,%edi
 ba7:	89 c2                	mov    %eax,%edx
 ba9:	39 d7                	cmp    %edx,%edi
 bab:	75 eb                	jne    b98 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 bad:	83 ec 0c             	sub    $0xc,%esp
 bb0:	ff 75 e4             	push   -0x1c(%ebp)
 bb3:	e8 93 fc ff ff       	call   84b <sbrk>
  if(p == (char*)-1)
 bb8:	83 c4 10             	add    $0x10,%esp
 bbb:	83 f8 ff             	cmp    $0xffffffff,%eax
 bbe:	74 1c                	je     bdc <malloc+0x8c>
  hp->s.size = nu;
 bc0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 bc3:	83 ec 0c             	sub    $0xc,%esp
 bc6:	83 c0 08             	add    $0x8,%eax
 bc9:	50                   	push   %eax
 bca:	e8 f1 fe ff ff       	call   ac0 <free>
  return freep;
 bcf:	8b 15 40 16 00 00    	mov    0x1640,%edx
      if((p = morecore(nunits)) == 0)
 bd5:	83 c4 10             	add    $0x10,%esp
 bd8:	85 d2                	test   %edx,%edx
 bda:	75 bc                	jne    b98 <malloc+0x48>
        return 0;
  }
}
 bdc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 bdf:	31 c0                	xor    %eax,%eax
}
 be1:	5b                   	pop    %ebx
 be2:	5e                   	pop    %esi
 be3:	5f                   	pop    %edi
 be4:	5d                   	pop    %ebp
 be5:	c3                   	ret    
    if(p->s.size >= nunits){
 be6:	89 d0                	mov    %edx,%eax
 be8:	89 fa                	mov    %edi,%edx
 bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 bf0:	39 ce                	cmp    %ecx,%esi
 bf2:	74 4c                	je     c40 <malloc+0xf0>
        p->s.size -= nunits;
 bf4:	29 f1                	sub    %esi,%ecx
 bf6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 bf9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 bfc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 bff:	89 15 40 16 00 00    	mov    %edx,0x1640
}
 c05:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 c08:	83 c0 08             	add    $0x8,%eax
}
 c0b:	5b                   	pop    %ebx
 c0c:	5e                   	pop    %esi
 c0d:	5f                   	pop    %edi
 c0e:	5d                   	pop    %ebp
 c0f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 c10:	c7 05 40 16 00 00 44 	movl   $0x1644,0x1640
 c17:	16 00 00 
    base.s.size = 0;
 c1a:	bf 44 16 00 00       	mov    $0x1644,%edi
    base.s.ptr = freep = prevp = &base;
 c1f:	c7 05 44 16 00 00 44 	movl   $0x1644,0x1644
 c26:	16 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c29:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 c2b:	c7 05 48 16 00 00 00 	movl   $0x0,0x1648
 c32:	00 00 00 
    if(p->s.size >= nunits){
 c35:	e9 42 ff ff ff       	jmp    b7c <malloc+0x2c>
 c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 c40:	8b 08                	mov    (%eax),%ecx
 c42:	89 0a                	mov    %ecx,(%edx)
 c44:	eb b9                	jmp    bff <malloc+0xaf>
