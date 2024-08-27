
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 19                	mov    (%ecx),%ebx
  16:	8b 71 04             	mov    0x4(%ecx),%esi
  int i;
  int show_hidden=0;
  // -a flag, to display the hidden files
  if(argc>1 && strcmp(argv[1], "-a")==0)
  19:	83 fb 01             	cmp    $0x1,%ebx
  1c:	7f 14                	jg     32 <main+0x32>
  int show_hidden=0;
  1e:	31 db                	xor    %ebx,%ebx
    show_hidden=1;
    argc--;
    argv++;
  }
  if(argc < 2){
    ls(".", show_hidden);
  20:	50                   	push   %eax
  21:	50                   	push   %eax
  22:	53                   	push   %ebx
  23:	68 13 0b 00 00       	push   $0xb13
  28:	e8 73 01 00 00       	call   1a0 <ls>
    exit();
  2d:	e8 21 06 00 00       	call   653 <exit>
  if(argc>1 && strcmp(argv[1], "-a")==0)
  32:	52                   	push   %edx
  33:	52                   	push   %edx
  34:	68 10 0b 00 00       	push   $0xb10
  39:	ff 76 04             	push   0x4(%esi)
  3c:	e8 ef 03 00 00       	call   430 <strcmp>
    argv++;
  41:	8d 56 04             	lea    0x4(%esi),%edx
  if(argc>1 && strcmp(argv[1], "-a")==0)
  44:	83 c4 10             	add    $0x10,%esp
    argv++;
  47:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  if(argc>1 && strcmp(argv[1], "-a")==0)
  4a:	85 c0                	test   %eax,%eax
  4c:	74 30                	je     7e <main+0x7e>
  4e:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  int show_hidden=0;
  51:	31 f6                	xor    %esi,%esi
  }
  // check every file and directory
  for(i=1; i<argc; i++)
  53:	bf 01 00 00 00       	mov    $0x1,%edi
  58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  5f:	90                   	nop
    ls(argv[i], show_hidden);
  60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  63:	83 ec 08             	sub    $0x8,%esp
  66:	56                   	push   %esi
  67:	ff 34 b8             	push   (%eax,%edi,4)
  for(i=1; i<argc; i++)
  6a:	83 c7 01             	add    $0x1,%edi
    ls(argv[i], show_hidden);
  6d:	e8 2e 01 00 00       	call   1a0 <ls>
  for(i=1; i<argc; i++)
  72:	83 c4 10             	add    $0x10,%esp
  75:	39 df                	cmp    %ebx,%edi
  77:	7c e7                	jl     60 <main+0x60>
  exit();
  79:	e8 d5 05 00 00       	call   653 <exit>
    argc--;
  7e:	83 eb 01             	sub    $0x1,%ebx
  if(argc < 2){
  81:	83 fb 01             	cmp    $0x1,%ebx
  84:	74 9a                	je     20 <main+0x20>
    show_hidden=1;
  86:	be 01 00 00 00       	mov    $0x1,%esi
  8b:	eb c6                	jmp    53 <main+0x53>
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <formatname>:
{  
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
  p = path + strlen(path); 
  98:	83 ec 0c             	sub    $0xc,%esp
  9b:	56                   	push   %esi
  9c:	e8 ef 03 00 00       	call   490 <strlen>
  while (p >= path) {
  a1:	83 c4 10             	add    $0x10,%esp
  a4:	01 f0                	add    %esi,%eax
  a6:	89 c3                	mov    %eax,%ebx
  a8:	73 0f                	jae    b9 <formatname+0x29>
  aa:	eb 12                	jmp    be <formatname+0x2e>
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      p--;
  b0:	8d 43 ff             	lea    -0x1(%ebx),%eax
  while (p >= path) {
  b3:	39 c6                	cmp    %eax,%esi
  b5:	77 0a                	ja     c1 <formatname+0x31>
  b7:	89 c3                	mov    %eax,%ebx
      if (*p == '/') {
  b9:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  bc:	75 f2                	jne    b0 <formatname+0x20>
p++;
  be:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  c1:	83 ec 0c             	sub    $0xc,%esp
  c4:	53                   	push   %ebx
  c5:	e8 c6 03 00 00       	call   490 <strlen>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	83 f8 0d             	cmp    $0xd,%eax
  d0:	76 0e                	jbe    e0 <formatname+0x50>
}
  d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d5:	89 d8                	mov    %ebx,%eax
  d7:	5b                   	pop    %ebx
  d8:	5e                   	pop    %esi
  d9:	5d                   	pop    %ebp
  da:	c3                   	ret    
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop
  memmove(buffer, p, strlen(p));
  e0:	83 ec 0c             	sub    $0xc,%esp
  e3:	53                   	push   %ebx
  e4:	e8 a7 03 00 00       	call   490 <strlen>
  e9:	83 c4 0c             	add    $0xc,%esp
  ec:	50                   	push   %eax
  ed:	53                   	push   %ebx
  ee:	68 b8 0e 00 00       	push   $0xeb8
  f3:	e8 28 05 00 00       	call   620 <memmove>
  if(type == T_DIR){
  f8:	83 c4 10             	add    $0x10,%esp
  fb:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  ff:	74 3f                	je     140 <formatname+0xb0>
    memset(buffer+strlen(p), ' ', DIRSIZ-strlen(p));
 101:	83 ec 0c             	sub    $0xc,%esp
 104:	53                   	push   %ebx
 105:	e8 86 03 00 00       	call   490 <strlen>
 10a:	89 1c 24             	mov    %ebx,(%esp)
  return buffer;
 10d:	bb b8 0e 00 00       	mov    $0xeb8,%ebx
    memset(buffer+strlen(p), ' ', DIRSIZ-strlen(p));
 112:	89 c6                	mov    %eax,%esi
 114:	e8 77 03 00 00       	call   490 <strlen>
 119:	ba 0e 00 00 00       	mov    $0xe,%edx
 11e:	83 c4 0c             	add    $0xc,%esp
 121:	29 f2                	sub    %esi,%edx
 123:	05 b8 0e 00 00       	add    $0xeb8,%eax
 128:	52                   	push   %edx
 129:	6a 20                	push   $0x20
 12b:	50                   	push   %eax
 12c:	e8 8f 03 00 00       	call   4c0 <memset>
 131:	83 c4 10             	add    $0x10,%esp
}
 134:	8d 65 f8             	lea    -0x8(%ebp),%esp
 137:	89 d8                	mov    %ebx,%eax
 139:	5b                   	pop    %ebx
 13a:	5e                   	pop    %esi
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    
 13d:	8d 76 00             	lea    0x0(%esi),%esi
    memset(buffer+strlen(p), '/', 1);
 140:	83 ec 0c             	sub    $0xc,%esp
 143:	53                   	push   %ebx
 144:	e8 47 03 00 00       	call   490 <strlen>
 149:	83 c4 0c             	add    $0xc,%esp
 14c:	05 b8 0e 00 00       	add    $0xeb8,%eax
 151:	6a 01                	push   $0x1
 153:	6a 2f                	push   $0x2f
 155:	50                   	push   %eax
 156:	e8 65 03 00 00       	call   4c0 <memset>
    memset(buffer+strlen(p)+1, ' ', DIRSIZ-strlen(p));
 15b:	89 1c 24             	mov    %ebx,(%esp)
 15e:	e8 2d 03 00 00       	call   490 <strlen>
 163:	89 1c 24             	mov    %ebx,(%esp)
  return buffer;
 166:	bb b8 0e 00 00       	mov    $0xeb8,%ebx
    memset(buffer+strlen(p)+1, ' ', DIRSIZ-strlen(p));
 16b:	89 c6                	mov    %eax,%esi
 16d:	e8 1e 03 00 00       	call   490 <strlen>
 172:	ba 0e 00 00 00       	mov    $0xe,%edx
 177:	83 c4 0c             	add    $0xc,%esp
 17a:	29 f2                	sub    %esi,%edx
 17c:	05 b9 0e 00 00       	add    $0xeb9,%eax
 181:	52                   	push   %edx
 182:	6a 20                	push   $0x20
 184:	50                   	push   %eax
 185:	e8 36 03 00 00       	call   4c0 <memset>
 18a:	83 c4 10             	add    $0x10,%esp
}
 18d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 190:	89 d8                	mov    %ebx,%eax
 192:	5b                   	pop    %ebx
 193:	5e                   	pop    %esi
 194:	5d                   	pop    %ebp
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi

000001a0 <ls>:
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
 1a5:	53                   	push   %ebx
 1a6:	81 ec 64 02 00 00    	sub    $0x264,%esp
 1ac:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 1af:	6a 00                	push   $0x0
 1b1:	57                   	push   %edi
 1b2:	e8 dc 04 00 00       	call   693 <open>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	85 c0                	test   %eax,%eax
 1bc:	0f 88 ae 01 00 00    	js     370 <ls+0x1d0>
  if(fstat(fd, &st) < 0){
 1c2:	83 ec 08             	sub    $0x8,%esp
 1c5:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 1cb:	89 c3                	mov    %eax,%ebx
 1cd:	56                   	push   %esi
 1ce:	50                   	push   %eax
 1cf:	e8 d7 04 00 00       	call   6ab <fstat>
 1d4:	83 c4 10             	add    $0x10,%esp
 1d7:	85 c0                	test   %eax,%eax
 1d9:	0f 88 f1 01 00 00    	js     3d0 <ls+0x230>
  switch(st.type){
 1df:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 1e6:	66 83 f8 01          	cmp    $0x1,%ax
 1ea:	74 64                	je     250 <ls+0xb0>
 1ec:	66 83 f8 02          	cmp    $0x2,%ax
 1f0:	74 1e                	je     210 <ls+0x70>
  close(fd);
 1f2:	83 ec 0c             	sub    $0xc,%esp
 1f5:	53                   	push   %ebx
 1f6:	e8 80 04 00 00       	call   67b <close>
 1fb:	83 c4 10             	add    $0x10,%esp
}
 1fe:	8d 65 f4             	lea    -0xc(%ebp),%esp
 201:	5b                   	pop    %ebx
 202:	5e                   	pop    %esi
 203:	5f                   	pop    %edi
 204:	5d                   	pop    %ebp
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", formatname(path, st.type), st.type, st.ino, st.size);
 210:	83 ec 08             	sub    $0x8,%esp
 213:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 219:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 21f:	6a 02                	push   $0x2
 221:	57                   	push   %edi
 222:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 228:	e8 63 fe ff ff       	call   90 <formatname>
 22d:	5f                   	pop    %edi
 22e:	5a                   	pop    %edx
 22f:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 235:	52                   	push   %edx
 236:	56                   	push   %esi
 237:	6a 02                	push   $0x2
 239:	50                   	push   %eax
 23a:	68 eb 0a 00 00       	push   $0xaeb
 23f:	6a 01                	push   $0x1
 241:	e8 6a 05 00 00       	call   7b0 <printf>
    break;
 246:	83 c4 20             	add    $0x20,%esp
 249:	eb a7                	jmp    1f2 <ls+0x52>
 24b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buffer){
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	57                   	push   %edi
 254:	e8 37 02 00 00       	call   490 <strlen>
 259:	83 c4 10             	add    $0x10,%esp
 25c:	83 c0 10             	add    $0x10,%eax
 25f:	3d 00 02 00 00       	cmp    $0x200,%eax
 264:	0f 87 26 01 00 00    	ja     390 <ls+0x1f0>
    strcpy(buffer, path);
 26a:	83 ec 08             	sub    $0x8,%esp
 26d:	57                   	push   %edi
 26e:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 274:	57                   	push   %edi
 275:	e8 86 01 00 00       	call   400 <strcpy>
    p = buffer+strlen(buffer);
 27a:	89 3c 24             	mov    %edi,(%esp)
 27d:	e8 0e 02 00 00       	call   490 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 282:	83 c4 10             	add    $0x10,%esp
    p = buffer+strlen(buffer);
 285:	01 f8                	add    %edi,%eax
    *p++ = '/';
 287:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buffer+strlen(buffer);
 28a:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 290:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 296:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a0:	83 ec 04             	sub    $0x4,%esp
 2a3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 2a9:	6a 10                	push   $0x10
 2ab:	50                   	push   %eax
 2ac:	53                   	push   %ebx
 2ad:	e8 b9 03 00 00       	call   66b <read>
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	83 f8 10             	cmp    $0x10,%eax
 2b8:	0f 85 34 ff ff ff    	jne    1f2 <ls+0x52>
      if(de.inum == 0)
 2be:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 2c5:	00 
 2c6:	74 d8                	je     2a0 <ls+0x100>
      if(!show_hidden && de.name[0] == '.') 
 2c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2cb:	85 c9                	test   %ecx,%ecx
 2cd:	75 09                	jne    2d8 <ls+0x138>
 2cf:	80 bd c6 fd ff ff 2e 	cmpb   $0x2e,-0x23a(%ebp)
 2d6:	74 c8                	je     2a0 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 2d8:	83 ec 04             	sub    $0x4,%esp
 2db:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 2e1:	6a 0e                	push   $0xe
 2e3:	50                   	push   %eax
 2e4:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 2ea:	e8 31 03 00 00       	call   620 <memmove>
      p[DIRSIZ] = 0;
 2ef:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 2f5:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buffer, &st) < 0){
 2f9:	58                   	pop    %eax
 2fa:	5a                   	pop    %edx
 2fb:	56                   	push   %esi
 2fc:	57                   	push   %edi
 2fd:	e8 8e 02 00 00       	call   590 <stat>
 302:	83 c4 10             	add    $0x10,%esp
 305:	85 c0                	test   %eax,%eax
 307:	0f 88 a3 00 00 00    	js     3b0 <ls+0x210>
      printf(1, "%s %d %d %d\n", formatname(buffer,st.type), st.type, st.ino, st.size);
 30d:	0f bf 95 d4 fd ff ff 	movswl -0x22c(%ebp),%edx
 314:	83 ec 08             	sub    $0x8,%esp
 317:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 31d:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
 323:	52                   	push   %edx
 324:	57                   	push   %edi
 325:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 32b:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 331:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 337:	e8 54 fd ff ff       	call   90 <formatname>
 33c:	5a                   	pop    %edx
 33d:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 343:	59                   	pop    %ecx
 344:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 34a:	51                   	push   %ecx
 34b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 351:	52                   	push   %edx
 352:	50                   	push   %eax
 353:	68 eb 0a 00 00       	push   $0xaeb
 358:	6a 01                	push   $0x1
 35a:	e8 51 04 00 00       	call   7b0 <printf>
 35f:	83 c4 20             	add    $0x20,%esp
 362:	e9 39 ff ff ff       	jmp    2a0 <ls+0x100>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax
    printf(2, "unable to open %s\n", path);
 370:	83 ec 04             	sub    $0x4,%esp
 373:	57                   	push   %edi
 374:	68 d8 0a 00 00       	push   $0xad8
 379:	6a 02                	push   $0x2
 37b:	e8 30 04 00 00       	call   7b0 <printf>
    return;
 380:	83 c4 10             	add    $0x10,%esp
}
 383:	8d 65 f4             	lea    -0xc(%ebp),%esp
 386:	5b                   	pop    %ebx
 387:	5e                   	pop    %esi
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop
      printf(1, "given path is too long\n");
 390:	83 ec 08             	sub    $0x8,%esp
 393:	68 f8 0a 00 00       	push   $0xaf8
 398:	6a 01                	push   $0x1
 39a:	e8 11 04 00 00       	call   7b0 <printf>
      break;
 39f:	83 c4 10             	add    $0x10,%esp
 3a2:	e9 4b fe ff ff       	jmp    1f2 <ls+0x52>
 3a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ae:	66 90                	xchg   %ax,%ax
        printf(1, "unable to open %s\n", buffer);
 3b0:	83 ec 04             	sub    $0x4,%esp
 3b3:	57                   	push   %edi
 3b4:	68 d8 0a 00 00       	push   $0xad8
 3b9:	6a 01                	push   $0x1
 3bb:	e8 f0 03 00 00       	call   7b0 <printf>
        continue;
 3c0:	83 c4 10             	add    $0x10,%esp
 3c3:	e9 d8 fe ff ff       	jmp    2a0 <ls+0x100>
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop
    printf(2, "unable to open %s\n", path);
 3d0:	83 ec 04             	sub    $0x4,%esp
 3d3:	57                   	push   %edi
 3d4:	68 d8 0a 00 00       	push   $0xad8
 3d9:	6a 02                	push   $0x2
 3db:	e8 d0 03 00 00       	call   7b0 <printf>
    close(fd);
 3e0:	89 1c 24             	mov    %ebx,(%esp)
 3e3:	e8 93 02 00 00       	call   67b <close>
    return;
 3e8:	83 c4 10             	add    $0x10,%esp
}
 3eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ee:	5b                   	pop    %ebx
 3ef:	5e                   	pop    %esi
 3f0:	5f                   	pop    %edi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    
 3f3:	66 90                	xchg   %ax,%ax
 3f5:	66 90                	xchg   %ax,%ax
 3f7:	66 90                	xchg   %ax,%ax
 3f9:	66 90                	xchg   %ax,%ax
 3fb:	66 90                	xchg   %ax,%ax
 3fd:	66 90                	xchg   %ax,%ax
 3ff:	90                   	nop

00000400 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 400:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 401:	31 c0                	xor    %eax,%eax
{
 403:	89 e5                	mov    %esp,%ebp
 405:	53                   	push   %ebx
 406:	8b 4d 08             	mov    0x8(%ebp),%ecx
 409:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 410:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 414:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 417:	83 c0 01             	add    $0x1,%eax
 41a:	84 d2                	test   %dl,%dl
 41c:	75 f2                	jne    410 <strcpy+0x10>
    ;
  return os;
}
 41e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 421:	89 c8                	mov    %ecx,%eax
 423:	c9                   	leave  
 424:	c3                   	ret    
 425:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
 434:	8b 55 08             	mov    0x8(%ebp),%edx
 437:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 43a:	0f b6 02             	movzbl (%edx),%eax
 43d:	84 c0                	test   %al,%al
 43f:	75 17                	jne    458 <strcmp+0x28>
 441:	eb 3a                	jmp    47d <strcmp+0x4d>
 443:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 447:	90                   	nop
 448:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 44c:	83 c2 01             	add    $0x1,%edx
 44f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 452:	84 c0                	test   %al,%al
 454:	74 1a                	je     470 <strcmp+0x40>
    p++, q++;
 456:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 458:	0f b6 19             	movzbl (%ecx),%ebx
 45b:	38 c3                	cmp    %al,%bl
 45d:	74 e9                	je     448 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 45f:	29 d8                	sub    %ebx,%eax
}
 461:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 464:	c9                   	leave  
 465:	c3                   	ret    
 466:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 470:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 474:	31 c0                	xor    %eax,%eax
 476:	29 d8                	sub    %ebx,%eax
}
 478:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 47b:	c9                   	leave  
 47c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 47d:	0f b6 19             	movzbl (%ecx),%ebx
 480:	31 c0                	xor    %eax,%eax
 482:	eb db                	jmp    45f <strcmp+0x2f>
 484:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <strlen>:

