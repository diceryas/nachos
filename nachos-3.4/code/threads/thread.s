
thread.o:     file format elf32-i386


Disassembly of section .text:

00000000 <_ZN6ThreadC1EPc>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
   6:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
   a:	8b 45 08             	mov    0x8(%ebp),%eax
   d:	8b 55 0c             	mov    0xc(%ebp),%edx
  10:	89 50 5c             	mov    %edx,0x5c(%eax)
  13:	8b 45 08             	mov    0x8(%ebp),%eax
  16:	89 04 24             	mov    %eax,(%esp)
  19:	e8 fc ff ff ff       	call   1a <_ZN6ThreadC1EPc+0x1a>
  1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  21:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  25:	75 0e                	jne    35 <_ZN6ThreadC1EPc+0x35>
  27:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  2e:	e8 fc ff ff ff       	call   2f <_ZN6ThreadC1EPc+0x2f>
  33:	eb 4c                	jmp    81 <_ZN6ThreadC1EPc+0x81>
  35:	a1 00 00 00 00       	mov    0x0,%eax
  3a:	8d 50 01             	lea    0x1(%eax),%edx
  3d:	89 15 00 00 00 00    	mov    %edx,0x0
  43:	8b 55 08             	mov    0x8(%ebp),%edx
  46:	89 14 85 00 00 00 00 	mov    %edx,0x0(,%eax,4)
  4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  50:	c7 04 85 00 00 00 00 	movl   $0x1,0x0(,%eax,4)
  57:	01 00 00 00 
  5b:	8b 45 08             	mov    0x8(%ebp),%eax
  5e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  61:	89 50 50             	mov    %edx,0x50(%eax)
  64:	8b 45 08             	mov    0x8(%ebp),%eax
  67:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  6d:	8b 45 08             	mov    0x8(%ebp),%eax
  70:	c7 40 54 00 00 00 00 	movl   $0x0,0x54(%eax)
  77:	8b 45 08             	mov    0x8(%ebp),%eax
  7a:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
  81:	c9                   	leave  
  82:	c3                   	ret    
  83:	90                   	nop

00000084 <_ZN6Thread11setThreadIdEv>:
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	83 ec 10             	sub    $0x10,%esp
  8a:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
  91:	eb 14                	jmp    a7 <_ZN6Thread11setThreadIdEv+0x23>
  93:	8b 45 fc             	mov    -0x4(%ebp),%eax
  96:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  9d:	85 c0                	test   %eax,%eax
  9f:	75 02                	jne    a3 <_ZN6Thread11setThreadIdEv+0x1f>
  a1:	eb 0d                	jmp    b0 <_ZN6Thread11setThreadIdEv+0x2c>
  a3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  a7:	81 7d fc 80 00 00 00 	cmpl   $0x80,-0x4(%ebp)
  ae:	7e e3                	jle    93 <_ZN6Thread11setThreadIdEv+0xf>
  b0:	81 7d fc 81 00 00 00 	cmpl   $0x81,-0x4(%ebp)
  b7:	75 07                	jne    c0 <_ZN6Thread11setThreadIdEv+0x3c>
  b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  be:	eb 03                	jmp    c3 <_ZN6Thread11setThreadIdEv+0x3f>
  c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  c3:	c9                   	leave  
  c4:	c3                   	ret    
  c5:	90                   	nop

