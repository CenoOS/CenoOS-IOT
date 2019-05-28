
bin/CenoRTOS.bin:     file format binary


Disassembly of section .data:

00000000 <.data>:
       0:	20008000 	andcs	r8, r0, r0
       4:	0000031d 	andeq	r0, r0, sp, lsl r3
       8:	00000f3d 	andeq	r0, r0, sp, lsr pc
       c:	00000f75 	andeq	r0, r0, r5, ror pc
      10:	00000f4b 	andeq	r0, r0, fp, asr #30
      14:	00000f59 	andeq	r0, r0, r9, asr pc
      18:	00000f67 	andeq	r0, r0, r7, ror #30
	...
      2c:	00000f83 	andeq	r0, r0, r3, lsl #31
      30:	00000f91 	muleq	r0, r1, pc	; <UNPREDICTABLE>
      34:	00000000 	andeq	r0, r0, r0
      38:	00000f25 	andeq	r0, r0, r5, lsr #30
      3c:	00000ef5 	strdeq	r0, [r0], -r5
      40:	00000f9f 	muleq	r0, pc, pc	; <UNPREDICTABLE>
      44:	00000fad 	andeq	r0, r0, sp, lsr #31
      48:	00000fbb 			; <UNDEFINED> instruction: 0x00000fbb
      4c:	00000fc9 	andeq	r0, r0, r9, asr #31
      50:	00000fd7 	ldrdeq	r0, [r0], -r7
      54:	00000fe5 	andeq	r0, r0, r5, ror #31
      58:	00000ff3 	strdeq	r0, [r0], -r3
      5c:	00001001 	andeq	r1, r0, r1
      60:	0000100f 	andeq	r1, r0, pc
      64:	0000101d 	andeq	r1, r0, sp, lsl r0
      68:	0000102b 	andeq	r1, r0, fp, lsr #32
      6c:	00001039 	andeq	r1, r0, r9, lsr r0
      70:	00001047 	andeq	r1, r0, r7, asr #32
      74:	00001055 	andeq	r1, r0, r5, asr r0
      78:	00001063 	andeq	r1, r0, r3, rrx
      7c:	00001071 	andeq	r1, r0, r1, ror r0
      80:	0000107f 	andeq	r1, r0, pc, ror r0
      84:	0000108d 	andeq	r1, r0, sp, lsl #1
      88:	0000109b 	muleq	r0, fp, r0
      8c:	000010a9 	andeq	r1, r0, r9, lsr #1
      90:	000010b7 	strheq	r1, [r0], -r7
      94:	000010c5 	andeq	r1, r0, r5, asr #1
      98:	000010d3 	ldrdeq	r1, [r0], -r3
      9c:	000010e1 	andeq	r1, r0, r1, ror #1
      a0:	000010ef 	andeq	r1, r0, pc, ror #1
      a4:	000010fd 	strdeq	r1, [r0], -sp
      a8:	0000110b 	andeq	r1, r0, fp, lsl #2
      ac:	00001119 	andeq	r1, r0, r9, lsl r1
      b0:	00001127 	andeq	r1, r0, r7, lsr #2
      b4:	00001135 	andeq	r1, r0, r5, lsr r1
      b8:	00001143 	andeq	r1, r0, r3, asr #2
      bc:	00001151 	andeq	r1, r0, r1, asr r1
      c0:	0000115f 	andeq	r1, r0, pc, asr r1
      c4:	0000116d 	andeq	r1, r0, sp, ror #2
      c8:	0000117b 	andeq	r1, r0, fp, ror r1
      cc:	00001189 	andeq	r1, r0, r9, lsl #3
      d0:	00001197 	muleq	r0, r7, r1
      d4:	000011a5 	andeq	r1, r0, r5, lsr #3
      d8:	000011b3 			; <UNDEFINED> instruction: 0x000011b3
      dc:	000011c1 	andeq	r1, r0, r1, asr #3
      e0:	000011cf 	andeq	r1, r0, pc, asr #3
      e4:	000011dd 	ldrdeq	r1, [r0], -sp
      e8:	00000000 	andeq	r0, r0, r0
      ec:	000011eb 	andeq	r1, r0, fp, ror #3
      f0:	000011f9 	strdeq	r1, [r0], -r9
      f4:	00001207 	andeq	r1, r0, r7, lsl #4
      f8:	00001215 	andeq	r1, r0, r5, lsl r2
      fc:	00001223 	andeq	r1, r0, r3, lsr #4
     100:	00001231 	andeq	r1, r0, r1, lsr r2
     104:	0000123f 	andeq	r1, r0, pc, lsr r2
     108:	0000124d 	andeq	r1, r0, sp, asr #4
     10c:	0000125b 	andeq	r1, r0, fp, asr r2
     110:	00001269 	andeq	r1, r0, r9, ror #4
     114:	00001277 	andeq	r1, r0, r7, ror r2
     118:	00001285 	andeq	r1, r0, r5, lsl #5
     11c:	00001293 	muleq	r0, r3, r2
     120:	000012a1 	andeq	r1, r0, r1, lsr #5
     124:	000012af 	andeq	r1, r0, pc, lsr #5
     128:	000012bd 			; <UNDEFINED> instruction: 0x000012bd
     12c:	000012cb 	andeq	r1, r0, fp, asr #5
     130:	000012d9 	ldrdeq	r1, [r0], -r9
     134:	000012e7 	andeq	r1, r0, r7, ror #5
     138:	000012f5 	strdeq	r1, [r0], -r5
     13c:	00001303 	andeq	r1, r0, r3, lsl #6
	...
     150:	00001311 	andeq	r1, r0, r1, lsl r3
     154:	0000131f 	andeq	r1, r0, pc, lsl r3
     158:	0000132d 	andeq	r1, r0, sp, lsr #6
     15c:	0000133b 	andeq	r1, r0, fp, lsr r3
	...
     1ac:	00001349 	andeq	r1, r0, r9, asr #6
     1b0:	00001357 	andeq	r1, r0, r7, asr r3
     1b4:	00001365 	andeq	r1, r0, r5, ror #6
     1b8:	00001373 	andeq	r1, r0, r3, ror r3
     1bc:	00001381 	andeq	r1, r0, r1, lsl #7
     1c0:	0000138f 	andeq	r1, r0, pc, lsl #7
     1c4:	0000139d 	muleq	r0, sp, r3
     1c8:	000013ab 	andeq	r1, r0, fp, lsr #7
     1cc:	000013b9 			; <UNDEFINED> instruction: 0x000013b9
     1d0:	000013c7 	andeq	r1, r0, r7, asr #7
     1d4:	000013d5 	ldrdeq	r1, [r0], -r5
     1d8:	000013e3 	andeq	r1, r0, r3, ror #7
     1dc:	000013f1 	strdeq	r1, [r0], -r1	; <UNPREDICTABLE>
     1e0:	000013ff 	strdeq	r1, [r0], -pc	; <UNPREDICTABLE>
     1e4:	000015cd 	andeq	r1, r0, sp, asr #11
	...
     254:	00001587 	andeq	r1, r0, r7, lsl #11
     258:	00001595 	muleq	r0, r5, r5
     25c:	000015a3 	andeq	r1, r0, r3, lsr #11
     260:	000015b1 			; <UNDEFINED> instruction: 0x000015b1
     264:	000015bf 			; <UNDEFINED> instruction: 0x000015bf
     268:	af00b580 	svcge	0x0000b580
     26c:	fdf0f000 	ldc2l	0, cr15, [r0]
     270:	f0002001 			; <UNDEFINED> instruction: 0xf0002001
     274:	f000fd9b 			; <UNDEFINED> instruction: 0xf000fd9b
     278:	2001fe19 	andcs	pc, r1, r9, lsl lr	; <UNPREDICTABLE>
     27c:	fd96f000 	ldc2	0, cr15, [r6]
     280:	b580e7f4 	strlt	lr, [r0, #2036]	; 0x7f4
     284:	f000af00 			; <UNDEFINED> instruction: 0xf000af00
     288:	2001fdd5 	ldrdcs	pc, [r1], -r5
     28c:	fd8ef000 	stc2	0, cr15, [lr]
     290:	fdfaf000 	ldc2l	0, cr15, [sl]
     294:	f0002001 			; <UNDEFINED> instruction: 0xf0002001
     298:	e7f4fd89 	ldrb	pc, [r4, r9, lsl #27]!	; <UNPREDICTABLE>
     29c:	b084b580 	addlt	fp, r4, r0, lsl #11
     2a0:	f000af02 			; <UNDEFINED> instruction: 0xf000af02
     2a4:	4813fda3 	ldmdami	r3, {r0, r1, r5, r7, r8, sl, fp, ip, sp, lr, pc}
     2a8:	f9daf001 			; <UNDEFINED> instruction: 0xf9daf001
     2ac:	f0014812 			; <UNDEFINED> instruction: 0xf0014812
     2b0:	f000f9d7 			; <UNDEFINED> instruction: 0xf000f9d7
     2b4:	4b11fa25 	blmi	0x47eb50
     2b8:	23a09301 	movcs	r9, #67108864	; 0x4000000
     2bc:	4b109300 	blmi	0x424ec4
     2c0:	49102205 	ldmdbmi	r0, {r0, r2, r9, sp}
     2c4:	f0004810 			; <UNDEFINED> instruction: 0xf0004810
     2c8:	4603fbc7 	strmi	pc, [r3], -r7, asr #23
     2cc:	4b0f71fb 	blmi	0x3dcac0
     2d0:	23a09301 	movcs	r9, #67108864	; 0x4000000
     2d4:	4b0e9300 	blmi	0x3a4edc
     2d8:	490e2204 	stmdbmi	lr, {r2, r9, sp}
     2dc:	f000480e 			; <UNDEFINED> instruction: 0xf000480e
     2e0:	4603fbbb 			; <UNDEFINED> instruction: 0x4603fbbb
     2e4:	f00071bb 			; <UNDEFINED> instruction: 0xf00071bb
     2e8:	2300fa61 	movwcs	pc, #2657	; 0xa61	; <UNPREDICTABLE>
     2ec:	37084618 	smladcc	r8, r8, r6, r4
     2f0:	bd8046bd 	stclt	6, cr4, [r0, #756]	; 0x2f4
     2f4:	000016e4 	andeq	r1, r0, r4, ror #13
     2f8:	00001714 	andeq	r1, r0, r4, lsl r7
     2fc:	00000269 	andeq	r0, r0, r9, ror #4
     300:	20000044 	andcs	r0, r0, r4, asr #32
     304:	0000172c 	andeq	r1, r0, ip, lsr #14
     308:	200000e4 	andcs	r0, r0, r4, ror #1
     30c:	00000283 	andeq	r0, r0, r3, lsl #5
     310:	20000118 	andcs	r0, r0, r8, lsl r1
     314:	00001734 	andeq	r1, r0, r4, lsr r7
     318:	20000010 	andcs	r0, r0, r0, lsl r0
     31c:	b082b580 	addlt	fp, r2, r0, lsl #11
     320:	4b12af00 	blmi	0x4abf28
     324:	4b12607b 	blmi	0x498518
     328:	e007603b 	and	r6, r7, fp, lsr r0
     32c:	1d13687a 	ldcne	8, cr6, [r3, #-488]	; 0xfffffe18
     330:	683b607b 	ldmdavs	fp!, {r0, r1, r3, r4, r5, r6, sp, lr}
     334:	60391d19 	eorsvs	r1, r9, r9, lsl sp
     338:	601a6812 	andsvs	r6, sl, r2, lsl r8
     33c:	4a0d683b 	bmi	0x35a430
     340:	d3f34293 	mvnsle	r4, #805306377	; 0x30000009
     344:	603b4b0c 	eorsvs	r4, fp, ip, lsl #22
     348:	683be004 	ldmdavs	fp!, {r2, sp, lr, pc}
     34c:	603a1d1a 	eorsvs	r1, sl, sl, lsl sp
     350:	601a2200 	andsvs	r2, sl, r0, lsl #4
     354:	4a09683b 	bmi	0x25a448
     358:	d3f64293 	mvnsle	r4, #805306377	; 0x30000009
     35c:	fd02f000 	stc2	0, cr15, [r2, #-0]
     360:	ff9cf7ff 			; <UNDEFINED> instruction: 0xff9cf7ff
     364:	3708bf00 	strcc	fp, [r8, -r0, lsl #30]
     368:	bd8046bd 	stclt	6, cr4, [r0, #756]	; 0x2f4
     36c:	000018a1 	andeq	r1, r0, r1, lsr #17
     370:	20000000 	andcs	r0, r0, r0
     374:	20000008 	andcs	r0, r0, r8
     378:	20000008 	andcs	r0, r0, r8
     37c:	200002c8 	andcs	r0, r0, r8, asr #5
     380:	b085b480 	addlt	fp, r5, r0, lsl #9
     384:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
     388:	4b536039 	blmi	0x14d8474
     38c:	683b60fb 	ldmdavs	fp!, {r0, r1, r3, r4, r5, r6, r7, sp, lr}
     390:	f2002b03 	vqdmulh.s<illegal width 8>	d2, d0, d3
     394:	a201809a 	andge	r8, r1, #154	; 0x9a
     398:	f023f852 			; <UNDEFINED> instruction: 0xf023f852
     39c:	000003ad 	andeq	r0, r0, sp, lsr #7
     3a0:	000004b5 			; <UNDEFINED> instruction: 0x000004b5
     3a4:	000004bb 			; <UNDEFINED> instruction: 0x000004bb
     3a8:	000004c1 	andeq	r0, r0, r1, asr #9
     3ac:	2b16687b 	blcs	0x59a5a0
     3b0:	808af200 	addhi	pc, sl, r0, lsl #4
     3b4:	f852a201 			; <UNDEFINED> instruction: 0xf852a201
     3b8:	bf00f023 	svclt	0x0000f023
     3bc:	00000419 	andeq	r0, r0, r9, lsl r4
     3c0:	0000041f 	andeq	r0, r0, pc, lsl r4
     3c4:	00000427 	andeq	r0, r0, r7, lsr #8
     3c8:	0000042d 	andeq	r0, r0, sp, lsr #8
     3cc:	00000435 	andeq	r0, r0, r5, lsr r4
     3d0:	0000043b 	andeq	r0, r0, fp, lsr r4
     3d4:	00000443 	andeq	r0, r0, r3, asr #8
     3d8:	00000449 	andeq	r0, r0, r9, asr #8
     3dc:	00000451 	andeq	r0, r0, r1, asr r4
     3e0:	00000459 	andeq	r0, r0, r9, asr r4
     3e4:	0000045f 	andeq	r0, r0, pc, asr r4
     3e8:	00000465 	andeq	r0, r0, r5, ror #8
     3ec:	0000046b 	andeq	r0, r0, fp, ror #8
     3f0:	00000471 	andeq	r0, r0, r1, ror r4
     3f4:	00000479 	andeq	r0, r0, r9, ror r4
     3f8:	0000047f 	andeq	r0, r0, pc, ror r4
     3fc:	00000487 	andeq	r0, r0, r7, lsl #9
     400:	0000048d 	andeq	r0, r0, sp, lsl #9
     404:	00000493 	muleq	r0, r3, r4
     408:	00000499 	muleq	r0, r9, r4
     40c:	0000049f 	muleq	r0, pc, r4	; <UNPREDICTABLE>
     410:	000004a5 	andeq	r0, r0, r5, lsr #9
     414:	000004ab 	andeq	r0, r0, fp, lsr #9
     418:	60fb4b30 	rscsvs	r4, fp, r0, lsr fp
     41c:	f44fe049 	vst4.16	{d30-d33}, [pc], r9
     420:	60fb13e1 	rscsvs	r1, fp, r1, ror #7
     424:	4b2ee045 	blmi	0xbb8540
     428:	e04260fb 	strd	r6, [r2], #-11
     42c:	1316f44f 	tstne	r6, #1325400064	; 0x4f000000	; <UNPREDICTABLE>
     430:	e03e60fb 	ldrsht	r6, [lr], -fp
     434:	60fb4b2b 	rscsvs	r4, fp, fp, lsr #22
     438:	f44fe03b 	vst4.8	{d30-d33}, [pc :256], fp
     43c:	60fb1361 	rscsvs	r1, fp, r1, ror #6
     440:	4b29e037 	blmi	0xa78524
     444:	e03460fb 	ldrsht	r6, [r4], -fp
     448:	137af44f 	cmnne	sl, #1325400064	; 0x4f000000	; <UNPREDICTABLE>
     44c:	e03060fb 	ldrsht	r6, [r0], -fp
     450:	0396f44f 	orrseq	pc, r6, #1325400064	; 0x4f000000
     454:	e02c60fb 	strd	r6, [ip], -fp	; <UNPREDICTABLE>
     458:	60fb4b24 	rscsvs	r4, fp, r4, lsr #22
     45c:	4b24e029 	blmi	0x938508
     460:	e02660fb 	strd	r6, [r6], -fp	; <UNPREDICTABLE>
     464:	60fb4b23 	rscsvs	r4, fp, r3, lsr #22
     468:	4b23e023 	blmi	0x8f84fc
     46c:	e02060fb 	strd	r6, [r0], -fp	; <UNPREDICTABLE>
     470:	03e1f44f 	mvneq	pc, #1325400064	; 0x4f000000
     474:	e01c60fb 	ldrsh	r6, [ip], -fp
     478:	60fb4b20 	rscsvs	r4, fp, r0, lsr #22
     47c:	f44fe019 	vst4.8	{d30-d33}, [pc :64], r9
     480:	60fb03fa 	ldrshtvs	r0, [fp], #58	; 0x3a
     484:	4b1ee015 	blmi	0x7b84e0
     488:	e01260fb 	ldrsh	r6, [r2], -fp
     48c:	60fb4b12 	rscsvs	r4, fp, r2, lsl fp
     490:	4b1ce00f 	blmi	0x7384d4
     494:	e00c60fb 	strd	r6, [ip], -fp
     498:	60fb4b1b 	rscsvs	r4, fp, fp, lsl fp
     49c:	4b1be009 	blmi	0x6f84c8
     4a0:	e00660fb 	strd	r6, [r6], -fp
     4a4:	60fb4b1a 	rscsvs	r4, fp, sl, lsl fp
     4a8:	f44fe003 	vst4.8	{d30-d33}, [pc], r3
     4ac:	60fb037a 	rscsvs	r0, fp, sl, ror r3
     4b0:	e009bf00 	and	fp, r9, r0, lsl #30
     4b4:	60fb4b08 	rscsvs	r4, fp, r8, lsl #22
     4b8:	4b16e007 	blmi	0x5b84dc
     4bc:	e00460fb 	strd	r6, [r4], -fp
     4c0:	5330f247 	teqpl	r0, #1879048196	; 0x70000004	; <UNPREDICTABLE>
     4c4:	e00060fb 	strd	r6, [r0], -fp
     4c8:	68fbbf00 	ldmvs	fp!, {r8, r9, sl, fp, ip, sp, pc}^
     4cc:	37144618 			; <UNDEFINED> instruction: 0x37144618
     4d0:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     4d4:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     4d8:	00b71b00 	adcseq	r1, r7, r0, lsl #22
     4dc:	000f4240 	andeq	r4, pc, r0, asr #4
     4e0:	001e8480 	andseq	r8, lr, r0, lsl #9
     4e4:	00369e99 	mlaseq	r6, r9, lr, r9
     4e8:	003d0900 	eorseq	r0, sp, r0, lsl #18
     4ec:	004c4b40 	subeq	r4, ip, r0, asr #22
     4f0:	004e2000 	subeq	r2, lr, r0
     4f4:	005b8d80 	subseq	r8, fp, r0, lsl #27
     4f8:	005dc000 	subseq	ip, sp, r0
     4fc:	007a1200 	rsbseq	r1, sl, r0, lsl #4
     500:	00989680 	addseq	r9, r8, r0, lsl #13
     504:	00bb8000 	adcseq	r8, fp, r0
     508:	00cee8c0 	sbceq	lr, lr, r0, asr #17
     50c:	00da7a64 	sbcseq	r7, sl, r4, ror #20
     510:	00f42400 	rscseq	r2, r4, r0, lsl #8
     514:	002dc6c0 	eoreq	ip, sp, r0, asr #13
     518:	b082b580 	addlt	fp, r2, r0, lsl #11
     51c:	4b41af00 	blmi	0x106c124
     520:	607b6e1b 	rsbsvs	r6, fp, fp, lsl lr
     524:	6f1b4b3f 	svcvs	0x001b4b3f
     528:	683b603b 	ldmdavs	fp!, {r0, r1, r3, r4, r5, sp, lr}
     52c:	da3a2b00 	ble	0xe8b134
     530:	f403683b 	vst2.8	{d6-d7}, [r3 :256], fp
     534:	2b006300 	blcs	0x1913c
     538:	687bd00f 	ldmdavs	fp!, {r0, r1, r2, r3, ip, lr, pc}^
     53c:	f003099b 			; <UNDEFINED> instruction: 0xf003099b
     540:	683b020f 	ldmdavs	fp!, {r0, r1, r2, r3, r9}
     544:	f003091b 			; <UNDEFINED> instruction: 0xf003091b
     548:	46190307 	ldrmi	r0, [r9], -r7, lsl #6
     54c:	f7ff4610 			; <UNDEFINED> instruction: 0xf7ff4610
     550:	4602ff17 			; <UNDEFINED> instruction: 0x4602ff17
     554:	601a4b34 	andsvs	r4, sl, r4, lsr fp
     558:	4b33e002 	blmi	0xcf8568
     55c:	601a4a33 	andsvs	r4, sl, r3, lsr sl
     560:	f403687b 	vst2.16	{d6-d7}, [r3 :256], fp
     564:	2b000380 	blcs	0x136c
     568:	683bd057 	ldmdavs	fp!, {r0, r1, r2, r4, r6, ip, lr, pc}
     56c:	6300f403 	movwvs	pc, #1027	; 0x403	; <UNPREDICTABLE>
     570:	d00b2b00 	andle	r2, fp, r0, lsl #22
     574:	681a4b2c 	ldmdavs	sl, {r2, r3, r5, r8, r9, fp, lr}
     578:	0ddb683b 	ldcleq	8, cr6, [fp, #236]	; 0xec
     57c:	033ff003 	teqeq	pc, #3	; <UNPREDICTABLE>
     580:	fbb23301 	blx	0xfec8d18e
     584:	4a28f3f3 	bmi	0xa3d558
     588:	e0466013 	sub	r6, r6, r3, lsl r0
     58c:	681a4b26 	ldmdavs	sl, {r1, r2, r5, r8, r9, fp, lr}
     590:	0ddb683b 	ldcleq	8, cr6, [fp, #236]	; 0xec
     594:	033ff003 	teqeq	pc, #3	; <UNPREDICTABLE>
     598:	fbb23301 	blx	0xfec8d1a6
     59c:	085bf3f3 	ldmdaeq	fp, {r0, r1, r4, r5, r6, r7, r8, r9, ip, sp, lr, pc}^
     5a0:	60134a21 	andsvs	r4, r3, r1, lsr #20
     5a4:	687be039 	ldmdavs	fp!, {r0, r3, r4, r5, sp, lr, pc}^
     5a8:	6300f403 	movwvs	pc, #1027	; 0x403	; <UNPREDICTABLE>
     5ac:	d00f2b00 	andle	r2, pc, r0, lsl #22
     5b0:	099b687b 	ldmibeq	fp, {r0, r1, r3, r4, r5, r6, fp, sp, lr}
     5b4:	021ff003 	andseq	pc, pc, #3
     5b8:	091b687b 	ldmdbeq	fp, {r0, r1, r3, r4, r5, r6, fp, sp, lr}
     5bc:	0303f003 	movweq	pc, #12291	; 0x3003	; <UNPREDICTABLE>
     5c0:	46104619 			; <UNDEFINED> instruction: 0x46104619
     5c4:	fedcf7ff 	mrc2	7, 6, pc, cr12, cr15, {7}
     5c8:	4b174602 	blmi	0x5d1dd8
     5cc:	e002601a 	and	r6, r2, sl, lsl r0
     5d0:	4a164b15 	bmi	0x59322c
     5d4:	687b601a 	ldmdavs	fp!, {r1, r3, r4, sp, lr}^
     5d8:	0380f403 	orreq	pc, r0, #50331648	; 0x3000000
     5dc:	d01c2b00 	andsle	r2, ip, r0, lsl #22
     5e0:	f403687b 	vst2.16	{d6-d7}, [r3 :256], fp
     5e4:	2b006300 	blcs	0x191ec
     5e8:	4b0fd00b 	blmi	0x3f461c
     5ec:	687b681a 	ldmdavs	fp!, {r1, r3, r4, fp, sp, lr}^
     5f0:	f0030ddb 			; <UNDEFINED> instruction: 0xf0030ddb
     5f4:	3301030f 	movwcc	r0, #4879	; 0x130f
     5f8:	f3f3fbb2 			; <UNDEFINED> instruction: 0xf3f3fbb2
     5fc:	60134a0a 	andsvs	r4, r3, sl, lsl #20
     600:	4b09e00b 	blmi	0x278634
     604:	687b681a 	ldmdavs	fp!, {r1, r3, r4, fp, sp, lr}^
     608:	f0030ddb 			; <UNDEFINED> instruction: 0xf0030ddb
     60c:	3301030f 	movwcc	r0, #4879	; 0x130f
     610:	f3f3fbb2 			; <UNDEFINED> instruction: 0xf3f3fbb2
     614:	4a04085b 	bmi	0x102788
     618:	bf006013 	svclt	0x00006013
     61c:	46bd3708 	ldrtmi	r3, [sp], r8, lsl #14
     620:	bf00bd80 	svclt	0x0000bd80
     624:	400fe000 	andmi	lr, pc, r0
     628:	20000000 	andcs	r0, r0, r0
     62c:	17d78400 	ldrbne	r8, [r7, r0, lsl #8]
     630:	b083b480 	addlt	fp, r3, r0, lsl #9
     634:	4b28af00 	blmi	0xa2c23c
     638:	3088f8d3 	ldrdcc	pc, [r8], r3
     63c:	f4434a26 	vst1.8	{d20-d21}, [r3 :128], r6
     640:	f8c20370 			; <UNDEFINED> instruction: 0xf8c20370
     644:	4b253088 	blmi	0x94c86c
     648:	671a4a25 	ldrvs	r4, [sl, -r5, lsr #20]
     64c:	4a254b23 	bmi	0x9532e0
     650:	4b22661a 	blmi	0x899ec0
     654:	661a4a24 	ldrvs	r4, [sl], -r4, lsr #20
     658:	4a244b20 	bmi	0x9132e0
     65c:	2300671a 	movwcs	r6, #1818	; 0x71a
     660:	e002607b 	and	r6, r2, fp, ror r0
     664:	3301687b 	movwcc	r6, #6267	; 0x187b
     668:	687b607b 	ldmdavs	fp!, {r0, r1, r3, r4, r5, r6, sp, lr}^
     66c:	7f7af5b3 	svcvc	0x007af5b3
     670:	4b1ad3f8 	blmi	0x6b5658
     674:	661a4a1e 			; <UNDEFINED> instruction: 0x661a4a1e
     678:	4a1e4b18 	bmi	0x7932e0
     67c:	2300671a 	movwcs	r6, #1818	; 0x71a
     680:	e002607b 	and	r6, r2, fp, ror r0
     684:	3301687b 	movwcc	r6, #6267	; 0x187b
     688:	687b607b 	ldmdavs	fp!, {r0, r1, r3, r4, r5, r6, sp, lr}^
     68c:	7f7af5b3 	svcvc	0x007af5b3
     690:	4b12d3f8 	blmi	0x4b5678
     694:	661a4a18 			; <UNDEFINED> instruction: 0x661a4a18
     698:	4b10bf00 	blmi	0x4302a0
     69c:	f0036d1b 			; <UNDEFINED> instruction: 0xf0036d1b
     6a0:	2b400340 	blcs	0x10013a8
     6a4:	4b0dd1f9 	blmi	0x374e90
     6a8:	661a4a14 			; <UNDEFINED> instruction: 0x661a4a14
     6ac:	f04f4b0b 			; <UNDEFINED> instruction: 0xf04f4b0b
     6b0:	671a72c0 	ldrvs	r7, [sl, -r0, asr #5]
     6b4:	607b2300 	rsbsvs	r2, fp, r0, lsl #6
     6b8:	687be002 	ldmdavs	fp!, {r1, sp, lr, pc}^
     6bc:	607b3301 	rsbsvs	r3, fp, r1, lsl #6
     6c0:	f242687b 	vtst.8	q11, q1, <illegal reg q13.5>
     6c4:	4293720f 	addsmi	r7, r3, #-268435456	; 0xf0000000
     6c8:	bf00d9f7 	svclt	0x0000d9f7
     6cc:	46bd370c 	ldrtmi	r3, [sp], ip, lsl #14
     6d0:	7b04f85d 	blvc	0x13e84c
     6d4:	bf004770 	svclt	0x00004770
     6d8:	e000ed00 	and	lr, r0, r0, lsl #26
     6dc:	400fe000 	andmi	lr, pc, r0
     6e0:	07802810 	usada8eq	r0, r0, r8, r2
     6e4:	078e3ad1 			; <UNDEFINED> instruction: 0x078e3ad1
     6e8:	019e2d42 	orrseq	r2, lr, r2, asr #26
     6ec:	01802800 	orreq	r2, r0, r0, lsl #16
     6f0:	019e0d42 	orrseq	r0, lr, r2, asr #26
     6f4:	01800800 	orreq	r0, r0, r0, lsl #16
     6f8:	01de0d42 	bicseq	r0, lr, r2, asr #26
     6fc:	01de0542 	bicseq	r0, lr, r2, asr #10
     700:	b084b580 	addlt	fp, r4, r0, lsl #11
     704:	481baf02 	ldmdami	fp, {r1, r8, r9, sl, fp, sp, pc}
     708:	ffaaf000 			; <UNDEFINED> instruction: 0xffaaf000
     70c:	681b4b1a 	ldmdavs	fp, {r1, r3, r4, r8, r9, fp, lr}
     710:	f4434a19 	vst1.8	{d20-d21}, [r3 :64], r9
     714:	6013037f 	andsvs	r0, r3, pc, ror r3
     718:	f92ef000 			; <UNDEFINED> instruction: 0xf92ef000
     71c:	71fb4603 	mvnsvc	r4, r3, lsl #12
     720:	2b0179fb 	blcs	0x5ef14
     724:	79fbd101 	ldmibvc	fp!, {r0, r8, ip, lr, pc}^
     728:	2220e01f 	eorcs	lr, r0, #31
     72c:	48144913 	ldmdami	r4, {r0, r1, r4, r8, fp, lr}
     730:	f93ef000 			; <UNDEFINED> instruction: 0xf93ef000
     734:	71bb4603 			; <UNDEFINED> instruction: 0x71bb4603
     738:	2b0179bb 	blcs	0x5ee2c
     73c:	79bbd101 	ldmibvc	fp!, {r0, r8, ip, lr, pc}
     740:	4b10e013 	blmi	0x438794
     744:	23a09301 	movcs	r9, #67108864	; 0x4000000
     748:	4b0f9300 	blmi	0x3e5350
     74c:	490f2200 	stmdbmi	pc, {r9, sp}	; <UNPREDICTABLE>
     750:	f000480f 			; <UNDEFINED> instruction: 0xf000480f
     754:	4603f981 	strmi	pc, [r3], -r1, lsl #19
     758:	4b0e717b 	blmi	0x39cd4c
     75c:	601a4a0c 	andsvs	r4, sl, ip, lsl #20
     760:	2b01797b 	blcs	0x5ed54
     764:	797bd101 	ldmdbvc	fp!, {r0, r8, ip, lr, pc}^
     768:	4618e7ff 			; <UNDEFINED> instruction: 0x4618e7ff
     76c:	46bd3708 	ldrtmi	r3, [sp], r8, lsl #14
     770:	bf00bd80 	svclt	0x0000bd80
     774:	0000173c 	andeq	r1, r0, ip, lsr r7
     778:	e000ed20 	and	lr, r0, r0, lsr #26
     77c:	00001750 	andeq	r1, r0, r0, asr r7
     780:	200001b8 			; <UNDEFINED> instruction: 0x200001b8
     784:	000007d1 	ldrdeq	r0, [r0], -r1
     788:	200001e4 	andcs	r0, r0, r4, ror #3
     78c:	0000175c 	andeq	r1, r0, ip, asr r7
     790:	20000284 	andcs	r0, r0, r4, lsl #5
     794:	200002c4 	andcs	r0, r0, r4, asr #5
     798:	af00b580 	svcge	0x0000b580
     79c:	f0004802 			; <UNDEFINED> instruction: 0xf0004802
     7a0:	bf00ff5f 	svclt	0x0000ff5f
     7a4:	bf00bd80 	svclt	0x0000bd80
     7a8:	00001768 	andeq	r1, r0, r8, ror #14
     7ac:	af00b580 	svcge	0x0000b580
     7b0:	f0004806 			; <UNDEFINED> instruction: 0xf0004806
     7b4:	f000ff55 			; <UNDEFINED> instruction: 0xf000ff55
     7b8:	f000fad5 			; <UNDEFINED> instruction: 0xf000fad5
     7bc:	f000fae7 			; <UNDEFINED> instruction: 0xf000fae7
     7c0:	f000f823 			; <UNDEFINED> instruction: 0xf000f823
     7c4:	bf00faeb 	svclt	0x0000faeb
     7c8:	bd804618 	stclt	6, cr4, [r0, #96]	; 0x60
     7cc:	00001778 	andeq	r1, r0, r8, ror r7
     7d0:	af00b580 	svcge	0x0000b580
     7d4:	ffe0f7ff 			; <UNDEFINED> instruction: 0xffe0f7ff
     7d8:	b480e7fc 	strlt	lr, [r0], #2044	; 0x7fc
     7dc:	bf00af00 	svclt	0x0000af00
     7e0:	46bd4618 	ssatmi	r4, #30, r8, lsl #12
     7e4:	7b04f85d 	blvc	0x13e960
     7e8:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     7ec:	af00b083 	svcge	0x0000b083
     7f0:	4b046078 	blmi	0x1189d8
     7f4:	46186a5b 			; <UNDEFINED> instruction: 0x46186a5b
     7f8:	46bd370c 	ldrtmi	r3, [sp], ip, lsl #14
     7fc:	7b04f85d 	blvc	0x13e978
     800:	bf004770 	svclt	0x00004770
     804:	200001b8 			; <UNDEFINED> instruction: 0x200001b8
     808:	af00b580 	svcge	0x0000b580
     80c:	f0004810 			; <UNDEFINED> instruction: 0xf0004810
     810:	4810ff27 	ldmdami	r0, {r0, r1, r2, r5, r8, r9, sl, fp, ip, sp, lr, pc}
     814:	f915f000 			; <UNDEFINED> instruction: 0xf915f000
     818:	2b004603 	blcs	0x1202c
     81c:	4b0ed103 	blmi	0x3b4c30
     820:	601a4a0e 	andsvs	r4, sl, lr, lsl #20
     824:	4b0ce002 	blmi	0x338834
     828:	601a4a0c 	andsvs	r4, sl, ip, lsl #20
     82c:	f04f4b0c 			; <UNDEFINED> instruction: 0xf04f4b0c
     830:	601a5280 	andsvs	r5, sl, r0, lsl #5
     834:	681a4b08 	ldmdavs	sl, {r3, r8, r9, fp, lr}
     838:	681b4b0a 	ldmdavs	fp, {r1, r3, r8, r9, fp, lr}
     83c:	d003429a 	mulle	r3, sl, r2
     840:	f04f4b07 			; <UNDEFINED> instruction: 0xf04f4b07
     844:	601a5280 	andsvs	r5, sl, r0, lsl #5
     848:	4618bf00 	ldrmi	fp, [r8], -r0, lsl #30
     84c:	bf00bd80 	svclt	0x0000bd80
     850:	0000178c 	andeq	r1, r0, ip, lsl #15
     854:	200001b8 			; <UNDEFINED> instruction: 0x200001b8
     858:	200002c0 	andcs	r0, r0, r0, asr #5
     85c:	20000284 	andcs	r0, r0, r4, lsl #5
     860:	e000ed04 	and	lr, r0, r4, lsl #26
     864:	200002c4 	andcs	r0, r0, r4, asr #5
     868:	b083b480 	addlt	fp, r3, r0, lsl #9
     86c:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
     870:	687a687b 	ldmdavs	sl!, {r0, r1, r3, r4, r5, r6, fp, sp, lr}^
     874:	687b601a 	ldmdavs	fp!, {r1, r3, r4, sp, lr}^
     878:	605a687a 	subsvs	r6, sl, sl, ror r8
     87c:	4618bf00 	ldrmi	fp, [r8], -r0, lsl #30
     880:	46bd370c 	ldrtmi	r3, [sp], ip, lsl #14
     884:	7b04f85d 	blvc	0x13ea00
     888:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     88c:	af00b083 	svcge	0x0000b083
     890:	687b6078 	ldmdavs	fp!, {r3, r4, r5, r6, sp, lr}^
     894:	687a681b 	ldmdavs	sl!, {r0, r1, r3, r4, fp, sp, lr}^
     898:	bf0c429a 	svclt	0x000c429a
     89c:	23002301 	movwcs	r2, #769	; 0x301
     8a0:	4618b2db 			; <UNDEFINED> instruction: 0x4618b2db
     8a4:	46bd370c 	ldrtmi	r3, [sp], ip, lsl #14
     8a8:	7b04f85d 	blvc	0x13ea24
     8ac:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     8b0:	af00b083 	svcge	0x0000b083
     8b4:	60396078 	eorsvs	r6, r9, r8, ror r0
     8b8:	685a687b 	ldmdavs	sl, {r0, r1, r3, r4, r5, r6, fp, sp, lr}^
     8bc:	605a683b 	subsvs	r6, sl, fp, lsr r8
     8c0:	687a683b 	ldmdavs	sl!, {r0, r1, r3, r4, r5, fp, sp, lr}^
     8c4:	687b601a 	ldmdavs	fp!, {r1, r3, r4, sp, lr}^
     8c8:	683a685b 	ldmdavs	sl!, {r0, r1, r3, r4, r6, fp, sp, lr}
     8cc:	687b601a 	ldmdavs	fp!, {r1, r3, r4, sp, lr}^
     8d0:	605a683a 	subsvs	r6, sl, sl, lsr r8
     8d4:	4618bf00 	ldrmi	fp, [r8], -r0, lsl #30
     8d8:	46bd370c 	ldrtmi	r3, [sp], ip, lsl #14
     8dc:	7b04f85d 	blvc	0x13ea58
     8e0:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     8e4:	af00b083 	svcge	0x0000b083
     8e8:	60396078 	eorsvs	r6, r9, r8, ror r0
     8ec:	687a683b 	ldmdavs	sl!, {r0, r1, r3, r4, r5, fp, sp, lr}^
     8f0:	687b605a 	ldmdavs	fp!, {r1, r3, r4, r6, sp, lr}^
     8f4:	683b681a 	ldmdavs	fp!, {r1, r3, r4, fp, sp, lr}
     8f8:	687b601a 	ldmdavs	fp!, {r1, r3, r4, sp, lr}^
     8fc:	683a681b 	ldmdavs	sl!, {r0, r1, r3, r4, fp, sp, lr}
     900:	687b605a 	ldmdavs	fp!, {r1, r3, r4, r6, sp, lr}^
     904:	601a683a 	andsvs	r6, sl, sl, lsr r8
     908:	4618bf00 	ldrmi	fp, [r8], -r0, lsl #30
     90c:	46bd370c 	ldrtmi	r3, [sp], ip, lsl #14
     910:	7b04f85d 	blvc	0x13ea8c
     914:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     918:	af00b083 	svcge	0x0000b083
     91c:	687b6078 	ldmdavs	fp!, {r3, r4, r5, r6, sp, lr}^
     920:	687a685b 	ldmdavs	sl!, {r0, r1, r3, r4, r6, fp, sp, lr}^
     924:	601a6812 	andsvs	r6, sl, r2, lsl r8
     928:	681b687b 	ldmdavs	fp, {r0, r1, r3, r4, r5, r6, fp, sp, lr}
     92c:	6852687a 	ldmdavs	r2, {r1, r3, r4, r5, r6, fp, sp, lr}^
     930:	bf00605a 	svclt	0x0000605a
     934:	370c4618 	smladcc	ip, r8, r6, r4
     938:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     93c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     940:	b083b480 	addlt	fp, r3, r0, lsl #9
     944:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
     948:	685b687b 	ldmdavs	fp, {r0, r1, r3, r4, r5, r6, fp, sp, lr}^
     94c:	6812687a 	ldmdavs	r2, {r1, r3, r4, r5, r6, fp, sp, lr}
     950:	687b601a 	ldmdavs	fp!, {r1, r3, r4, sp, lr}^
     954:	687a681b 	ldmdavs	sl!, {r0, r1, r3, r4, fp, sp, lr}^
     958:	605a6852 	subsvs	r6, sl, r2, asr r8
     95c:	687a687b 	ldmdavs	sl!, {r0, r1, r3, r4, r5, r6, fp, sp, lr}^
     960:	687b605a 	ldmdavs	fp!, {r1, r3, r4, r6, sp, lr}^
     964:	687b685a 	ldmdavs	fp!, {r1, r3, r4, r6, fp, sp, lr}^
     968:	bf00601a 	svclt	0x0000601a
     96c:	370c4618 	smladcc	ip, r8, r6, r4
     970:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     974:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     978:	b084b580 	addlt	fp, r4, r0, lsl #11
     97c:	1d3baf00 	ldcne	15, cr10, [fp, #-0]
     980:	f7ff4618 			; <UNDEFINED> instruction: 0xf7ff4618
     984:	4603ff71 			; <UNDEFINED> instruction: 0x4603ff71
     988:	7bfb73fb 	blvc	0xffedd97c
     98c:	d1012b01 	tstle	r1, r1, lsl #22
     990:	e0067bfb 	strd	r7, [r6], -fp
     994:	461a4b05 	ldrmi	r4, [sl], -r5, lsl #22
     998:	e8931d3b 	ldm	r3, {r0, r1, r3, r4, r5, r8, sl, fp, ip}
     99c:	e8820003 	stm	r2, {r0, r1}
     9a0:	46180003 	ldrmi	r0, [r8], -r3
     9a4:	46bd3710 	ssatmi	r3, #30, r0, lsl #14
     9a8:	bf00bd80 	svclt	0x0000bd80
     9ac:	200002b8 			; <UNDEFINED> instruction: 0x200002b8
     9b0:	b089b590 	umulllt	fp, r9, r0, r5
     9b4:	60f8af00 	rscsvs	sl, r8, r0, lsl #30
     9b8:	607a60b9 	ldrhtvs	r6, [sl], #-9
     9bc:	f000480f 			; <UNDEFINED> instruction: 0xf000480f
     9c0:	68b8fe4f 	ldmvs	r8!, {r0, r1, r2, r3, r6, r9, sl, fp, ip, sp, lr, pc}
     9c4:	fe4cf000 	cdp2	0, 4, cr15, cr12, cr0, {0}
     9c8:	f000480d 			; <UNDEFINED> instruction: 0xf000480d
     9cc:	687bfe49 	ldmdavs	fp!, {r0, r3, r6, r9, sl, fp, ip, sp, lr, pc}^
     9d0:	d1012b00 	tstle	r1, r0, lsl #22
     9d4:	e00d2301 	and	r2, sp, r1, lsl #6
     9d8:	61bb68bb 			; <UNDEFINED> instruction: 0x61bb68bb
     9dc:	773b2304 	ldrvc	r2, [fp, -r4, lsl #6]!
     9e0:	461c68fb 			; <UNDEFINED> instruction: 0x461c68fb
     9e4:	0310f107 	tsteq	r0, #-1073741823	; 0xc0000001	; <UNPREDICTABLE>
     9e8:	e884cb0f 	stm	r4, {r0, r1, r2, r3, r8, r9, fp, lr, pc}
     9ec:	68fb000f 	ldmvs	fp!, {r0, r1, r2, r3}^
     9f0:	611a687a 	tstvs	sl, sl, ror r8
     9f4:	37244618 			; <UNDEFINED> instruction: 0x37244618
     9f8:	bd9046bd 	ldclt	6, cr4, [r0, #756]	; 0x2f4
     9fc:	000017a4 	andeq	r1, r0, r4, lsr #15
     a00:	000017bc 			; <UNDEFINED> instruction: 0x000017bc
     a04:	b083b480 	addlt	fp, r3, r0, lsl #9
     a08:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
     a0c:	687b6039 	ldmdavs	fp!, {r0, r3, r4, r5, sp, lr}^
     a10:	625a683a 	subsvs	r6, sl, #3801088	; 0x3a0000
     a14:	4618bf00 	ldrmi	fp, [r8], -r0, lsl #30
     a18:	46bd370c 	ldrtmi	r3, [sp], ip, lsl #14
     a1c:	7b04f85d 	blvc	0x13eb98
     a20:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     a24:	bf00af00 	svclt	0x0000af00
     a28:	46bd4618 	ssatmi	r4, #30, r8, lsl #12
     a2c:	7b04f85d 	blvc	0x13eba8
     a30:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     a34:	bf00af00 	svclt	0x0000af00
     a38:	46bd4618 	ssatmi	r4, #30, r8, lsl #12
     a3c:	7b04f85d 	blvc	0x13ebb8
     a40:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     a44:	af00b083 	svcge	0x0000b083
     a48:	23006078 	movwcs	r6, #120	; 0x78
     a4c:	370c4618 	smladcc	ip, r8, r6, r4
     a50:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     a54:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     a58:	b088b580 	addlt	fp, r8, r0, lsl #11
     a5c:	60f8af00 	rscsvs	sl, r8, r0, lsl #30
     a60:	607a60b9 	ldrhtvs	r6, [sl], #-9
     a64:	485a603b 	ldmdami	sl, {r0, r1, r3, r4, r5, sp, lr}^
     a68:	fdfaf000 	ldc2l	0, cr15, [sl]
     a6c:	f00068b8 			; <UNDEFINED> instruction: 0xf00068b8
     a70:	4858fdf7 	ldmdami	r8, {r0, r1, r2, r4, r5, r6, r7, r8, sl, fp, ip, sp, lr, pc}^
     a74:	fdf4f000 	ldc2l	0, cr15, [r4]
     a78:	6abb683a 	bvs	0xfeedab68
     a7c:	f0234413 			; <UNDEFINED> instruction: 0xf0234413
     a80:	61fb0307 	mvnsvs	r0, r7, lsl #6
     a84:	3b0469fb 	blcc	0x11b278
     a88:	69fb61fb 	ldmibvs	fp!, {r0, r1, r3, r4, r5, r6, r7, r8, sp, lr}^
     a8c:	7280f04f 	addvc	pc, r0, #79	; 0x4f
     a90:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     a94:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     a98:	69fb6afa 	ldmibvs	fp!, {r1, r3, r4, r5, r6, r7, r9, fp, sp, lr}^
     a9c:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     aa0:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     aa4:	220e69fb 	andcs	r6, lr, #4112384	; 0x3ec000
     aa8:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     aac:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     ab0:	220c69fb 	andcs	r6, ip, #4112384	; 0x3ec000
     ab4:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     ab8:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     abc:	220369fb 	andcs	r6, r3, #4112384	; 0x3ec000
     ac0:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     ac4:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     ac8:	220269fb 	andcs	r6, r2, #4112384	; 0x3ec000
     acc:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     ad0:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     ad4:	220169fb 	andcs	r6, r1, #4112384	; 0x3ec000
     ad8:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     adc:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     ae0:	220069fb 	andcs	r6, r0, #4112384	; 0x3ec000
     ae4:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     ae8:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     aec:	220b69fb 	andcs	r6, fp, #4112384	; 0x3ec000
     af0:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     af4:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     af8:	220a69fb 	andcs	r6, sl, #4112384	; 0x3ec000
     afc:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     b00:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     b04:	220969fb 	andcs	r6, r9, #4112384	; 0x3ec000
     b08:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     b0c:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     b10:	220869fb 	andcs	r6, r8, #4112384	; 0x3ec000
     b14:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     b18:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     b1c:	220769fb 	andcs	r6, r7, #4112384	; 0x3ec000
     b20:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     b24:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     b28:	220669fb 	andcs	r6, r6, #4112384	; 0x3ec000
     b2c:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     b30:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     b34:	220569fb 	andcs	r6, r5, #4112384	; 0x3ec000
     b38:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     b3c:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     b40:	220469fb 	andcs	r6, r4, #4112384	; 0x3ec000
     b44:	68fb601a 	ldmvs	fp!, {r1, r3, r4, sp, lr}^
     b48:	601a69fa 			; <UNDEFINED> instruction: 0x601a69fa
     b4c:	3b01683b 	blcc	0x5ac40
     b50:	0307f023 	movweq	pc, #28707	; 0x7023	; <UNPREDICTABLE>
     b54:	61bb3308 			; <UNDEFINED> instruction: 0x61bb3308
     b58:	3b0469fb 	blcc	0x11b34c
     b5c:	e00561fb 	strd	r6, [r5], -fp
     b60:	4a1d69fb 	bmi	0x75b354
     b64:	69fb601a 	ldmibvs	fp!, {r1, r3, r4, sp, lr}^
     b68:	61fb3b04 	mvnsvs	r3, r4, lsl #22
     b6c:	69bb69fa 	ldmibvs	fp!, {r1, r3, r4, r5, r6, r7, r8, fp, sp, lr}
     b70:	d2f5429a 	rscsle	r4, r5, #-1610612727	; 0xa0000009
     b74:	220168fb 	andcs	r6, r1, #16449536	; 0xfb0000
     b78:	68fb60da 	ldmvs	fp!, {r1, r3, r4, r6, r7, sp, lr}^
     b7c:	619a68ba 			; <UNDEFINED> instruction: 0x619a68ba
     b80:	687a68fb 	ldmdavs	sl!, {r0, r1, r3, r4, r5, r6, r7, fp, sp, lr}^
     b84:	687b629a 	ldmdavs	fp!, {r1, r3, r4, r7, r9, sp, lr}^
     b88:	d0032b00 	andle	r2, r3, r0, lsl #22
     b8c:	220268fb 	andcs	r6, r2, #16449536	; 0xfb0000
     b90:	2020f883 	eorcs	pc, r0, r3, lsl #17
     b94:	481168f9 	ldmdami	r1, {r0, r3, r4, r5, r6, r7, fp, sp, lr}
     b98:	ff34f7ff 			; <UNDEFINED> instruction: 0xff34f7ff
     b9c:	75fb4603 	ldrbvc	r4, [fp, #1539]!	; 0x603
     ba0:	f000480f 			; <UNDEFINED> instruction: 0xf000480f
     ba4:	68fbfd5d 	ldmvs	fp!, {r0, r2, r3, r4, r6, r8, sl, fp, ip, sp, lr, pc}^
     ba8:	4618699b 			; <UNDEFINED> instruction: 0x4618699b
     bac:	fd58f000 	ldc2l	0, cr15, [r8, #-0]
     bb0:	f000480c 			; <UNDEFINED> instruction: 0xf000480c
     bb4:	4b09fd55 	blmi	0x280110
     bb8:	4618689b 			; <UNDEFINED> instruction: 0x4618689b
     bbc:	fd50f000 	ldc2l	0, cr15, [r0, #-0]
     bc0:	f0004809 			; <UNDEFINED> instruction: 0xf0004809
     bc4:	bf00fd4d 	svclt	0x0000fd4d
     bc8:	37204618 			; <UNDEFINED> instruction: 0x37204618
     bcc:	bd8046bd 	stclt	6, cr4, [r0, #756]	; 0x2f4
     bd0:	000017c0 	andeq	r1, r0, r0, asr #15
     bd4:	000017d8 	ldrdeq	r1, [r0], -r8
     bd8:	deadbeef 	cdple	14, 10, cr11, cr13, cr15, {7}
     bdc:	200001b8 			; <UNDEFINED> instruction: 0x200001b8
     be0:	000017dc 	ldrdeq	r1, [r0], -ip
     be4:	000017ec 	andeq	r1, r0, ip, ror #15
     be8:	00001800 	andeq	r1, r0, r0, lsl #16
     bec:	af00b580 	svcge	0x0000b580
     bf0:	f0004823 			; <UNDEFINED> instruction: 0xf0004823
     bf4:	4b23fd35 	blmi	0x9000d0
     bf8:	699b681b 	ldmibvs	fp, {r0, r1, r3, r4, fp, sp, lr}
     bfc:	f0004618 			; <UNDEFINED> instruction: 0xf0004618
     c00:	4821fd2f 	stmdami	r1!, {r0, r1, r2, r3, r5, r8, sl, fp, ip, sp, lr, pc}
     c04:	fd2cf000 	stc2	0, cr15, [ip, #-0]
     c08:	22004b20 	andcs	r4, r0, #32, 22	; 0x8000
     c0c:	4b1f601a 	blmi	0x7d8c7c
     c10:	2b00681b 	blcs	0x1ac84
     c14:	481ed102 	ldmdami	lr, {r1, r8, ip, lr, pc}
     c18:	fd22f000 	stc2	0, cr15, [r2, #-0]
     c1c:	681b4b19 	ldmdavs	fp, {r0, r3, r4, r8, r9, fp, lr}
     c20:	d1022b00 	tstle	r2, r0, lsl #22
     c24:	f000481b 			; <UNDEFINED> instruction: 0xf000481b
     c28:	b672fd1b 			; <UNDEFINED> instruction: 0xb672fd1b
     c2c:	68094917 	stmdavs	r9, {r0, r1, r2, r4, r8, fp, lr}
     c30:	4b16b159 	blmi	0x5ad19c
     c34:	699b681b 	ldmibvs	fp, {r0, r1, r3, r4, fp, sp, lr}
     c38:	f0004618 			; <UNDEFINED> instruction: 0xf0004618
     c3c:	e92dfd11 	push	{r0, r4, r8, sl, fp, ip, sp, lr, pc}
     c40:	49120ff0 	ldmdbmi	r2, {r4, r5, r6, r7, r8, r9, sl, fp}
     c44:	f8c16809 			; <UNDEFINED> instruction: 0xf8c16809
     c48:	490ed000 	stmdbmi	lr, {ip, lr, pc}
     c4c:	f8d16809 			; <UNDEFINED> instruction: 0xf8d16809
     c50:	4b0cd000 	blmi	0x334c58
     c54:	699b681b 	ldmibvs	fp, {r0, r1, r3, r4, fp, sp, lr}
     c58:	f0004618 			; <UNDEFINED> instruction: 0xf0004618
     c5c:	4909fd01 	stmdbmi	r9, {r0, r8, sl, fp, ip, sp, lr, pc}
     c60:	4a0a6809 	bmi	0x29ac8c
     c64:	e8bd6011 	pop	{r0, r4, sp, lr}
     c68:	b6620ff0 	uqsub8lt	r0, r2, r0
     c6c:	f0004670 			; <UNDEFINED> instruction: 0xf0004670
     c70:	4770fcf7 			; <UNDEFINED> instruction: 0x4770fcf7
     c74:	f0004808 			; <UNDEFINED> instruction: 0xf0004808
     c78:	bf00fcf3 	svclt	0x0000fcf3
     c7c:	bd804618 	stclt	6, cr4, [r0, #96]	; 0x60
     c80:	00001808 	andeq	r1, r0, r8, lsl #16
     c84:	200002c0 	andcs	r0, r0, r0, asr #5
     c88:	00001800 	andeq	r1, r0, r0, lsl #16
     c8c:	200002c4 	andcs	r0, r0, r4, asr #5
     c90:	00001824 	andeq	r1, r0, r4, lsr #16
     c94:	00001844 	andeq	r1, r0, r4, asr #16
     c98:	00001860 	andeq	r1, r0, r0, ror #16
     c9c:	af00b480 	svcge	0x0000b480
     ca0:	4618bf00 	ldrmi	fp, [r8], -r0, lsl #30
     ca4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     ca8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     cac:	b083b480 	addlt	fp, r3, r0, lsl #9
     cb0:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
     cb4:	687b4a04 	ldmdavs	fp!, {r2, r9, fp, lr}^
     cb8:	bf006013 	svclt	0x00006013
     cbc:	370c4618 	smladcc	ip, r8, r6, r4
     cc0:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     cc4:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     cc8:	200002c4 	andcs	r0, r0, r4, asr #5
     ccc:	b083b480 	addlt	fp, r3, r0, lsl #9
     cd0:	4603af00 	strmi	sl, [r3], -r0, lsl #30
     cd4:	80fb6039 	rscshi	r6, fp, r9, lsr r0
     cd8:	3006f9b7 			; <UNDEFINED> instruction: 0x3006f9b7
     cdc:	db0a2b00 	blle	0x28b8e4
     ce0:	b2da683b 	sbcslt	r6, sl, #3866624	; 0x3b0000
     ce4:	f9b7490c 			; <UNDEFINED> instruction: 0xf9b7490c
     ce8:	01523006 	cmpeq	r2, r6
     cec:	440bb2d2 	strmi	fp, [fp], #-722	; 0xfffffd2e
     cf0:	2300f883 	movwcs	pc, #2179	; 0x883	; <UNPREDICTABLE>
     cf4:	683be00a 	ldmdavs	fp!, {r1, r3, sp, lr, pc}
     cf8:	4908b2da 	stmdbmi	r8, {r1, r3, r4, r6, r7, r9, ip, sp, pc}
     cfc:	f00388fb 			; <UNDEFINED> instruction: 0xf00388fb
     d00:	3b04030f 	blcc	0x101944
     d04:	b2d20152 	sbcslt	r0, r2, #-2147483628	; 0x80000014
     d08:	761a440b 	ldrvc	r4, [sl], -fp, lsl #8
     d0c:	370cbf00 	strcc	fp, [ip, -r0, lsl #30]
     d10:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     d14:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     d18:	e000e100 	and	lr, r0, r0, lsl #2
     d1c:	e000ed00 	and	lr, r0, r0, lsl #26
     d20:	b082b580 	addlt	fp, r2, r0, lsl #11
     d24:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
     d28:	3b01687b 	blcc	0x5af1c
     d2c:	7f80f1b3 	svcvc	0x0080f1b3
     d30:	2301d301 	movwcs	sp, #4865	; 0x1301
     d34:	4a0ae00f 	bmi	0x2b8d78
     d38:	3b01687b 	blcc	0x5af2c
     d3c:	21076053 	qaddcs	r6, r3, r7
     d40:	30fff04f 	rscscc	pc, pc, pc, asr #32
     d44:	ffc2f7ff 			; <UNDEFINED> instruction: 0xffc2f7ff
     d48:	22004b05 	andcs	r4, r0, #5120	; 0x1400
     d4c:	4b04609a 	blmi	0x118fbc
     d50:	601a2207 	andsvs	r2, sl, r7, lsl #4
     d54:	46182300 	ldrmi	r2, [r8], -r0, lsl #6
     d58:	46bd3708 	ldrtmi	r3, [sp], r8, lsl #14
     d5c:	bf00bd80 	svclt	0x0000bd80
     d60:	e000e010 	and	lr, r0, r0, lsl r0
     d64:	af00b580 	svcge	0x0000b580
     d68:	fbd6f7ff 	blx	0xff5bed6e
     d6c:	681b4b06 	ldmdavs	fp, {r1, r2, r8, r9, fp, lr}
     d70:	f7ff4618 			; <UNDEFINED> instruction: 0xf7ff4618
     d74:	2100ffd5 	ldrdcs	pc, [r0, -r5]
     d78:	30fff04f 	rscscc	pc, pc, pc, asr #32
     d7c:	ffa6f7ff 			; <UNDEFINED> instruction: 0xffa6f7ff
     d80:	f80cf000 			; <UNDEFINED> instruction: 0xf80cf000
     d84:	bd80bf00 	stclt	15, cr11, [r0]
     d88:	20000000 	andcs	r0, r0, r0
     d8c:	af00b480 	svcge	0x0000b480
     d90:	bf00b672 	svclt	0x0000b672
     d94:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     d98:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     d9c:	af00b480 	svcge	0x0000b480
     da0:	bf00b662 	svclt	0x0000b662
     da4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     da8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     dac:	b083b480 	addlt	fp, r3, r0, lsl #9
     db0:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
     db4:	681b4b07 	ldmdavs	fp, {r0, r1, r2, r8, r9, fp, lr}
     db8:	601a687a 	andsvs	r6, sl, sl, ror r8
     dbc:	4b05bf00 	blmi	0x1709c4
     dc0:	681b681b 	ldmdavs	fp, {r0, r1, r3, r4, fp, sp, lr}
     dc4:	dcfa2b00 	vldmiale	sl!, {d18-d17}
     dc8:	370cbf00 	strcc	fp, [ip, -r0, lsl #30]
     dcc:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     dd0:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     dd4:	20000004 	andcs	r0, r0, r4
     dd8:	b083b480 	addlt	fp, r3, r0, lsl #9
     ddc:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
     de0:	370cbf00 	strcc	fp, [ip, -r0, lsl #30]
     de4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     de8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     dec:	af00b580 	svcge	0x0000b580
     df0:	f8d34b0e 			; <UNDEFINED> instruction: 0xf8d34b0e
     df4:	4a0d3608 	bmi	0x34e61c
     df8:	0320f043 	nopeq	{67}	; 0x43
     dfc:	3608f8c2 	strcc	pc, [r8], -r2, asr #17
     e00:	220e4b0b 	andcs	r4, lr, #11264	; 0x2c00
     e04:	2400f8c3 	strcs	pc, [r0], #-2243	; 0xfffff73d
     e08:	220e4b09 	andcs	r4, lr, #9216	; 0x2400
     e0c:	251cf8c3 	ldrcs	pc, [ip, #-2243]	; 0xfffff73d
     e10:	f8d34b07 			; <UNDEFINED> instruction: 0xf8d34b07
     e14:	4a0633fc 	bmi	0x18de0c
     e18:	030ef023 	movweq	pc, #57379	; 0xe023	; <UNPREDICTABLE>
     e1c:	33fcf8c2 	mvnscc	pc, #12713984	; 0xc20000
     e20:	fbdcf000 	blx	0xff73ce2a
     e24:	ffb2f7ff 			; <UNDEFINED> instruction: 0xffb2f7ff
     e28:	bd80bf00 	stclt	15, cr11, [r0]
     e2c:	400fe000 	andmi	lr, pc, r0
     e30:	40025000 	andmi	r5, r2, r0
     e34:	af00b480 	svcge	0x0000b480
     e38:	22024b04 	andcs	r4, r2, #4, 22	; 0x1000
     e3c:	23fcf8c3 	mvnscs	pc, #12779520	; 0xc30000
     e40:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     e44:	7b04f85d 	blvc	0x13efc0
     e48:	bf004770 	svclt	0x00004770
     e4c:	40025000 	andmi	r5, r2, r0
     e50:	af00b480 	svcge	0x0000b480
     e54:	22084b04 	andcs	r4, r8, #4, 22	; 0x1000
     e58:	23fcf8c3 	mvnscs	pc, #12779520	; 0xc30000
     e5c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     e60:	7b04f85d 	blvc	0x13efdc
     e64:	bf004770 	svclt	0x00004770
     e68:	40025000 	andmi	r5, r2, r0
     e6c:	af00b480 	svcge	0x0000b480
     e70:	22044b04 	andcs	r4, r4, #4, 22	; 0x1000
     e74:	23fcf8c3 	mvnscs	pc, #12779520	; 0xc30000
     e78:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     e7c:	7b04f85d 	blvc	0x13eff8
     e80:	bf004770 	svclt	0x00004770
     e84:	40025000 	andmi	r5, r2, r0
     e88:	af00b480 	svcge	0x0000b480
     e8c:	f8d34b06 			; <UNDEFINED> instruction: 0xf8d34b06
     e90:	4a0533fc 	bmi	0x14de88
     e94:	0302f023 	movweq	pc, #8227	; 0x2023	; <UNPREDICTABLE>
     e98:	33fcf8c2 	mvnscc	pc, #12713984	; 0xc20000
     e9c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     ea0:	7b04f85d 	blvc	0x13f01c
     ea4:	bf004770 	svclt	0x00004770
     ea8:	40025000 	andmi	r5, r2, r0
     eac:	af00b480 	svcge	0x0000b480
     eb0:	f8d34b06 			; <UNDEFINED> instruction: 0xf8d34b06
     eb4:	4a0533fc 	bmi	0x14deac
     eb8:	0308f023 	movweq	pc, #32803	; 0x8023	; <UNPREDICTABLE>
     ebc:	33fcf8c2 	mvnscc	pc, #12713984	; 0xc20000
     ec0:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     ec4:	7b04f85d 	blvc	0x13f040
     ec8:	bf004770 	svclt	0x00004770
     ecc:	40025000 	andmi	r5, r2, r0
     ed0:	af00b480 	svcge	0x0000b480
     ed4:	f8d34b06 			; <UNDEFINED> instruction: 0xf8d34b06
     ed8:	4a0533fc 	bmi	0x14ded0
     edc:	0304f023 	movweq	pc, #16419	; 0x4023	; <UNPREDICTABLE>
     ee0:	33fcf8c2 	mvnscc	pc, #12713984	; 0xc20000
     ee4:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     ee8:	7b04f85d 	blvc	0x13f064
     eec:	bf004770 	svclt	0x00004770
     ef0:	40025000 	andmi	r5, r2, r0
     ef4:	af00b580 	svcge	0x0000b580
     ef8:	fc6ff7ff 	stc2l	7, cr15, [pc], #-1020	; 0xb04
     efc:	ff46f7ff 			; <UNDEFINED> instruction: 0xff46f7ff
     f00:	fc82f7ff 	stc2	7, cr15, [r2], {255}	; 0xff
     f04:	ff4af7ff 			; <UNDEFINED> instruction: 0xff4af7ff
     f08:	681b4b05 	ldmdavs	fp, {r0, r2, r8, r9, fp, lr}
     f0c:	2b00681b 	blcs	0x1af80
     f10:	4b03dd04 	blmi	0xf8328
     f14:	681a681b 	ldmdavs	sl, {r0, r1, r3, r4, fp, sp, lr}
     f18:	601a3a01 	andsvs	r3, sl, r1, lsl #20
     f1c:	bd80bf00 	stclt	15, cr11, [r0]
     f20:	20000004 	andcs	r0, r0, r4
     f24:	af00b580 	svcge	0x0000b580
     f28:	f0004803 			; <UNDEFINED> instruction: 0xf0004803
     f2c:	f7fffb99 			; <UNDEFINED> instruction: 0xf7fffb99
     f30:	bf00fe5d 	svclt	0x0000fe5d
     f34:	bf00bd80 	svclt	0x0000bd80
     f38:	00001884 	andeq	r1, r0, r4, lsl #17
     f3c:	af00b480 	svcge	0x0000b480
     f40:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     f44:	7b04f85d 	blvc	0x13f0c0
     f48:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     f4c:	bf00af00 	svclt	0x0000af00
     f50:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     f54:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     f58:	af00b480 	svcge	0x0000b480
     f5c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     f60:	7b04f85d 	blvc	0x13f0dc
     f64:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     f68:	bf00af00 	svclt	0x0000af00
     f6c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     f70:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     f74:	af00b480 	svcge	0x0000b480
     f78:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     f7c:	7b04f85d 	blvc	0x13f0f8
     f80:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     f84:	bf00af00 	svclt	0x0000af00
     f88:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     f8c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     f90:	af00b480 	svcge	0x0000b480
     f94:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     f98:	7b04f85d 	blvc	0x13f114
     f9c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     fa0:	bf00af00 	svclt	0x0000af00
     fa4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     fa8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     fac:	af00b480 	svcge	0x0000b480
     fb0:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     fb4:	7b04f85d 	blvc	0x13f130
     fb8:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     fbc:	bf00af00 	svclt	0x0000af00
     fc0:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     fc4:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     fc8:	af00b480 	svcge	0x0000b480
     fcc:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     fd0:	7b04f85d 	blvc	0x13f14c
     fd4:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     fd8:	bf00af00 	svclt	0x0000af00
     fdc:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     fe0:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
     fe4:	af00b480 	svcge	0x0000b480
     fe8:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
     fec:	7b04f85d 	blvc	0x13f168
     ff0:	b4804770 	strlt	r4, [r0], #1904	; 0x770
     ff4:	bf00af00 	svclt	0x0000af00
     ff8:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
     ffc:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1000:	af00b480 	svcge	0x0000b480
    1004:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1008:	7b04f85d 	blvc	0x13f184
    100c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1010:	bf00af00 	svclt	0x0000af00
    1014:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1018:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    101c:	af00b480 	svcge	0x0000b480
    1020:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1024:	7b04f85d 	blvc	0x13f1a0
    1028:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    102c:	bf00af00 	svclt	0x0000af00
    1030:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1034:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1038:	af00b480 	svcge	0x0000b480
    103c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1040:	7b04f85d 	blvc	0x13f1bc
    1044:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1048:	bf00af00 	svclt	0x0000af00
    104c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1050:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1054:	af00b480 	svcge	0x0000b480
    1058:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    105c:	7b04f85d 	blvc	0x13f1d8
    1060:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1064:	bf00af00 	svclt	0x0000af00
    1068:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    106c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1070:	af00b480 	svcge	0x0000b480
    1074:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1078:	7b04f85d 	blvc	0x13f1f4
    107c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1080:	bf00af00 	svclt	0x0000af00
    1084:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1088:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    108c:	af00b480 	svcge	0x0000b480
    1090:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1094:	7b04f85d 	blvc	0x13f210
    1098:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    109c:	bf00af00 	svclt	0x0000af00
    10a0:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    10a4:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    10a8:	af00b480 	svcge	0x0000b480
    10ac:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    10b0:	7b04f85d 	blvc	0x13f22c
    10b4:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    10b8:	bf00af00 	svclt	0x0000af00
    10bc:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    10c0:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    10c4:	af00b480 	svcge	0x0000b480
    10c8:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    10cc:	7b04f85d 	blvc	0x13f248
    10d0:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    10d4:	bf00af00 	svclt	0x0000af00
    10d8:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    10dc:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    10e0:	af00b480 	svcge	0x0000b480
    10e4:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    10e8:	7b04f85d 	blvc	0x13f264
    10ec:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    10f0:	bf00af00 	svclt	0x0000af00
    10f4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    10f8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    10fc:	af00b480 	svcge	0x0000b480
    1100:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1104:	7b04f85d 	blvc	0x13f280
    1108:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    110c:	bf00af00 	svclt	0x0000af00
    1110:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1114:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1118:	af00b480 	svcge	0x0000b480
    111c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1120:	7b04f85d 	blvc	0x13f29c
    1124:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1128:	bf00af00 	svclt	0x0000af00
    112c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1130:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1134:	af00b480 	svcge	0x0000b480
    1138:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    113c:	7b04f85d 	blvc	0x13f2b8
    1140:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1144:	bf00af00 	svclt	0x0000af00
    1148:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    114c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1150:	af00b480 	svcge	0x0000b480
    1154:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1158:	7b04f85d 	blvc	0x13f2d4
    115c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1160:	bf00af00 	svclt	0x0000af00
    1164:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1168:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    116c:	af00b480 	svcge	0x0000b480
    1170:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1174:	7b04f85d 	blvc	0x13f2f0
    1178:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    117c:	bf00af00 	svclt	0x0000af00
    1180:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1184:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1188:	af00b480 	svcge	0x0000b480
    118c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1190:	7b04f85d 	blvc	0x13f30c
    1194:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1198:	bf00af00 	svclt	0x0000af00
    119c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    11a0:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    11a4:	af00b480 	svcge	0x0000b480
    11a8:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    11ac:	7b04f85d 	blvc	0x13f328
    11b0:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    11b4:	bf00af00 	svclt	0x0000af00
    11b8:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    11bc:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    11c0:	af00b480 	svcge	0x0000b480
    11c4:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    11c8:	7b04f85d 	blvc	0x13f344
    11cc:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    11d0:	bf00af00 	svclt	0x0000af00
    11d4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    11d8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    11dc:	af00b480 	svcge	0x0000b480
    11e0:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    11e4:	7b04f85d 	blvc	0x13f360
    11e8:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    11ec:	bf00af00 	svclt	0x0000af00
    11f0:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    11f4:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    11f8:	af00b480 	svcge	0x0000b480
    11fc:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1200:	7b04f85d 	blvc	0x13f37c
    1204:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1208:	bf00af00 	svclt	0x0000af00
    120c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1210:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1214:	af00b480 	svcge	0x0000b480
    1218:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    121c:	7b04f85d 	blvc	0x13f398
    1220:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1224:	bf00af00 	svclt	0x0000af00
    1228:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    122c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1230:	af00b480 	svcge	0x0000b480
    1234:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1238:	7b04f85d 	blvc	0x13f3b4
    123c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1240:	bf00af00 	svclt	0x0000af00
    1244:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1248:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    124c:	af00b480 	svcge	0x0000b480
    1250:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1254:	7b04f85d 	blvc	0x13f3d0
    1258:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    125c:	bf00af00 	svclt	0x0000af00
    1260:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1264:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1268:	af00b480 	svcge	0x0000b480
    126c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1270:	7b04f85d 	blvc	0x13f3ec
    1274:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1278:	bf00af00 	svclt	0x0000af00
    127c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1280:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1284:	af00b480 	svcge	0x0000b480
    1288:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    128c:	7b04f85d 	blvc	0x13f408
    1290:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1294:	bf00af00 	svclt	0x0000af00
    1298:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    129c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    12a0:	af00b480 	svcge	0x0000b480
    12a4:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    12a8:	7b04f85d 	blvc	0x13f424
    12ac:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    12b0:	bf00af00 	svclt	0x0000af00
    12b4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    12b8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    12bc:	af00b480 	svcge	0x0000b480
    12c0:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    12c4:	7b04f85d 	blvc	0x13f440
    12c8:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    12cc:	bf00af00 	svclt	0x0000af00
    12d0:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    12d4:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    12d8:	af00b480 	svcge	0x0000b480
    12dc:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    12e0:	7b04f85d 	blvc	0x13f45c
    12e4:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    12e8:	bf00af00 	svclt	0x0000af00
    12ec:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    12f0:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    12f4:	af00b480 	svcge	0x0000b480
    12f8:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    12fc:	7b04f85d 	blvc	0x13f478
    1300:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1304:	bf00af00 	svclt	0x0000af00
    1308:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    130c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1310:	af00b480 	svcge	0x0000b480
    1314:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1318:	7b04f85d 	blvc	0x13f494
    131c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1320:	bf00af00 	svclt	0x0000af00
    1324:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1328:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    132c:	af00b480 	svcge	0x0000b480
    1330:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1334:	7b04f85d 	blvc	0x13f4b0
    1338:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    133c:	bf00af00 	svclt	0x0000af00
    1340:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1344:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1348:	af00b480 	svcge	0x0000b480
    134c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1350:	7b04f85d 	blvc	0x13f4cc
    1354:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1358:	bf00af00 	svclt	0x0000af00
    135c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1360:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1364:	af00b480 	svcge	0x0000b480
    1368:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    136c:	7b04f85d 	blvc	0x13f4e8
    1370:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1374:	bf00af00 	svclt	0x0000af00
    1378:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    137c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1380:	af00b480 	svcge	0x0000b480
    1384:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1388:	7b04f85d 	blvc	0x13f504
    138c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1390:	bf00af00 	svclt	0x0000af00
    1394:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1398:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    139c:	af00b480 	svcge	0x0000b480
    13a0:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    13a4:	7b04f85d 	blvc	0x13f520
    13a8:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    13ac:	bf00af00 	svclt	0x0000af00
    13b0:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    13b4:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    13b8:	af00b480 	svcge	0x0000b480
    13bc:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    13c0:	7b04f85d 	blvc	0x13f53c
    13c4:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    13c8:	bf00af00 	svclt	0x0000af00
    13cc:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    13d0:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    13d4:	af00b480 	svcge	0x0000b480
    13d8:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    13dc:	7b04f85d 	blvc	0x13f558
    13e0:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    13e4:	bf00af00 	svclt	0x0000af00
    13e8:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    13ec:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    13f0:	af00b480 	svcge	0x0000b480
    13f4:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    13f8:	7b04f85d 	blvc	0x13f574
    13fc:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1400:	bf00af00 	svclt	0x0000af00
    1404:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1408:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    140c:	af00b480 	svcge	0x0000b480
    1410:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1414:	7b04f85d 	blvc	0x13f590
    1418:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    141c:	bf00af00 	svclt	0x0000af00
    1420:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1424:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1428:	af00b480 	svcge	0x0000b480
    142c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1430:	7b04f85d 	blvc	0x13f5ac
    1434:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1438:	bf00af00 	svclt	0x0000af00
    143c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1440:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1444:	af00b480 	svcge	0x0000b480
    1448:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    144c:	7b04f85d 	blvc	0x13f5c8
    1450:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1454:	bf00af00 	svclt	0x0000af00
    1458:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    145c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1460:	af00b480 	svcge	0x0000b480
    1464:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1468:	7b04f85d 	blvc	0x13f5e4
    146c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1470:	bf00af00 	svclt	0x0000af00
    1474:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1478:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    147c:	af00b480 	svcge	0x0000b480
    1480:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1484:	7b04f85d 	blvc	0x13f600
    1488:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    148c:	bf00af00 	svclt	0x0000af00
    1490:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1494:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1498:	af00b480 	svcge	0x0000b480
    149c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    14a0:	7b04f85d 	blvc	0x13f61c
    14a4:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    14a8:	bf00af00 	svclt	0x0000af00
    14ac:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    14b0:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    14b4:	af00b480 	svcge	0x0000b480
    14b8:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    14bc:	7b04f85d 	blvc	0x13f638
    14c0:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    14c4:	bf00af00 	svclt	0x0000af00
    14c8:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    14cc:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    14d0:	af00b480 	svcge	0x0000b480
    14d4:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    14d8:	7b04f85d 	blvc	0x13f654
    14dc:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    14e0:	bf00af00 	svclt	0x0000af00
    14e4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    14e8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    14ec:	af00b480 	svcge	0x0000b480
    14f0:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    14f4:	7b04f85d 	blvc	0x13f670
    14f8:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    14fc:	bf00af00 	svclt	0x0000af00
    1500:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1504:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1508:	af00b480 	svcge	0x0000b480
    150c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1510:	7b04f85d 	blvc	0x13f68c
    1514:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1518:	bf00af00 	svclt	0x0000af00
    151c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1520:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1524:	af00b480 	svcge	0x0000b480
    1528:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    152c:	7b04f85d 	blvc	0x13f6a8
    1530:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1534:	bf00af00 	svclt	0x0000af00
    1538:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    153c:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1540:	af00b480 	svcge	0x0000b480
    1544:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1548:	7b04f85d 	blvc	0x13f6c4
    154c:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1550:	bf00af00 	svclt	0x0000af00
    1554:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1558:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    155c:	af00b480 	svcge	0x0000b480
    1560:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1564:	7b04f85d 	blvc	0x13f6e0
    1568:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    156c:	bf00af00 	svclt	0x0000af00
    1570:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1574:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1578:	af00b480 	svcge	0x0000b480
    157c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1580:	7b04f85d 	blvc	0x13f6fc
    1584:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    1588:	bf00af00 	svclt	0x0000af00
    158c:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    1590:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    1594:	af00b480 	svcge	0x0000b480
    1598:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    159c:	7b04f85d 	blvc	0x13f718
    15a0:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    15a4:	bf00af00 	svclt	0x0000af00
    15a8:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    15ac:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    15b0:	af00b480 	svcge	0x0000b480
    15b4:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    15b8:	7b04f85d 	blvc	0x13f734
    15bc:	b4804770 	strlt	r4, [r0], #1904	; 0x770
    15c0:	bf00af00 	svclt	0x0000af00
    15c4:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    15c8:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    15cc:	af00b480 	svcge	0x0000b480
    15d0:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    15d4:	7b04f85d 	blvc	0x13f750
    15d8:	bf004770 	svclt	0x00004770
    15dc:	af00b480 	svcge	0x0000b480
    15e0:	f8d34b1d 			; <UNDEFINED> instruction: 0xf8d34b1d
    15e4:	4a1c3618 	bmi	0x70ee4c
    15e8:	0301f043 	movweq	pc, #4163	; 0x1043	; <UNPREDICTABLE>
    15ec:	3618f8c2 	ldrcc	pc, [r8], -r2, asr #17
    15f0:	f8d34b19 			; <UNDEFINED> instruction: 0xf8d34b19
    15f4:	4a183608 	bmi	0x60ee1c
    15f8:	0301f043 	movweq	pc, #4163	; 0x1043	; <UNPREDICTABLE>
    15fc:	3608f8c2 	strcc	pc, [r8], -r2, asr #17
    1600:	2340f04f 	movtcs	pc, #79	; 0x4f	; <UNPREDICTABLE>
    1604:	f8c32203 			; <UNDEFINED> instruction: 0xf8c32203
    1608:	f04f2420 			; <UNDEFINED> instruction: 0xf04f2420
    160c:	22112340 	andscs	r2, r1, #64, 6
    1610:	252cf8c3 	strcs	pc, [ip, #-2243]!	; 0xfffff73d
    1614:	2340f04f 	movtcs	pc, #79	; 0x4f	; <UNPREDICTABLE>
    1618:	f8c32203 			; <UNDEFINED> instruction: 0xf8c32203
    161c:	4b0f251c 	blmi	0x3caa94
    1620:	4a0e6b1b 	bmi	0x39c294
    1624:	0301f023 	movweq	pc, #4131	; 0x1023	; <UNPREDICTABLE>
    1628:	4b0c6313 	blmi	0x31a27c
    162c:	625a2268 	subsvs	r2, sl, #104, 4	; 0x80000006
    1630:	220b4b0a 	andcs	r4, fp, #10240	; 0x2800
    1634:	4b09629a 	blmi	0x25a0a4
    1638:	62da2260 	sbcsvs	r2, sl, #96, 4
    163c:	22004b07 	andcs	r4, r0, #7168	; 0x1c00
    1640:	2fc8f8c3 	svccs	0x00c8f8c3
    1644:	f2404b05 	vqdmulh.s<illegal width 8>	d20, d0, d5
    1648:	631a3201 	tstvs	sl, #268435456	; 0x10000000
    164c:	46bdbf00 	ldrtmi	fp, [sp], r0, lsl #30
    1650:	7b04f85d 	blvc	0x13f7cc
    1654:	bf004770 	svclt	0x00004770
    1658:	400fe000 	andmi	lr, pc, r0
    165c:	4000c000 	andmi	ip, r0, r0
    1660:	b082b580 	addlt	fp, r2, r0, lsl #11
    1664:	6078af00 	rsbsvs	sl, r8, r0, lsl #30
    1668:	687be006 	ldmdavs	fp!, {r1, r2, sp, lr, pc}^
    166c:	607a1c5a 	rsbsvs	r1, sl, sl, asr ip
    1670:	4618781b 			; <UNDEFINED> instruction: 0x4618781b
    1674:	f808f000 			; <UNDEFINED> instruction: 0xf808f000
    1678:	781b687b 	ldmdavc	fp, {r0, r1, r3, r4, r5, r6, fp, sp, lr}
    167c:	d1f42b00 	mvnsle	r2, r0, lsl #22
    1680:	3708bf00 	strcc	fp, [r8, -r0, lsl #30]
    1684:	bd8046bd 	stclt	6, cr4, [r0, #756]	; 0x2f4
    1688:	b083b480 	addlt	fp, r3, r0, lsl #9
    168c:	4603af00 	strmi	sl, [r3], -r0, lsl #30
    1690:	bf0071fb 	svclt	0x000071fb
    1694:	699b4b07 	ldmibvs	fp, {r0, r1, r2, r8, r9, fp, lr}
    1698:	0320f003 	wfieq
    169c:	d1f92b00 	mvnsle	r2, r0, lsl #22
    16a0:	79fb4a04 	ldmibvc	fp!, {r2, r9, fp, lr}^
    16a4:	bf006013 	svclt	0x00006013
    16a8:	46bd370c 	ldrtmi	r3, [sp], ip, lsl #14
    16ac:	7b04f85d 	blvc	0x13f828
    16b0:	bf004770 	svclt	0x00004770
    16b4:	4000c000 	andmi	ip, r0, r0
    16b8:	b083b480 	addlt	fp, r3, r0, lsl #9
    16bc:	bf00af00 	svclt	0x0000af00
    16c0:	699b4b07 	ldmibvs	fp, {r0, r1, r2, r8, r9, fp, lr}
    16c4:	0310f003 	tsteq	r0, #3	; <UNPREDICTABLE>
    16c8:	d1f92b00 	mvnsle	r2, r0, lsl #22
    16cc:	681b4b04 	ldmdavs	fp, {r2, r8, r9, fp, lr}
    16d0:	79fb71fb 	ldmibvc	fp!, {r0, r1, r3, r4, r5, r6, r7, r8, ip, sp, lr}^
    16d4:	370c4618 	smladcc	ip, r8, r6, r4
    16d8:	f85d46bd 			; <UNDEFINED> instruction: 0xf85d46bd
    16dc:	47707b04 	ldrbmi	r7, [r0, -r4, lsl #22]!
    16e0:	4000c000 	andmi	ip, r0, r0
    16e4:	6265645b 	rsbvs	r6, r5, #1526726656	; 0x5b000000
    16e8:	205d6775 	subscs	r6, sp, r5, ror r7
    16ec:	5f5f5f5f 	svcpl	0x005f5f5f
    16f0:	5f5f5f5f 	svcpl	0x005f5f5f
    16f4:	5f5f5f5f 	svcpl	0x005f5f5f
    16f8:	625f5f5f 	subsvs	r5, pc, #380	; 0x17c
    16fc:	6e696765 	cdpvs	7, 6, cr6, cr9, cr5, {3}
    1700:	5f5f5f5f 	svcpl	0x005f5f5f
    1704:	5f5f5f5f 	svcpl	0x005f5f5f
    1708:	5f5f5f5f 	svcpl	0x005f5f5f
    170c:	0d0a5f5f 	stceq	15, cr5, [sl, #-380]	; 0xfffffe84
    1710:	00000000 	andeq	r0, r0, r0
    1714:	69616d5b 	stmdbvs	r1!, {r0, r1, r3, r4, r6, r8, sl, fp, sp, lr}^
    1718:	6d205d6e 	stcvs	13, cr5, [r0, #-440]!	; 0xfffffe48
    171c:	206e6961 	rsbcs	r6, lr, r1, ror #18
    1720:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
    1724:	0d0a2e74 	stceq	14, cr2, [sl, #-464]	; 0xfffffe30
    1728:	00000000 	andeq	r0, r0, r0
    172c:	6b736174 	blvs	0x1cd9d04
    1730:	0031305f 	eorseq	r3, r1, pc, asr r0
    1734:	6b736174 	blvs	0x1cd9d0c
    1738:	0032305f 	eorseq	r3, r2, pc, asr r0
    173c:	72656b5b 	rsbvc	r6, r5, #93184	; 0x16c00
    1740:	5d6c656e 	cfstr64pl	mvdx6, [ip, #-440]!	; 0xfffffe48
    1744:	20736f20 	rsbscs	r6, r3, r0, lsr #30
    1748:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
    174c:	000d0a2e 	andeq	r0, sp, lr, lsr #20
    1750:	6b736174 	blvs	0x1cd9d28
    1754:	65757120 	ldrbvs	r7, [r5, #-288]!	; 0xfffffee0
    1758:	00006575 	andeq	r6, r0, r5, ror r5
    175c:	6b736174 	blvs	0x1cd9d34
    1760:	656c6449 	strbvs	r6, [ip, #-1097]!	; 0xfffffbb7
    1764:	00000000 	andeq	r0, r0, r0
    1768:	7361745b 	cmnvc	r1, #1526726656	; 0x5b000000
    176c:	69205d6b 	stmdbvs	r0!, {r0, r1, r3, r5, r6, r8, sl, fp, ip, lr}
    1770:	2e656c64 	cdpcs	12, 6, cr6, cr5, cr4, {3}
    1774:	00000d0a 	andeq	r0, r0, sl, lsl #26
    1778:	72656b5b 	rsbvc	r6, r5, #93184	; 0x16c00
    177c:	5d6c656e 	cfstr64pl	mvdx6, [ip, #-440]!	; 0xfffffe48
    1780:	20736f20 	rsbscs	r6, r3, r0, lsr #30
    1784:	2e6e7572 	mcrcs	5, 3, r7, cr14, cr2, {3}
    1788:	00000d0a 	andeq	r0, r0, sl, lsl #26
    178c:	72656b5b 	rsbvc	r6, r5, #93184	; 0x16c00
    1790:	5d6c656e 	cfstr64pl	mvdx6, [ip, #-440]!	; 0xfffffe48
    1794:	20736f20 	rsbscs	r6, r3, r0, lsr #30
    1798:	65686373 	strbvs	r6, [r8, #-883]!	; 0xfffffc8d
    179c:	0d0a2e64 	stceq	14, cr2, [sl, #-400]	; 0xfffffe70
    17a0:	00000000 	andeq	r0, r0, r0
    17a4:	6575715b 	ldrbvs	r7, [r5, #-347]!	; 0xfffffea5
    17a8:	205d6575 	subscs	r6, sp, r5, ror r5
    17ac:	75657571 	strbvc	r7, [r5, #-1393]!	; 0xfffffa8f
    17b0:	72632065 	rsbvc	r2, r3, #101	; 0x65
    17b4:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0xfffffe9b
    17b8:	00203a20 	eoreq	r3, r0, r0, lsr #20
    17bc:	00000d0a 	andeq	r0, r0, sl, lsl #26
    17c0:	7361745b 	cmnvc	r1, #1526726656	; 0x5b000000
    17c4:	63205d6b 			; <UNDEFINED> instruction: 0x63205d6b
    17c8:	74616572 	strbtvc	r6, [r1], #-1394	; 0xfffffa8e
    17cc:	61742065 	cmnvs	r4, r5, rrx
    17d0:	3a206b73 	bcc	0x81c5a4
    17d4:	00002720 	andeq	r2, r0, r0, lsr #14
    17d8:	000d0a27 	andeq	r0, sp, r7, lsr #20
    17dc:	7361745b 	cmnvc	r1, #1526726656	; 0x5b000000
    17e0:	74205d6b 	strtvc	r5, [r0], #-3435	; 0xfffff295
    17e4:	206b7361 	rsbcs	r7, fp, r1, ror #6
    17e8:	00000027 	andeq	r0, r0, r7, lsr #32
    17ec:	64612027 	strbtvs	r2, [r1], #-39	; 0xffffffd9
    17f0:	6f742064 	svcvs	0x00742064
    17f4:	65757120 	ldrbvs	r7, [r5, #-288]!	; 0xfffffee0
    17f8:	27206575 			; <UNDEFINED> instruction: 0x27206575
    17fc:	00000000 	andeq	r0, r0, r0
    1800:	0d0a2e27 	stceq	14, cr2, [sl, #-156]	; 0xffffff64
    1804:	00000000 	andeq	r0, r0, r0
    1808:	7361745b 	cmnvc	r1, #1526726656	; 0x5b000000
    180c:	74205d6b 	strtvc	r5, [r0], #-3435	; 0xfffff295
    1810:	206b7361 	rsbcs	r7, fp, r1, ror #6
    1814:	74697773 	strbtvc	r7, [r9], #-1907	; 0xfffff88d
    1818:	6e206863 	cdpvs	8, 2, cr6, cr0, cr3, {3}
    181c:	20747865 	rsbscs	r7, r4, r5, ror #16
    1820:	0027203a 	eoreq	r2, r7, sl, lsr r0
    1824:	7361745b 	cmnvc	r1, #1526726656	; 0x5b000000
    1828:	74205d6b 	strtvc	r5, [r0], #-3435	; 0xfffff295
    182c:	206b7361 	rsbcs	r7, fp, r1, ror #6
    1830:	72727563 	rsbsvc	r7, r2, #415236096	; 0x18c00000
    1834:	20746e65 	rsbscs	r6, r4, r5, ror #28
    1838:	6e207369 	cdpvs	3, 2, cr7, cr0, cr9, {3}
    183c:	2e6c6c75 	mcrcs	12, 3, r6, cr12, cr5, {3}
    1840:	00000d0a 	andeq	r0, r0, sl, lsl #26
    1844:	7361745b 	cmnvc	r1, #1526726656	; 0x5b000000
    1848:	74205d6b 	strtvc	r5, [r0], #-3435	; 0xfffff295
    184c:	206b7361 	rsbcs	r7, fp, r1, ror #6
    1850:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
    1854:	20736920 	rsbscs	r6, r3, r0, lsr #18
    1858:	6c6c756e 	cfstr64vs	mvdx7, [ip], #-440	; 0xfffffe48
    185c:	000d0a2e 	andeq	r0, sp, lr, lsr #20
    1860:	7361745b 	cmnvc	r1, #1526726656	; 0x5b000000
    1864:	63205d6b 			; <UNDEFINED> instruction: 0x63205d6b
    1868:	65746e6f 	ldrbvs	r6, [r4, #-3695]!	; 0xfffff191
    186c:	77732078 			; <UNDEFINED> instruction: 0x77732078
    1870:	68637469 	stmdavs	r3!, {r0, r3, r5, r6, sl, ip, sp, lr}^
    1874:	6e696620 	cdpvs	6, 6, cr6, cr9, cr0, {1}
    1878:	65687369 	strbvs	r7, [r8, #-873]!	; 0xfffffc97
    187c:	0d0a2e64 	stceq	14, cr2, [sl, #-400]	; 0xfffffe70
    1880:	00000000 	andeq	r0, r0, r0
    1884:	72656b5b 	rsbvc	r6, r5, #93184	; 0x16c00
    1888:	5d6c656e 	cfstr64pl	mvdx6, [ip, #-440]!	; 0xfffffe48
    188c:	6e655020 	cdpvs	0, 6, cr5, cr5, cr0, {1}
    1890:	20565364 	subscs	r5, r6, r4, ror #6
    1894:	67697274 			; <UNDEFINED> instruction: 0x67697274
    1898:	65726567 	ldrbvs	r6, [r2, #-1383]!	; 0xfffffa99
    189c:	0d0a2e64 	stceq	14, cr2, [sl, #-400]	; 0xfffffe70
    18a0:	faf08000 	blx	0xffc218a8
    18a4:	00000802 	andeq	r0, r0, r2, lsl #16
    18a8:	Address 0x00000000000018a8 is out of bounds.