uint
strlen(const char *s)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 496:	80 3a 00             	cmpb   $0x0,(%edx)
 499:	74 15                	je     4b0 <strlen+0x20>
 49b:	31 c0                	xor    %eax,%eax
 49d:	8d 76 00             	lea    0x0(%esi),%esi
 4a0:	83 c0 01             	add    $0x1,%eax
 4a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 4a7:	89 c1                	mov    %eax,%ecx
 4a9:	75 f5                	jne    4a0 <strlen+0x10>
    ;
  return n;
}
 4ab:	89 c8                	mov    %ecx,%eax
 4ad:	5d                   	pop    %ebp
 4ae:	c3                   	ret    
 4af:	90                   	nop
  for(n = 0; s[n]; n++)
 4b0:	31 c9                	xor    %ecx,%ecx
}
 4b2:	5d                   	pop    %ebp
 4b3:	89 c8                	mov    %ecx,%eax
 4b5:	c3                   	ret    
 4b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bd:	8d 76 00             	lea    0x0(%esi),%esi

000004c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	89 d7                	mov    %edx,%edi
 4cf:	fc                   	cld    
 4d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4d5:	89 d0                	mov    %edx,%eax
 4d7:	c9                   	leave  
 4d8:	c3                   	ret    
 4d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004e0 <strchr>:

char*
strchr(const char *s, char c)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
 4e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4ea:	0f b6 10             	movzbl (%eax),%edx
 4ed:	84 d2                	test   %dl,%dl
 4ef:	75 12                	jne    503 <strchr+0x23>
 4f1:	eb 1d                	jmp    510 <strchr+0x30>
 4f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4f7:	90                   	nop
 4f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4fc:	83 c0 01             	add    $0x1,%eax
 4ff:	84 d2                	test   %dl,%dl
 501:	74 0d                	je     510 <strchr+0x30>
    if(*s == c)
 503:	38 d1                	cmp    %dl,%cl
 505:	75 f1                	jne    4f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 507:	5d                   	pop    %ebp
 508:	c3                   	ret    
 509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 510:	31 c0                	xor    %eax,%eax
}
 512:	5d                   	pop    %ebp
 513:	c3                   	ret    
 514:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop

00000520 <gets>:

char*
gets(char *buf, int max)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 525:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 528:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 529:	31 db                	xor    %ebx,%ebx
{
 52b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 52e:	eb 27                	jmp    557 <gets+0x37>
    cc = read(0, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	6a 01                	push   $0x1
 535:	57                   	push   %edi
 536:	6a 00                	push   $0x0
 538:	e8 2e 01 00 00       	call   66b <read>
    if(cc < 1)
 53d:	83 c4 10             	add    $0x10,%esp
 540:	85 c0                	test   %eax,%eax
 542:	7e 1d                	jle    561 <gets+0x41>
      break;
    buf[i++] = c;
 544:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 548:	8b 55 08             	mov    0x8(%ebp),%edx
 54b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 54f:	3c 0a                	cmp    $0xa,%al
 551:	74 1d                	je     570 <gets+0x50>
 553:	3c 0d                	cmp    $0xd,%al
 555:	74 19                	je     570 <gets+0x50>
  for(i=0; i+1 < max; ){
 557:	89 de                	mov    %ebx,%esi
 559:	83 c3 01             	add    $0x1,%ebx
 55c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 55f:	7c cf                	jl     530 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 561:	8b 45 08             	mov    0x8(%ebp),%eax
 564:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 568:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56b:	5b                   	pop    %ebx
 56c:	5e                   	pop    %esi
 56d:	5f                   	pop    %edi
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret    
  buf[i] = '\0';
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	89 de                	mov    %ebx,%esi
 575:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 579:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57c:	5b                   	pop    %ebx
 57d:	5e                   	pop    %esi
 57e:	5f                   	pop    %edi
 57f:	5d                   	pop    %ebp
 580:	c3                   	ret    
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <stat>:

int
stat(const char *n, struct stat *st)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	56                   	push   %esi
 594:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 595:	83 ec 08             	sub    $0x8,%esp
 598:	6a 00                	push   $0x0
 59a:	ff 75 08             	push   0x8(%ebp)
 59d:	e8 f1 00 00 00       	call   693 <open>
  if(fd < 0)
 5a2:	83 c4 10             	add    $0x10,%esp
 5a5:	85 c0                	test   %eax,%eax
 5a7:	78 27                	js     5d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 5a9:	83 ec 08             	sub    $0x8,%esp
 5ac:	ff 75 0c             	push   0xc(%ebp)
 5af:	89 c3                	mov    %eax,%ebx
 5b1:	50                   	push   %eax
 5b2:	e8 f4 00 00 00       	call   6ab <fstat>
  close(fd);
 5b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 5ba:	89 c6                	mov    %eax,%esi
  close(fd);
 5bc:	e8 ba 00 00 00       	call   67b <close>
  return r;
 5c1:	83 c4 10             	add    $0x10,%esp
}
 5c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5c7:	89 f0                	mov    %esi,%eax
 5c9:	5b                   	pop    %ebx
 5ca:	5e                   	pop    %esi
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 5d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5d5:	eb ed                	jmp    5c4 <stat+0x34>
 5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5de:	66 90                	xchg   %ax,%ax

000005e0 <atoi>:

int
atoi(const char *s)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	53                   	push   %ebx
 5e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5e7:	0f be 02             	movsbl (%edx),%eax
 5ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5f5:	77 1e                	ja     615 <atoi+0x35>
 5f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fe:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 600:	83 c2 01             	add    $0x1,%edx
 603:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 606:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 60a:	0f be 02             	movsbl (%edx),%eax
 60d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 610:	80 fb 09             	cmp    $0x9,%bl
 613:	76 eb                	jbe    600 <atoi+0x20>
  return n;
}
 615:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 618:	89 c8                	mov    %ecx,%eax
 61a:	c9                   	leave  
 61b:	c3                   	ret    
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000620 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	8b 45 10             	mov    0x10(%ebp),%eax
 627:	8b 55 08             	mov    0x8(%ebp),%edx
 62a:	56                   	push   %esi
 62b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 62e:	85 c0                	test   %eax,%eax
 630:	7e 13                	jle    645 <memmove+0x25>
 632:	01 d0                	add    %edx,%eax
  dst = vdst;
 634:	89 d7                	mov    %edx,%edi
 636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 640:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 641:	39 f8                	cmp    %edi,%eax
 643:	75 fb                	jne    640 <memmove+0x20>
  return vdst;
}
 645:	5e                   	pop    %esi
 646:	89 d0                	mov    %edx,%eax
 648:	5f                   	pop    %edi
 649:	5d                   	pop    %ebp
 64a:	c3                   	ret    