000000c6 <_ZN6ThreadD1Ev>:
  c6:	55                   	push   %ebp
  c7:	89 e5                	mov    %esp,%ebp
  c9:	83 ec 18             	sub    $0x18,%esp
  cc:	8b 45 08             	mov    0x8(%ebp),%eax
  cf:	8b 40 5c             	mov    0x5c(%eax),%eax
  d2:	89 44 24 08          	mov    %eax,0x8(%esp)
  d6:	c7 44 24 04 3c 00 00 	movl   $0x3c,0x4(%esp)
  dd:	00 
  de:	c7 04 24 74 00 00 00 	movl   $0x74,(%esp)
  e5:	e8 fc ff ff ff       	call   e6 <_ZN6ThreadD1Ev+0x20>
  ea:	a1 00 00 00 00       	mov    0x0,%eax
  ef:	39 45 08             	cmp    %eax,0x8(%ebp)
  f2:	75 37                	jne    12b <_ZN6ThreadD1Ev+0x65>
  f4:	a1 00 00 00 00       	mov    0x0,%eax
  f9:	c7 44 24 0c 52 00 00 	movl   $0x52,0xc(%esp)
 100:	00 
 101:	c7 44 24 08 55 00 00 	movl   $0x55,0x8(%esp)
 108:	00 
 109:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
 110:	00 
 111:	89 04 24             	mov    %eax,(%esp)
 114:	e8 fc ff ff ff       	call   115 <_ZN6ThreadD1Ev+0x4f>
 119:	a1 00 00 00 00       	mov    0x0,%eax
 11e:	89 04 24             	mov    %eax,(%esp)
 121:	e8 fc ff ff ff       	call   122 <_ZN6ThreadD1Ev+0x5c>
 126:	e8 fc ff ff ff       	call   127 <_ZN6ThreadD1Ev+0x61>
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	8b 40 54             	mov    0x54(%eax),%eax
 131:	85 c0                	test   %eax,%eax
 133:	74 19                	je     14e <_ZN6ThreadD1Ev+0x88>
 135:	b8 00 40 00 00       	mov    $0x4000,%eax
 13a:	89 c2                	mov    %eax,%edx
 13c:	8b 45 08             	mov    0x8(%ebp),%eax
 13f:	8b 40 54             	mov    0x54(%eax),%eax
 142:	89 54 24 04          	mov    %edx,0x4(%esp)
 146:	89 04 24             	mov    %eax,(%esp)
 149:	e8 fc ff ff ff       	call   14a <_ZN6ThreadD1Ev+0x84>
 14e:	c9                   	leave  
 14f:	c3                   	ret    

00000150 <_ZN6Thread4ForkEPFviEi>:
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	83 ec 38             	sub    $0x38,%esp
 156:	8b 55 0c             	mov    0xc(%ebp),%edx
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	8b 40 5c             	mov    0x5c(%eax),%eax
 15f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 162:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 166:	89 54 24 0c          	mov    %edx,0xc(%esp)
 16a:	89 44 24 08          	mov    %eax,0x8(%esp)
 16e:	c7 44 24 04 90 00 00 	movl   $0x90,0x4(%esp)
 175:	00 
 176:	c7 04 24 74 00 00 00 	movl   $0x74,(%esp)
 17d:	e8 fc ff ff ff       	call   17e <_ZN6Thread4ForkEPFviEi+0x2e>
 182:	8b 45 10             	mov    0x10(%ebp),%eax
 185:	89 44 24 08          	mov    %eax,0x8(%esp)
 189:	8b 45 0c             	mov    0xc(%ebp),%eax
 18c:	89 44 24 04          	mov    %eax,0x4(%esp)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	89 04 24             	mov    %eax,(%esp)
 196:	e8 fc ff ff ff       	call   197 <_ZN6Thread4ForkEPFviEi+0x47>
 19b:	a1 00 00 00 00       	mov    0x0,%eax
 1a0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a7:	00 
 1a8:	89 04 24             	mov    %eax,(%esp)
 1ab:	e8 fc ff ff ff       	call   1ac <_ZN6Thread4ForkEPFviEi+0x5c>
 1b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 1b3:	a1 00 00 00 00       	mov    0x0,%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	89 54 24 04          	mov    %edx,0x4(%esp)
 1bf:	89 04 24             	mov    %eax,(%esp)
 1c2:	e8 fc ff ff ff       	call   1c3 <_ZN6Thread4ForkEPFviEi+0x73>
 1c7:	a1 00 00 00 00       	mov    0x0,%eax
 1cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1cf:	89 54 24 04          	mov    %edx,0x4(%esp)
 1d3:	89 04 24             	mov    %eax,(%esp)
 1d6:	e8 fc ff ff ff       	call   1d7 <_ZN6Thread4ForkEPFviEi+0x87>
 1db:	c9                   	leave  
 1dc:	c3                   	ret    
 1dd:	90                   	nop

000001de <_ZN6Thread13CheckOverflowEv>:
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	83 ec 18             	sub    $0x18,%esp
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	8b 40 54             	mov    0x54(%eax),%eax
 1ea:	85 c0                	test   %eax,%eax
 1ec:	74 46                	je     234 <_ZN6Thread13CheckOverflowEv+0x56>
 1ee:	8b 45 08             	mov    0x8(%ebp),%eax
 1f1:	8b 40 54             	mov    0x54(%eax),%eax
 1f4:	8b 00                	mov    (%eax),%eax
 1f6:	3d ef be ad de       	cmp    $0xdeadbeef,%eax
 1fb:	74 37                	je     234 <_ZN6Thread13CheckOverflowEv+0x56>
 1fd:	a1 00 00 00 00       	mov    0x0,%eax
 202:	c7 44 24 0c 52 00 00 	movl   $0x52,0xc(%esp)
 209:	00 
 20a:	c7 44 24 08 92 00 00 	movl   $0x92,0x8(%esp)
 211:	00 
 212:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
 219:	00 
 21a:	89 04 24             	mov    %eax,(%esp)
 21d:	e8 fc ff ff ff       	call   21e <_ZN6Thread13CheckOverflowEv+0x40>
 222:	a1 00 00 00 00       	mov    0x0,%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 fc ff ff ff       	call   22b <_ZN6Thread13CheckOverflowEv+0x4d>
 22f:	e8 fc ff ff ff       	call   230 <_ZN6Thread13CheckOverflowEv+0x52>
 234:	c9                   	leave  
 235:	c3                   	ret    