0000064b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 64b:	b8 01 00 00 00       	mov    $0x1,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <exit>:
SYSCALL(exit)
 653:	b8 02 00 00 00       	mov    $0x2,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <wait>:
SYSCALL(wait)
 65b:	b8 03 00 00 00       	mov    $0x3,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <pipe>:
SYSCALL(pipe)
 663:	b8 04 00 00 00       	mov    $0x4,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <read>:
SYSCALL(read)
 66b:	b8 05 00 00 00       	mov    $0x5,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <write>:
SYSCALL(write)
 673:	b8 10 00 00 00       	mov    $0x10,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <close>:
SYSCALL(close)
 67b:	b8 15 00 00 00       	mov    $0x15,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <kill>:
SYSCALL(kill)
 683:	b8 06 00 00 00       	mov    $0x6,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <exec>:
SYSCALL(exec)
 68b:	b8 07 00 00 00       	mov    $0x7,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <open>:
SYSCALL(open)
 693:	b8 0f 00 00 00       	mov    $0xf,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <mknod>:
SYSCALL(mknod)
 69b:	b8 11 00 00 00       	mov    $0x11,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <unlink>:
SYSCALL(unlink)
 6a3:	b8 12 00 00 00       	mov    $0x12,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <fstat>:
SYSCALL(fstat)
 6ab:	b8 08 00 00 00       	mov    $0x8,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <link>:
SYSCALL(link)
 6b3:	b8 13 00 00 00       	mov    $0x13,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <mkdir>:
SYSCALL(mkdir)
 6bb:	b8 14 00 00 00       	mov    $0x14,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <chdir>:
SYSCALL(chdir)
 6c3:	b8 09 00 00 00       	mov    $0x9,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <dup>:
SYSCALL(dup)
 6cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <getpid>:
SYSCALL(getpid)
 6d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <sbrk>:
SYSCALL(sbrk)
 6db:	b8 0c 00 00 00       	mov    $0xc,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <sleep>:
SYSCALL(sleep)
 6e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <uptime>:
SYSCALL(uptime)
 6eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    
 6f3:	66 90                	xchg   %ax,%ax
 6f5:	66 90                	xchg   %ax,%ax
 6f7:	66 90                	xchg   %ax,%ax
 6f9:	66 90                	xchg   %ax,%ax
 6fb:	66 90                	xchg   %ax,%ax
 6fd:	66 90                	xchg   %ax,%ax
 6ff:	90                   	nop

00000700 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 3c             	sub    $0x3c,%esp
 709:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 70c:	89 d1                	mov    %edx,%ecx
{
 70e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 711:	85 d2                	test   %edx,%edx
 713:	0f 89 7f 00 00 00    	jns    798 <printint+0x98>
 719:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 71d:	74 79                	je     798 <printint+0x98>
    neg = 1;
 71f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 726:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 728:	31 db                	xor    %ebx,%ebx
 72a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 730:	89 c8                	mov    %ecx,%eax
 732:	31 d2                	xor    %edx,%edx
 734:	89 cf                	mov    %ecx,%edi
 736:	f7 75 c4             	divl   -0x3c(%ebp)
 739:	0f b6 92 74 0b 00 00 	movzbl 0xb74(%edx),%edx
 740:	89 45 c0             	mov    %eax,-0x40(%ebp)
 743:	89 d8                	mov    %ebx,%eax
 745:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 748:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 74b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 74e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 751:	76 dd                	jbe    730 <printint+0x30>
  if(neg)
 753:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 756:	85 c9                	test   %ecx,%ecx
 758:	74 0c                	je     766 <printint+0x66>
    buf[i++] = '-';
 75a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 75f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 761:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 766:	8b 7d b8             	mov    -0x48(%ebp),%edi
 769:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 76d:	eb 07                	jmp    776 <printint+0x76>
 76f:	90                   	nop
    putc(fd, buf[i]);
 770:	0f b6 13             	movzbl (%ebx),%edx
 773:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 776:	83 ec 04             	sub    $0x4,%esp
 779:	88 55 d7             	mov    %dl,-0x29(%ebp)
 77c:	6a 01                	push   $0x1
 77e:	56                   	push   %esi
 77f:	57                   	push   %edi
 780:	e8 ee fe ff ff       	call   673 <write>
  while(--i >= 0)
 785:	83 c4 10             	add    $0x10,%esp
 788:	39 de                	cmp    %ebx,%esi
 78a:	75 e4                	jne    770 <printint+0x70>
}
 78c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 798:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 79f:	eb 87                	jmp    728 <printint+0x28>
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop

000007b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7bf:	0f b6 13             	movzbl (%ebx),%edx
 7c2:	84 d2                	test   %dl,%dl
 7c4:	74 6a                	je     830 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7c6:	8d 45 10             	lea    0x10(%ebp),%eax
 7c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 7d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7d4:	eb 36                	jmp    80c <printf+0x5c>
 7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
 7e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 7e8:	83 f8 25             	cmp    $0x25,%eax
 7eb:	74 15                	je     802 <printf+0x52>
  write(fd, &c, 1);
 7ed:	83 ec 04             	sub    $0x4,%esp
 7f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7f3:	6a 01                	push   $0x1
 7f5:	57                   	push   %edi
 7f6:	56                   	push   %esi
 7f7:	e8 77 fe ff ff       	call   673 <write>
 7fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 7ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 802:	0f b6 13             	movzbl (%ebx),%edx
 805:	83 c3 01             	add    $0x1,%ebx
 808:	84 d2                	test   %dl,%dl
 80a:	74 24                	je     830 <printf+0x80>
    c = fmt[i] & 0xff;
 80c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 80f:	85 c9                	test   %ecx,%ecx
 811:	74 cd                	je     7e0 <printf+0x30>
      }
    } else if(state == '%'){
 813:	83 f9 25             	cmp    $0x25,%ecx
 816:	75 ea                	jne    802 <printf+0x52>
      if(c == 'd'){
 818:	83 f8 25             	cmp    $0x25,%eax
 81b:	0f 84 07 01 00 00    	je     928 <printf+0x178>
 821:	83 e8 63             	sub    $0x63,%eax
 824:	83 f8 15             	cmp    $0x15,%eax
 827:	77 17                	ja     840 <printf+0x90>
 829:	ff 24 85 1c 0b 00 00 	jmp    *0xb1c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 830:	8d 65 f4             	lea    -0xc(%ebp),%esp
 833:	5b                   	pop    %ebx
 834:	5e                   	pop    %esi
 835:	5f                   	pop    %edi
 836:	5d                   	pop    %ebp
 837:	c3                   	ret    
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
  write(fd, &c, 1);
 840:	83 ec 04             	sub    $0x4,%esp
 843:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 846:	6a 01                	push   $0x1
 848:	57                   	push   %edi
 849:	56                   	push   %esi
 84a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 84e:	e8 20 fe ff ff       	call   673 <write>
        putc(fd, c);
 853:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 857:	83 c4 0c             	add    $0xc,%esp
 85a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 85d:	6a 01                	push   $0x1
 85f:	57                   	push   %edi
 860:	56                   	push   %esi
 861:	e8 0d fe ff ff       	call   673 <write>
        putc(fd, c);
 866:	83 c4 10             	add    $0x10,%esp
      state = 0;
 869:	31 c9                	xor    %ecx,%ecx
 86b:	eb 95                	jmp    802 <printf+0x52>
 86d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	b9 10 00 00 00       	mov    $0x10,%ecx
 878:	6a 00                	push   $0x0
 87a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 87d:	8b 10                	mov    (%eax),%edx
 87f:	89 f0                	mov    %esi,%eax
 881:	e8 7a fe ff ff       	call   700 <printint>
        ap++;
 886:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 88a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 88d:	31 c9                	xor    %ecx,%ecx
 88f:	e9 6e ff ff ff       	jmp    802 <printf+0x52>
 894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 898:	8b 45 d0             	mov    -0x30(%ebp),%eax
 89b:	8b 10                	mov    (%eax),%edx
        ap++;
 89d:	83 c0 04             	add    $0x4,%eax
 8a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8a3:	85 d2                	test   %edx,%edx
 8a5:	0f 84 8d 00 00 00    	je     938 <printf+0x188>
        while(*s != 0){
 8ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8b0:	84 c0                	test   %al,%al
 8b2:	0f 84 4a ff ff ff    	je     802 <printf+0x52>
 8b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8bb:	89 d3                	mov    %edx,%ebx
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8c3:	83 c3 01             	add    $0x1,%ebx
 8c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8c9:	6a 01                	push   $0x1
 8cb:	57                   	push   %edi
 8cc:	56                   	push   %esi
 8cd:	e8 a1 fd ff ff       	call   673 <write>
        while(*s != 0){
 8d2:	0f b6 03             	movzbl (%ebx),%eax
 8d5:	83 c4 10             	add    $0x10,%esp
 8d8:	84 c0                	test   %al,%al
 8da:	75 e4                	jne    8c0 <printf+0x110>
      state = 0;
 8dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 8df:	31 c9                	xor    %ecx,%ecx
 8e1:	e9 1c ff ff ff       	jmp    802 <printf+0x52>
 8e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8f8:	6a 01                	push   $0x1
 8fa:	e9 7b ff ff ff       	jmp    87a <printf+0xca>
 8ff:	90                   	nop
        putc(fd, *ap);
 900:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 906:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 908:	6a 01                	push   $0x1
 90a:	57                   	push   %edi
 90b:	56                   	push   %esi
        putc(fd, *ap);
 90c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 90f:	e8 5f fd ff ff       	call   673 <write>
        ap++;
 914:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 918:	83 c4 10             	add    $0x10,%esp
      state = 0;
 91b:	31 c9                	xor    %ecx,%ecx
 91d:	e9 e0 fe ff ff       	jmp    802 <printf+0x52>
 922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 928:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 92b:	83 ec 04             	sub    $0x4,%esp
 92e:	e9 2a ff ff ff       	jmp    85d <printf+0xad>
 933:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 937:	90                   	nop
          s = "(null)";
 938:	ba 15 0b 00 00       	mov    $0xb15,%edx
        while(*s != 0){
 93d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 940:	b8 28 00 00 00       	mov    $0x28,%eax
 945:	89 d3                	mov    %edx,%ebx
 947:	e9 74 ff ff ff       	jmp    8c0 <printf+0x110>
 94c:	66 90                	xchg   %ax,%ax
 94e:	66 90                	xchg   %ax,%ax

00000950 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 950:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	a1 c8 0e 00 00       	mov    0xec8,%eax
{
 956:	89 e5                	mov    %esp,%ebp
 958:	57                   	push   %edi
 959:	56                   	push   %esi
 95a:	53                   	push   %ebx
 95b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 95e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 968:	89 c2                	mov    %eax,%edx
 96a:	8b 00                	mov    (%eax),%eax
 96c:	39 ca                	cmp    %ecx,%edx
 96e:	73 30                	jae    9a0 <free+0x50>
 970:	39 c1                	cmp    %eax,%ecx
 972:	72 04                	jb     978 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 974:	39 c2                	cmp    %eax,%edx
 976:	72 f0                	jb     968 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 978:	8b 73 fc             	mov    -0x4(%ebx),%esi
 97b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 97e:	39 f8                	cmp    %edi,%eax
 980:	74 30                	je     9b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 982:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 985:	8b 42 04             	mov    0x4(%edx),%eax
 988:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 98b:	39 f1                	cmp    %esi,%ecx
 98d:	74 3a                	je     9c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 98f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 991:	5b                   	pop    %ebx
  freep = p;
 992:	89 15 c8 0e 00 00    	mov    %edx,0xec8
}
 998:	5e                   	pop    %esi
 999:	5f                   	pop    %edi
 99a:	5d                   	pop    %ebp
 99b:	c3                   	ret    
 99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a0:	39 c2                	cmp    %eax,%edx
 9a2:	72 c4                	jb     968 <free+0x18>
 9a4:	39 c1                	cmp    %eax,%ecx
 9a6:	73 c0                	jae    968 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ae:	39 f8                	cmp    %edi,%eax
 9b0:	75 d0                	jne    982 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9b2:	03 70 04             	add    0x4(%eax),%esi
 9b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b8:	8b 02                	mov    (%edx),%eax
 9ba:	8b 00                	mov    (%eax),%eax
 9bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9bf:	8b 42 04             	mov    0x4(%edx),%eax
 9c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9c5:	39 f1                	cmp    %esi,%ecx
 9c7:	75 c6                	jne    98f <free+0x3f>
    p->s.size += bp->s.size;
 9c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9cc:	89 15 c8 0e 00 00    	mov    %edx,0xec8
    p->s.size += bp->s.size;
 9d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9d8:	89 0a                	mov    %ecx,(%edx)
}
 9da:	5b                   	pop    %ebx
 9db:	5e                   	pop    %esi
 9dc:	5f                   	pop    %edi
 9dd:	5d                   	pop    %ebp
 9de:	c3                   	ret    
 9df:	90                   	nop

000009e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	57                   	push   %edi
 9e4:	56                   	push   %esi
 9e5:	53                   	push   %ebx
 9e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9ec:	8b 3d c8 0e 00 00    	mov    0xec8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f2:	8d 70 07             	lea    0x7(%eax),%esi
 9f5:	c1 ee 03             	shr    $0x3,%esi
 9f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9fb:	85 ff                	test   %edi,%edi
 9fd:	0f 84 9d 00 00 00    	je     aa0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a03:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a05:	8b 4a 04             	mov    0x4(%edx),%ecx
 a08:	39 f1                	cmp    %esi,%ecx
 a0a:	73 6a                	jae    a76 <malloc+0x96>
 a0c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a11:	39 de                	cmp    %ebx,%esi
 a13:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a16:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a20:	eb 17                	jmp    a39 <malloc+0x59>
 a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a28:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a2a:	8b 48 04             	mov    0x4(%eax),%ecx
 a2d:	39 f1                	cmp    %esi,%ecx
 a2f:	73 4f                	jae    a80 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a31:	8b 3d c8 0e 00 00    	mov    0xec8,%edi
 a37:	89 c2                	mov    %eax,%edx
 a39:	39 d7                	cmp    %edx,%edi
 a3b:	75 eb                	jne    a28 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a3d:	83 ec 0c             	sub    $0xc,%esp
 a40:	ff 75 e4             	push   -0x1c(%ebp)
 a43:	e8 93 fc ff ff       	call   6db <sbrk>
  if(p == (char*)-1)
 a48:	83 c4 10             	add    $0x10,%esp
 a4b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a4e:	74 1c                	je     a6c <malloc+0x8c>
  hp->s.size = nu;
 a50:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a53:	83 ec 0c             	sub    $0xc,%esp
 a56:	83 c0 08             	add    $0x8,%eax
 a59:	50                   	push   %eax
 a5a:	e8 f1 fe ff ff       	call   950 <free>
  return freep;
 a5f:	8b 15 c8 0e 00 00    	mov    0xec8,%edx
      if((p = morecore(nunits)) == 0)
 a65:	83 c4 10             	add    $0x10,%esp
 a68:	85 d2                	test   %edx,%edx
 a6a:	75 bc                	jne    a28 <malloc+0x48>
        return 0;
  }
}
 a6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a6f:	31 c0                	xor    %eax,%eax
}
 a71:	5b                   	pop    %ebx
 a72:	5e                   	pop    %esi
 a73:	5f                   	pop    %edi
 a74:	5d                   	pop    %ebp
 a75:	c3                   	ret    
    if(p->s.size >= nunits){
 a76:	89 d0                	mov    %edx,%eax
 a78:	89 fa                	mov    %edi,%edx
 a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a80:	39 ce                	cmp    %ecx,%esi
 a82:	74 4c                	je     ad0 <malloc+0xf0>
        p->s.size -= nunits;
 a84:	29 f1                	sub    %esi,%ecx
 a86:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a89:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a8c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a8f:	89 15 c8 0e 00 00    	mov    %edx,0xec8
}
 a95:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a98:	83 c0 08             	add    $0x8,%eax
}
 a9b:	5b                   	pop    %ebx
 a9c:	5e                   	pop    %esi
 a9d:	5f                   	pop    %edi
 a9e:	5d                   	pop    %ebp
 a9f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 aa0:	c7 05 c8 0e 00 00 cc 	movl   $0xecc,0xec8
 aa7:	0e 00 00 
    base.s.size = 0;
 aaa:	bf cc 0e 00 00       	mov    $0xecc,%edi
    base.s.ptr = freep = prevp = &base;
 aaf:	c7 05 cc 0e 00 00 cc 	movl   $0xecc,0xecc
 ab6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 abb:	c7 05 d0 0e 00 00 00 	movl   $0x0,0xed0
 ac2:	00 00 00 
    if(p->s.size >= nunits){
 ac5:	e9 42 ff ff ff       	jmp    a0c <malloc+0x2c>
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ad0:	8b 08                	mov    (%eax),%ecx
 ad2:	89 0a                	mov    %ecx,(%edx)
 ad4:	eb b9                	jmp    a8f <malloc+0xaf>