00000236 <_ZN6Thread6FinishEv>:
 236:	55                   	push   %ebp
 237:	89 e5                	mov    %esp,%ebp
 239:	83 ec 18             	sub    $0x18,%esp
 23c:	a1 00 00 00 00       	mov    0x0,%eax
 241:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 248:	00 
 249:	89 04 24             	mov    %eax,(%esp)
 24c:	e8 fc ff ff ff       	call   24d <_ZN6Thread6FinishEv+0x17>
 251:	a1 00 00 00 00       	mov    0x0,%eax
 256:	39 45 08             	cmp    %eax,0x8(%ebp)
 259:	74 37                	je     292 <_ZN6Thread6FinishEv+0x5c>
 25b:	a1 00 00 00 00       	mov    0x0,%eax
 260:	c7 44 24 0c 52 00 00 	movl   $0x52,0xc(%esp)
 267:	00 
 268:	c7 44 24 08 aa 00 00 	movl   $0xaa,0x8(%esp)
 26f:	00 
 270:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
 277:	00 
 278:	89 04 24             	mov    %eax,(%esp)
 27b:	e8 fc ff ff ff       	call   27c <_ZN6Thread6FinishEv+0x46>
 280:	a1 00 00 00 00       	mov    0x0,%eax
 285:	89 04 24             	mov    %eax,(%esp)
 288:	e8 fc ff ff ff       	call   289 <_ZN6Thread6FinishEv+0x53>
 28d:	e8 fc ff ff ff       	call   28e <_ZN6Thread6FinishEv+0x58>
 292:	8b 45 08             	mov    0x8(%ebp),%eax
 295:	89 04 24             	mov    %eax,(%esp)
 298:	e8 fc ff ff ff       	call   299 <_ZN6Thread6FinishEv+0x63>
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
 2a8:	00 
 2a9:	c7 04 24 74 00 00 00 	movl   $0x74,(%esp)
 2b0:	e8 fc ff ff ff       	call   2b1 <_ZN6Thread6FinishEv+0x7b>
 2b5:	a1 00 00 00 00       	mov    0x0,%eax
 2ba:	a3 00 00 00 00       	mov    %eax,0x0
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	89 04 24             	mov    %eax,(%esp)
 2c5:	e8 fc ff ff ff       	call   2c6 <_ZN6Thread6FinishEv+0x90>
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <_ZN6Thread5YieldEv>:
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	83 ec 28             	sub    $0x28,%esp
 2d2:	a1 00 00 00 00       	mov    0x0,%eax
 2d7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2de:	00 
 2df:	89 04 24             	mov    %eax,(%esp)
 2e2:	e8 fc ff ff ff       	call   2e3 <_ZN6Thread5YieldEv+0x17>
 2e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 2ea:	a1 00 00 00 00       	mov    0x0,%eax
 2ef:	39 45 08             	cmp    %eax,0x8(%ebp)
 2f2:	74 37                	je     32b <_ZN6Thread5YieldEv+0x5f>
 2f4:	a1 00 00 00 00       	mov    0x0,%eax
 2f9:	c7 44 24 0c 52 00 00 	movl   $0x52,0xc(%esp)
 300:	00 
 301:	c7 44 24 08 cb 00 00 	movl   $0xcb,0x8(%esp)
 308:	00 
 309:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
 310:	00 
 311:	89 04 24             	mov    %eax,(%esp)
 314:	e8 fc ff ff ff       	call   315 <_ZN6Thread5YieldEv+0x49>
 319:	a1 00 00 00 00       	mov    0x0,%eax
 31e:	89 04 24             	mov    %eax,(%esp)
 321:	e8 fc ff ff ff       	call   322 <_ZN6Thread5YieldEv+0x56>
 326:	e8 fc ff ff ff       	call   327 <_ZN6Thread5YieldEv+0x5b>
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	89 04 24             	mov    %eax,(%esp)
 331:	e8 fc ff ff ff       	call   332 <_ZN6Thread5YieldEv+0x66>
 336:	89 44 24 08          	mov    %eax,0x8(%esp)
 33a:	c7 44 24 04 d7 00 00 	movl   $0xd7,0x4(%esp)
 341:	00 
 342:	c7 04 24 74 00 00 00 	movl   $0x74,(%esp)
 349:	e8 fc ff ff ff       	call   34a <_ZN6Thread5YieldEv+0x7e>
 34e:	a1 00 00 00 00       	mov    0x0,%eax
 353:	89 04 24             	mov    %eax,(%esp)
 356:	e8 fc ff ff ff       	call   357 <_ZN6Thread5YieldEv+0x8b>
 35b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 35e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 362:	74 28                	je     38c <_ZN6Thread5YieldEv+0xc0>
 364:	a1 00 00 00 00       	mov    0x0,%eax
 369:	8b 55 08             	mov    0x8(%ebp),%edx
 36c:	89 54 24 04          	mov    %edx,0x4(%esp)
 370:	89 04 24             	mov    %eax,(%esp)
 373:	e8 fc ff ff ff       	call   374 <_ZN6Thread5YieldEv+0xa8>
 378:	a1 00 00 00 00       	mov    0x0,%eax
 37d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 380:	89 54 24 04          	mov    %edx,0x4(%esp)
 384:	89 04 24             	mov    %eax,(%esp)
 387:	e8 fc ff ff ff       	call   388 <_ZN6Thread5YieldEv+0xbc>
 38c:	a1 00 00 00 00       	mov    0x0,%eax
 391:	8b 55 f0             	mov    -0x10(%ebp),%edx
 394:	89 54 24 04          	mov    %edx,0x4(%esp)
 398:	89 04 24             	mov    %eax,(%esp)
 39b:	e8 fc ff ff ff       	call   39c <_ZN6Thread5YieldEv+0xd0>
 3a0:	c9                   	leave  
 3a1:	c3                   	ret    

000003a2 <_ZN6Thread5SleepEv>:
 3a2:	55                   	push   %ebp
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	83 ec 28             	sub    $0x28,%esp
 3a8:	a1 00 00 00 00       	mov    0x0,%eax
 3ad:	39 45 08             	cmp    %eax,0x8(%ebp)
 3b0:	74 37                	je     3e9 <_ZN6Thread5SleepEv+0x47>
 3b2:	a1 00 00 00 00       	mov    0x0,%eax
 3b7:	c7 44 24 0c 52 00 00 	movl   $0x52,0xc(%esp)
 3be:	00 
 3bf:	c7 44 24 08 ef 00 00 	movl   $0xef,0x8(%esp)
 3c6:	00 
 3c7:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
 3ce:	00 
 3cf:	89 04 24             	mov    %eax,(%esp)
 3d2:	e8 fc ff ff ff       	call   3d3 <_ZN6Thread5SleepEv+0x31>
 3d7:	a1 00 00 00 00       	mov    0x0,%eax
 3dc:	89 04 24             	mov    %eax,(%esp)
 3df:	e8 fc ff ff ff       	call   3e0 <_ZN6Thread5SleepEv+0x3e>
 3e4:	e8 fc ff ff ff       	call   3e5 <_ZN6Thread5SleepEv+0x43>
 3e9:	a1 00 00 00 00       	mov    0x0,%eax
 3ee:	89 04 24             	mov    %eax,(%esp)
 3f1:	e8 fc ff ff ff       	call   3f2 <_ZN6Thread5SleepEv+0x50>
 3f6:	85 c0                	test   %eax,%eax
 3f8:	0f 95 c0             	setne  %al
 3fb:	84 c0                	test   %al,%al
 3fd:	74 37                	je     436 <_ZN6Thread5SleepEv+0x94>
 3ff:	a1 00 00 00 00       	mov    0x0,%eax
 404:	c7 44 24 0c 52 00 00 	movl   $0x52,0xc(%esp)
 40b:	00 
 40c:	c7 44 24 08 f0 00 00 	movl   $0xf0,0x8(%esp)
 413:	00 
 414:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
 41b:	00 
 41c:	89 04 24             	mov    %eax,(%esp)
 41f:	e8 fc ff ff ff       	call   420 <_ZN6Thread5SleepEv+0x7e>
 424:	a1 00 00 00 00       	mov    0x0,%eax
 429:	89 04 24             	mov    %eax,(%esp)
 42c:	e8 fc ff ff ff       	call   42d <_ZN6Thread5SleepEv+0x8b>
 431:	e8 fc ff ff ff       	call   432 <_ZN6Thread5SleepEv+0x90>
 436:	8b 45 08             	mov    0x8(%ebp),%eax
 439:	89 04 24             	mov    %eax,(%esp)
 43c:	e8 fc ff ff ff       	call   43d <_ZN6Thread5SleepEv+0x9b>
 441:	89 44 24 08          	mov    %eax,0x8(%esp)
 445:	c7 44 24 04 ed 00 00 	movl   $0xed,0x4(%esp)
 44c:	00 
 44d:	c7 04 24 74 00 00 00 	movl   $0x74,(%esp)
 454:	e8 fc ff ff ff       	call   455 <_ZN6Thread5SleepEv+0xb3>
 459:	8b 45 08             	mov    0x8(%ebp),%eax
 45c:	c7 40 58 03 00 00 00 	movl   $0x3,0x58(%eax)
 463:	eb 0d                	jmp    472 <_ZN6Thread5SleepEv+0xd0>
 465:	a1 00 00 00 00       	mov    0x0,%eax
 46a:	89 04 24             	mov    %eax,(%esp)
 46d:	e8 fc ff ff ff       	call   46e <_ZN6Thread5SleepEv+0xcc>
 472:	a1 00 00 00 00       	mov    0x0,%eax
 477:	89 04 24             	mov    %eax,(%esp)
 47a:	e8 fc ff ff ff       	call   47b <_ZN6Thread5SleepEv+0xd9>
 47f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 482:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 486:	0f 94 c0             	sete   %al
 489:	84 c0                	test   %al,%al
 48b:	75 d8                	jne    465 <_ZN6Thread5SleepEv+0xc3>
 48d:	a1 00 00 00 00       	mov    0x0,%eax
 492:	8b 55 f4             	mov    -0xc(%ebp),%edx
 495:	89 54 24 04          	mov    %edx,0x4(%esp)
 499:	89 04 24             	mov    %eax,(%esp)
 49c:	e8 fc ff ff ff       	call   49d <_ZN6Thread5SleepEv+0xfb>
 4a1:	c9                   	leave  
 4a2:	c3                   	ret    

000004a3 <_ZL12ThreadFinishv>:
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	83 ec 18             	sub    $0x18,%esp
 4a9:	a1 00 00 00 00       	mov    0x0,%eax
 4ae:	89 04 24             	mov    %eax,(%esp)
 4b1:	e8 fc ff ff ff       	call   4b2 <_ZL12ThreadFinishv+0xf>
 4b6:	c9                   	leave  
 4b7:	c3                   	ret    

000004b8 <_ZL15InterruptEnablev>:
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
 4bb:	83 ec 18             	sub    $0x18,%esp
 4be:	a1 00 00 00 00       	mov    0x0,%eax
 4c3:	89 04 24             	mov    %eax,(%esp)
 4c6:	e8 fc ff ff ff       	call   4c7 <_ZL15InterruptEnablev+0xf>
 4cb:	c9                   	leave  
 4cc:	c3                   	ret    

000004cd <_Z11ThreadPrinti>:
 4cd:	55                   	push   %ebp
 4ce:	89 e5                	mov    %esp,%ebp
 4d0:	83 ec 28             	sub    $0x28,%esp
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4dc:	89 04 24             	mov    %eax,(%esp)
 4df:	e8 fc ff ff ff       	call   4e0 <_Z11ThreadPrinti+0x13>
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    

000004e6 <_ZN6Thread13StackAllocateEPFviEi>:
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	83 ec 18             	sub    $0x18,%esp
 4ec:	b8 00 40 00 00       	mov    $0x4000,%eax
 4f1:	89 04 24             	mov    %eax,(%esp)
 4f4:	e8 fc ff ff ff       	call   4f5 <_ZN6Thread13StackAllocateEPFviEi+0xf>
 4f9:	8b 55 08             	mov    0x8(%ebp),%edx
 4fc:	89 42 54             	mov    %eax,0x54(%edx)
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	8b 40 54             	mov    0x54(%eax),%eax
 505:	8d 90 f0 3f 00 00    	lea    0x3ff0(%eax),%edx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	89 10                	mov    %edx,(%eax)
 510:	8b 45 08             	mov    0x8(%ebp),%eax
 513:	8b 00                	mov    (%eax),%eax
 515:	8d 50 fc             	lea    -0x4(%eax),%edx
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	89 10                	mov    %edx,(%eax)
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	8b 00                	mov    (%eax),%eax
 522:	ba 00 00 00 00       	mov    $0x0,%edx
 527:	89 10                	mov    %edx,(%eax)
 529:	8b 45 08             	mov    0x8(%ebp),%eax
 52c:	8b 40 54             	mov    0x54(%eax),%eax
 52f:	c7 00 ef be ad de    	movl   $0xdeadbeef,(%eax)
 535:	ba 00 00 00 00       	mov    $0x0,%edx
 53a:	8b 45 08             	mov    0x8(%ebp),%eax
 53d:	89 50 20             	mov    %edx,0x20(%eax)
 540:	ba b8 04 00 00       	mov    $0x4b8,%edx
 545:	8b 45 08             	mov    0x8(%ebp),%eax
 548:	89 50 0c             	mov    %edx,0xc(%eax)
 54b:	8b 55 0c             	mov    0xc(%ebp),%edx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	89 50 18             	mov    %edx,0x18(%eax)
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	8b 55 10             	mov    0x10(%ebp),%edx
 55a:	89 50 10             	mov    %edx,0x10(%eax)
 55d:	ba a3 04 00 00       	mov    $0x4a3,%edx
 562:	8b 45 08             	mov    0x8(%ebp),%eax
 565:	89 50 1c             	mov    %edx,0x1c(%eax)
 568:	c9                   	leave  
 569:	c3                   	ret    

Disassembly of section .text._ZN6Thread7getNameEv:

00000000 <_ZN6Thread7getNameEv>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 45 08             	mov    0x8(%ebp),%eax
   6:	8b 40 5c             	mov    0x5c(%eax),%eax
   9:	5d                   	pop    %ebp
   a:	c3                   	ret    

Disassembly of section .text._ZN6Thread5PrintEv:

00000000 <_ZN6Thread5PrintEv>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
   6:	8b 45 08             	mov    0x8(%ebp),%eax
   9:	8b 40 5c             	mov    0x5c(%eax),%eax
   c:	89 44 24 04          	mov    %eax,0x4(%esp)
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 fc ff ff ff       	call   18 <_ZN6Thread5PrintEv+0x18>
  1c:	c9                   	leave  
  1d:	c3                   	ret    

Disassembly of section .text._ZN9Interrupt8getLevelEv:

00000000 <_ZN9Interrupt8getLevelEv>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 45 08             	mov    0x8(%ebp),%eax
   6:	8b 00                	mov    (%eax),%eax
   8:	5d                   	pop    %ebp
   9:	c3                   	ret    
