
/mnt/hgfs/g/Symbols/PS2Vault/SLUS_201.74:     file format elf32-littlemips

Disassembly of section :
Disassembly of section :

001dc380 <+0xdc380>:
  1dc380:	fe 02 00 70 00 00 00 00 	addx. vf00,vf00,vf00x 	*unknown*
  1dc388:	00 00 00 00 00 00 00 4a 	*unknown* 	lq. vf00,0(vi00)
  1dc390:	69 00 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dc6e0
  1dc398:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc3a0:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dc3a8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc3b0:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dc3b8:	06 00 08 10 ff 02 00 00 	nop 	iaddiu vi08,vi00,6
  1dc3c0:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dc3c8:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dc3d0:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1dc3d8:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1dc3e0:	ff 07 ea 11 ff 02 00 00 	nop 	iaddiu vi10,vi00,0x7fff
  1dc3e8:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1dc3d0
  1dc3f0:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1dc3f8:	01 30 07 10 ff 02 00 00 	nop 	iaddiu vi07,vi06,1
  1dc400:	7c 33 f1 81 ff 02 00 00 	nop 	lqi.xyzw vf17xyzw,(vi06++)
  1dc408:	78 30 08 10 ff 02 00 00 	nop 	iaddiu vi08,vi06,0x78
  1dc410:	60 30 0c 10 ff 02 00 00 	nop 	iaddiu vi12,vi06,0x60
  1dc418:	18 00 09 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,0x18
  1dc420:	02 40 f8 01 ff 02 00 00 	nop 	lq.xyzw vf24xyzw,2(vi08)
  1dc428:	01 40 f7 01 ff 02 00 00 	nop 	lq.xyzw vf23xyzw,1(vi08)
  1dc430:	00 40 f6 01 ff 02 00 00 	nop 	lq.xyzw vf22xyzw,0(vi08)
  1dc438:	7c 63 ff 81 ff 02 00 00 	nop 	lqi.xyzw vf31xyzw,(vi12++)
  1dc440:	00 38 f9 01 ff 02 00 00 	nop 	lq.xyzw vf25xyzw,0(vi07)
  1dc448:	01 38 fa 01 be c1 d1 01 	mulaz.xyz accxyz,vf24xyz,vf17z 	lq.xyzw vf26xyzw,1(vi07)
  1dc450:	02 38 fb 01 bd b8 d1 01 	madday.xyz accxyz,vf23xyz,vf17y 	lq.xyzw vf27xyzw,2(vi07)
  1dc458:	32 01 0b 80 88 b4 d1 01 	maddx.xyz vf18xyz,vf22xyz,vf17x 	iaddi vi11,vi00,4
  1dc460:	3c 03 00 80 bf f9 c0 01 	mulaw.xyz accxyz,vf31xyz,vf00w 	nop
  1dc468:	32 39 07 80 be c0 d9 01 	maddaz.xyz accxyz,vf24xyz,vf25z 	iaddi vi07,vi07,4
  1dc470:	f2 5f 0b 80 bd b8 d9 01 	madday.xyz accxyz,vf23xyz,vf25y 	iaddi vi11,vi11,-1
  1dc478:	00 38 f9 01 08 b7 d9 01 	maddx.xyz vf28xyz,vf22xyz,vf25x 	lq.xyzw vf25xyzw,0(vi07)
  1dc480:	3c 03 00 80 bf f9 c0 01 	mulaw.xyz accxyz,vf31xyz,vf00w 	nop
  1dc488:	f2 4f 09 80 be c0 da 01 	maddaz.xyz accxyz,vf24xyz,vf26z 	iaddi vi09,vi09,-1
  1dc490:	3c 03 34 80 bd b8 da 01 	madday.xyz accxyz,vf23xyz,vf26y 	move.w vf20w,vf00w
  1dc498:	01 38 fa 01 48 b7 da 01 	maddx.xyz vf29xyz,vf22xyz,vf26x 	lq.xyzw vf26xyzw,1(vi07)
  1dc4a0:	3c 03 00 80 bf f9 c0 01 	mulaw.xyz accxyz,vf31xyz,vf00w 	nop
  1dc4a8:	fc e7 c7 03 be c0 db 01 	maddaz.xyz accxyz,vf24xyz,vf27z 	sq.xyz vf28xyz,-4(vi07)
  1dc4b0:	7c 63 ff 81 bd b8 db 01 	madday.xyz accxyz,vf23xyz,vf27y 	lqi.xyzw vf31xyzw,(vi12++)
  1dc4b8:	02 38 fb 01 88 b7 db 01 	maddx.xyz vf30xyz,vf22xyz,vf27x 	lq.xyzw vf27xyzw,2(vi07)
  1dc4c0:	3c 03 00 80 10 9d c0 01 	maxx.xyz vf20xyz,vf19xyz,vf00x 	nop
  1dc4c8:	fd ef c7 03 bd 50 d2 01 	madday.xyz accxyz,vf10xyz,vf18y 	sq.xyz vf29xyz,-3(vi07)
  1dc4d0:	f1 5f 00 5a be 59 d2 01 	mulaz.xyz accxyz,vf11xyz,vf18z 	ibgtz vi11,0x1dc460
  1dc4d8:	fe f7 c7 03 c8 4c d2 01 	maddx.xyz vf19xyz,vf09xyz,vf18x 	sq.xyz vf30xyz,-2(vi07)
  1dc4e0:	f2 40 08 80 bc 69 d4 01 	mulax.xyz accxyz,vf13xyz,vf20x 	iaddi vi08,vi08,3
  1dc4e8:	02 40 f8 01 bd 70 d4 01 	madday.xyz accxyz,vf14xyz,vf20y 	lq.xyzw vf24xyzw,2(vi08)
  1dc4f0:	01 40 f7 01 be 78 d4 01 	maddaz.xyz accxyz,vf15xyz,vf20z 	lq.xyzw vf23xyzw,1(vi08)
  1dc4f8:	00 40 f6 01 0b 85 c0 01 	maddw.xyz vf20xyz,vf16xyz,vf00w 	lq.xyzw vf22xyzw,0(vi08)
  1dc500:	00 00 7f 43 2a a5 f5 81 	mul[i].xyzw vf20xyzw,vf20xyzw,vf21xyzw 	loi 255
  1dc508:	e6 4f 00 5a 1f a5 e0 01 	minii.xyzw vf20xyzw,vf20xyzw,i 	ibgtz vi09,0x1dc440
  1dc510:	fd a7 e8 03 ff 02 00 00 	nop 	sq.xyzw vf20xyzw,-3(vi08)
  1dc518:	05 00 0c 10 ff 02 00 00 	nop 	iaddiu vi12,vi00,5
  1dc520:	78 30 08 10 ff 02 00 00 	nop 	iaddiu vi08,vi06,0x78
  1dc528:	60 30 0d 10 ff 02 00 00 	nop 	iaddiu vi13,vi06,0x60
  1dc530:	00 40 ff 01 ff 02 00 00 	nop 	lq.xyzw vf31xyzw,0(vi08)
  1dc538:	04 00 09 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,4
  1dc540:	00 30 f6 01 ff 02 00 00 	nop 	lq.xyzw vf22xyzw,0(vi06)
  1dc548:	03 40 08 10 ff 02 00 00 	nop 	iaddiu vi08,vi08,3
  1dc550:	01 30 f7 01 7c f9 ff 01 	ftoi0.xyzw vf31xyzw,vf31xyzw 	lq.xyzw vf23xyzw,1(vi06)
  1dc558:	01 50 0b 10 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddiu vi11,vi10,1
  1dc560:	03 30 fc 01 be 18 f6 01 	maddaz.xyzw accxyzw,vf03xyzw,vf22z 	lq.xyzw vf28xyzw,3(vi06)
  1dc568:	3d b3 5e 80 bd 10 f6 01 	madday.xyzw accxyzw,vf02xyzw,vf22y 	mr32.z vf30z,vf22z
  1dc570:	3c bb 3e 80 48 0e f6 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf22x 	move.w vf30w,vf23w
  1dc578:	02 30 f8 01 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lq.xyzw vf24xyzw,2(vi06)
  1dc580:	3d e3 dd 80 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	mr32.yz vf29yz,vf28yz
  1dc588:	3c 03 3d 80 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	move.w vf29w,vf00w
  1dc590:	bc 03 f9 81 88 0e f7 01 	maddx.xyzw vf26xyzw,vf01xyzw,vf23x 	div q,vf00w,vf00x
  1dc598:	3d 03 5c 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	mr32.z vf28z,vf00z
  1dc5a0:	3d f3 de 80 be 18 f8 01 	maddaz.xyzw accxyzw,vf03xyzw,vf24z 	mr32.yz vf30yz,vf30yz
  1dc5a8:	3c 03 3e 80 bd 10 f8 01 	madday.xyzw accxyzw,vf02xyzw,vf24y 	move.w vf30w,vf00w
  1dc5b0:	be d7 60 80 c8 0e f8 01 	maddx.xyzw vf27xyzw,vf01xyzw,vf24x 	ercpr p,vf26w
  1dc5b8:	3d eb dd 81 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	mr32.xyz vf29xyz,vf29xyz
  1dc5c0:	32 31 06 80 be 38 f6 01 	maddaz.xyzw accxyzw,vf07xyzw,vf22z 	iaddi vi06,vi06,4
  1dc5c8:	3d f3 de 81 bd 30 f6 01 	madday.xyzw accxyzw,vf06xyzw,vf22y 	mr32.xyz vf30xyz,vf30xyz
  1dc5d0:	bc 03 fb 81 5c ce e0 01 	mulq.xyzw vf25xyzw,vf25xyzw,q 	div q,vf00w,vf00x
  1dc5d8:	f2 4f 09 80 1c e7 c0 01 	mulq.xyz vf28xyz,vf28xyz,q 	iaddi vi09,vi09,-1
  1dc5e0:	09 20 04 10 48 2c f6 01 	maddx.xyzw vf17xyzw,vf05xyzw,vf22x 	iaddiu vi04,vi04,9
  1dc5e8:	7c 6b 3f 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	lqi.w vf31w,(vi13++)
  1dc5f0:	3c 03 00 80 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	nop
  1dc5f8:	00 30 f6 01 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	lq.xyzw vf22xyzw,0(vi06)
  1dc600:	3c 03 00 80 88 2c f7 01 	maddx.xyzw vf18xyzw,vf05xyzw,vf23x 	nop
  1dc608:	f7 e7 e4 03 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	sq.xyzw vf28xyzw,-9(vi04)
  1dc610:	3c 03 00 80 be 38 f8 01 	maddaz.xyzw accxyzw,vf07xyzw,vf24z 	nop
  1dc618:	7c 06 14 81 bd 30 f8 01 	madday.xyzw accxyzw,vf06xyzw,vf24y 	mfp.x vf20x,p
  1dc620:	3c 03 00 80 c8 2c f8 01 	maddx.xyzw vf19xyzw,vf05xyzw,vf24x 	nop
  1dc628:	01 30 f7 01 dc de e0 01 	mulq.xyzw vf27xyzw,vf27xyzw,q 	lq.xyzw vf23xyzw,1(vi06)
  1dc630:	3c 03 00 80 98 d6 f4 01 	mulx.xyzw vf26xyzw,vf26xyzw,vf20x 	nop
  1dc638:	f8 ff e4 03 9c f7 c0 01 	mulq.xyz vf30xyz,vf30xyz,q 	sq.xyzw vf31xyzw,-8(vi04)
  1dc640:	3c 03 00 80 ff 89 d1 01 	clipw.xyz vf17xyz,vf17w 	nop
  1dc648:	fb ff e4 03 ff 91 d2 01 	clipw.xyz vf18xyz,vf18w 	sq.xyzw vf31xyzw,-5(vi04)
  1dc650:	3c 03 00 80 ff 99 d3 01 	clipw.xyz vf19xyz,vf19w 	nop
  1dc658:	fe ff e4 03 7d c9 f9 01 	ftoi4.xyzw vf25xyzw,vf25xyzw 	sq.xyzw vf31xyzw,-2(vi04)
  1dc660:	3c 03 00 80 7d d1 fa 01 	ftoi4.xyzw vf26xyzw,vf26xyzw 	nop
  1dc668:	fd f7 e4 03 7d d9 fb 01 	ftoi4.xyzw vf27xyzw,vf27xyzw 	sq.xyzw vf30xyzw,-3(vi04)
  1dc670:	ff ff 03 24 58 ef d4 01 	mulx.xyz vf29xyz,vf29xyz,vf20x 	fcand vi01,0x3ffff
  1dc678:	f9 cf e4 03 ff 02 00 00 	nop 	sq.xyzw vf25xyzw,-7(vi04)
  1dc680:	71 00 01 80 ff 02 00 00 	nop 	isub vi01,vi00,vi01
  1dc688:	fc d7 e4 03 ff 02 00 00 	nop 	sq.xyzw vf26xyzw,-4(vi04)
  1dc690:	74 58 01 80 ff 02 00 00 	nop 	iand vi01,vi11,vi01
  1dc698:	ff df e4 03 ff 02 00 00 	nop 	sq.xyzw vf27xyzw,-1(vi04)
  1dc6a0:	fa ef e4 03 ff 02 00 00 	nop 	sq.xyzw vf29xyzw,-6(vi04)
  1dc6a8:	d5 4f 00 5a ff 02 00 00 	nop 	ibgtz vi09,0x1dc558
  1dc6b0:	ff 27 21 0a ff 02 00 00 	nop 	isw.w vi01,-1(vi04)w
  1dc6b8:	ce 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dc530
  1dc6c0:	f2 67 0c 80 ff 02 00 00 	nop 	iaddi vi12,vi12,-1
  1dc6c8:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dc6d0:	99 07 00 40 ff 02 00 00 	nop 	b 0x1dc3a0
  1dc6d8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc6e0:	00 00 e1 01 ff 02 00 00 	nop 	lq.xyzw vf01xyzw,0(vi00)
  1dc6e8:	01 00 e2 01 ff 02 00 00 	nop 	lq.xyzw vf02xyzw,1(vi00)
  1dc6f0:	02 00 e3 01 ff 02 00 00 	nop 	lq.xyzw vf03xyzw,2(vi00)
  1dc6f8:	03 00 e4 01 ff 02 00 00 	nop 	lq.xyzw vf04xyzw,3(vi00)
  1dc700:	04 00 e5 01 ff 02 00 00 	nop 	lq.xyzw vf05xyzw,4(vi00)
  1dc708:	05 00 e6 01 ff 02 00 00 	nop 	lq.xyzw vf06xyzw,5(vi00)
  1dc710:	06 00 e7 01 ff 02 00 00 	nop 	lq.xyzw vf07xyzw,6(vi00)
  1dc718:	07 00 e8 01 ff 02 00 00 	nop 	lq.xyzw vf08xyzw,7(vi00)
  1dc720:	08 00 e9 01 ff 02 00 00 	nop 	lq.xyzw vf09xyzw,8(vi00)
  1dc728:	09 00 ea 01 ff 02 00 00 	nop 	lq.xyzw vf10xyzw,9(vi00)
  1dc730:	0a 00 eb 01 ff 02 00 00 	nop 	lq.xyzw vf11xyzw,10(vi00)
  1dc738:	0b 00 ec 01 ff 02 00 00 	nop 	lq.xyzw vf12xyzw,11(vi00)
  1dc740:	0c 00 ed 01 ff 02 00 00 	nop 	lq.xyzw vf13xyzw,12(vi00)
  1dc748:	0d 00 ee 01 ff 02 00 00 	nop 	lq.xyzw vf14xyzw,13(vi00)
  1dc750:	0e 00 ef 01 ff 02 00 00 	nop 	lq.xyzw vf15xyzw,14(vi00)
  1dc758:	0f 00 f0 01 ff 02 00 00 	nop 	lq.xyzw vf16xyzw,15(vi00)
  1dc760:	00 78 00 48 ff 02 00 00 	nop 	jr vi15
  1dc768:	7a 00 f5 01 ff 02 00 00 	nop 	lq.xyzw vf21xyzw,122(vi00)
  1dc770:	ed 07 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dc6e0
  1dc778:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc780:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dc788:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc790:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dc798:	fe 33 8c 80 ff 02 00 00 	nop 	ilwr.y vi12,(vi06)y
  1dc7a0:	fe 33 0d 81 ff 02 00 00 	nop 	ilwr.x vi13,(vi06)x
  1dc7a8:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dc7b0:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dc7b8:	06 00 0c 50 ff 02 00 00 	nop 	ibeq vi12,vi00,0x1dc7f0
  1dc7c0:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dc7c8:	7c 33 fd 81 ff 02 00 00 	nop 	lqi.xyzw vf29xyzw,(vi06++)
  1dc7d0:	f2 67 0c 80 ff 02 00 00 	nop 	iaddi vi12,vi12,-1
  1dc7d8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc7e0:	fc 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dc7c8
  1dc7e8:	7d eb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf29xyzw,(vi04++)
  1dc7f0:	fe 33 0c 81 ff 02 00 00 	nop 	ilwr.x vi12,(vi06)x
  1dc7f8:	01 30 ff 01 ff 02 00 00 	nop 	lq.xyzw vf31xyzw,1(vi06)
  1dc800:	ff 07 eb 11 ff 02 00 00 	nop 	iaddiu vi11,vi00,0x7fff
  1dc808:	7c 33 f2 81 ff 02 00 00 	nop 	lqi.xyzw vf18xyzw,(vi06++)
  1dc810:	34 5b 0c 80 bf 01 e0 01 	mulaw.xyzw accxyzw,vf00xyzw,vf00w 	iand vi12,vi11,vi12
  1dc818:	f0 30 0c 80 be 58 ff 01 	maddaz.xyzw accxyzw,vf11xyzw,vf31z 	iadd vi03,vi06,vi12
  1dc820:	00 18 fd 01 bd 50 ff 01 	madday.xyzw accxyzw,vf10xyzw,vf31y 	lq.xyzw vf29xyzw,0(vi03)
  1dc828:	b0 18 0c 80 c8 4d ff 01 	maddx.xyzw vf23xyzw,vf09xyzw,vf31x 	iadd vi02,vi03,vi12
  1dc830:	72 30 06 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddi vi06,vi06,1
  1dc838:	fd 63 ff 81 ff 02 00 00 	nop 	mfir.xyzw vf31xyzw,vi12
  1dc840:	7b 00 fe 01 3c f9 ff 01 	itof0.xyzw vf31xyzw,vf31xyzw 	lq.xyzw vf30xyzw,123(vi00)
  1dc848:	3c 03 00 80 a8 f7 5f 00 	add.z vf30z,vf30z,vf31z 	nop
  1dc850:	7b f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,123(vi00)
  1dc858:	7c 33 ff 81 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	lqi.xyzw vf31xyzw,(vi06++)
  1dc860:	72 18 03 80 d0 bd e0 01 	maxx.xyzw vf23xyzw,vf23xyzw,vf00x 	iaddi vi03,vi03,1
  1dc868:	7d 93 e4 81 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	sqi.xyzw vf18xyzw,(vi04++)
  1dc870:	f2 67 0c 80 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	iaddi vi12,vi12,-1
  1dc878:	72 00 09 80 bc 69 f7 01 	mulax.xyzw accxyzw,vf13xyzw,vf23x 	iaddi vi09,vi00,1
  1dc880:	72 58 08 80 bd 70 f7 01 	madday.xyzw accxyzw,vf14xyzw,vf23y 	iaddi vi08,vi11,1
  1dc888:	bc 03 f9 81 be 78 f7 01 	maddaz.xyzw accxyzw,vf15xyzw,vf23z 	div q,vf00w,vf00x
  1dc890:	3c 03 00 80 8b 85 f7 01 	maddw.xyzw vf22xyzw,vf16xyzw,vf23w 	nop
  1dc898:	3c 03 00 80 bf 01 e0 01 	mulaw.xyzw accxyzw,vf00xyzw,vf00w 	nop
  1dc8a0:	7c 13 fe 81 be 58 ff 01 	maddaz.xyzw accxyzw,vf11xyzw,vf31z 	lqi.xyzw vf30xyzw,(vi02++)
  1dc8a8:	00 00 7f 43 bd 50 ff 81 	madday[i].xyzw accxyzw,vf10xyzw,vf31y 	loi 255
  1dc8b0:	fe 37 4a 08 aa b5 f5 01 	mul.xyzw vf22xyzw,vf22xyzw,vf21xyzw 	ilw.z vi10,-2(vi06)z
  1dc8b8:	3c 03 00 80 c8 4d ff 01 	maddx.xyzw vf23xyzw,vf09xyzw,vf31x 	nop
  1dc8c0:	7c 1b fd 81 9c ce e0 01 	mulq.xyzw vf26xyzw,vf25xyzw,q 	lqi.xyzw vf29xyzw,(vi03++)
  1dc8c8:	3c 03 00 80 9c f7 c0 01 	mulq.xyz vf30xyz,vf30xyz,q 	nop
  1dc8d0:	b4 52 09 80 9f b5 e0 01 	minii.xyzw vf22xyzw,vf22xyzw,i 	iand vi10,vi10,vi09
  1dc8d8:	f2 57 0a 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddi vi10,vi10,-1
  1dc8e0:	b4 52 08 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iand vi10,vi10,vi08
  1dc8e8:	7d f3 e4 81 d0 bd e0 01 	maxx.xyzw vf23xyzw,vf23xyzw,vf00x 	sqi.xyzw vf30xyzw,(vi04++)
  1dc8f0:	fd 53 3a 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	mfir.w vf26w,vi10
  1dc8f8:	7c 33 ff 81 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	lqi.xyzw vf31xyzw,(vi06++)
  1dc900:	3c 03 00 80 7c b1 f6 01 	ftoi0.xyzw vf22xyzw,vf22xyzw 	nop
  1dc908:	f2 67 0c 80 7d d1 da 01 	ftoi4.xyz vf26xyz,vf26xyz 	iaddi vi12,vi12,-1
  1dc910:	fd 53 3a 80 bc 69 f7 01 	mulax.xyzw accxyzw,vf13xyzw,vf23x 	mfir.w vf26w,vi10
  1dc918:	bc 03 f9 81 bd 70 f7 01 	madday.xyzw accxyzw,vf14xyzw,vf23y 	div q,vf00w,vf00x
  1dc920:	7d b3 e4 81 be 78 f7 01 	maddaz.xyzw accxyzw,vf15xyzw,vf23z 	sqi.xyzw vf22xyzw,(vi04++)
  1dc928:	ee 67 00 5a 8b 85 f7 01 	maddw.xyzw vf22xyzw,vf16xyzw,vf23w 	ibgtz vi12,0x1dc8a0
  1dc930:	7d d3 e4 81 bf 01 e0 01 	mulaw.xyzw accxyzw,vf00xyzw,vf00w 	sqi.xyzw vf26xyzw,(vi04++)
  1dc938:	fe 37 4a 08 ff 02 00 00 	nop 	ilw.z vi10,-2(vi06)z
  1dc940:	7c 13 fe 81 ff 02 00 00 	nop 	lqi.xyzw vf30xyzw,(vi02++)
  1dc948:	f2 20 04 80 aa b5 f5 01 	mul.xyzw vf22xyzw,vf22xyzw,vf21xyzw 	iaddi vi04,vi04,3
  1dc950:	f2 6f 0d 80 9c ce e0 01 	mulq.xyzw vf26xyzw,vf25xyzw,q 	iaddi vi13,vi13,-1
  1dc958:	b4 52 09 80 9c f7 c0 01 	mulq.xyz vf30xyz,vf30xyz,q 	iand vi10,vi10,vi09
  1dc960:	f2 57 0a 80 ff 02 00 00 	nop 	iaddi vi10,vi10,-1
  1dc968:	b4 52 08 80 9f b5 e0 01 	minii.xyzw vf22xyzw,vf22xyzw,i 	iand vi10,vi10,vi08
  1dc970:	32 10 06 80 7d d1 da 01 	ftoi4.xyz vf26xyz,vf26xyz 	iaddi vi06,vi02,0
  1dc978:	fd 53 3a 80 ff 02 00 00 	nop 	mfir.w vf26w,vi10
  1dc980:	fd f7 e4 03 7c b1 f6 01 	ftoi0.xyzw vf22xyzw,vf22xyzw 	sq.xyzw vf30xyzw,-3(vi04)
  1dc988:	ff d7 e4 03 ff 02 00 00 	nop 	sq.xyzw vf26xyzw,-1(vi04)
  1dc990:	cb 6f 00 5a ff 02 00 00 	nop 	ibgtz vi13,0x1dc7f0
  1dc998:	fe b7 e4 03 ff 02 00 00 	nop 	sq.xyzw vf22xyzw,-2(vi04)
  1dc9a0:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dc9a8:	ba 07 00 40 ff 02 00 00 	nop 	b 0x1dc780
  1dc9b0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc9b8:	a4 07 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dc6e0
  1dc9c0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc9c8:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dc9d0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dc9d8:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dc9e0:	fe 33 8c 80 ff 02 00 00 	nop 	ilwr.y vi12,(vi06)y
  1dc9e8:	fe 33 0d 81 ff 02 00 00 	nop 	ilwr.x vi13,(vi06)x
  1dc9f0:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dc9f8:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dca00:	06 00 0c 50 ff 02 00 00 	nop 	ibeq vi12,vi00,0x1dca38
  1dca08:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dca10:	7c 33 fd 81 ff 02 00 00 	nop 	lqi.xyzw vf29xyzw,(vi06++)
  1dca18:	f2 67 0c 80 ff 02 00 00 	nop 	iaddi vi12,vi12,-1
  1dca20:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dca28:	fc 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dca10
  1dca30:	7d eb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf29xyzw,(vi04++)
  1dca38:	fe 33 0c 81 ff 02 00 00 	nop 	ilwr.x vi12,(vi06)x
  1dca40:	01 30 ff 01 ff 02 00 00 	nop 	lq.xyzw vf31xyzw,1(vi06)
  1dca48:	ff 07 eb 11 ff 02 00 00 	nop 	iaddiu vi11,vi00,0x7fff
  1dca50:	7c 33 f2 81 ff 02 00 00 	nop 	lqi.xyzw vf18xyzw,(vi06++)
  1dca58:	34 5b 0c 80 bf 01 e0 01 	mulaw.xyzw accxyzw,vf00xyzw,vf00w 	iand vi12,vi11,vi12
  1dca60:	f0 30 0c 80 be 58 ff 01 	maddaz.xyzw accxyzw,vf11xyzw,vf31z 	iadd vi03,vi06,vi12
  1dca68:	00 18 fd 01 bd 50 ff 01 	madday.xyzw accxyzw,vf10xyzw,vf31y 	lq.xyzw vf29xyzw,0(vi03)
  1dca70:	b0 18 0c 80 c8 4d ff 01 	maddx.xyzw vf23xyzw,vf09xyzw,vf31x 	iadd vi02,vi03,vi12
  1dca78:	72 30 06 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddi vi06,vi06,1
  1dca80:	fd 63 ff 81 ff 02 00 00 	nop 	mfir.xyzw vf31xyzw,vi12
  1dca88:	7b 00 fe 01 3c f9 ff 01 	itof0.xyzw vf31xyzw,vf31xyzw 	lq.xyzw vf30xyzw,123(vi00)
  1dca90:	3c 03 00 80 a8 f7 3f 00 	add.w vf30w,vf30w,vf31w 	nop
  1dca98:	7b f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,123(vi00)
  1dcaa0:	7c 33 ff 81 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	lqi.xyzw vf31xyzw,(vi06++)
  1dcaa8:	72 18 03 80 d0 bd e0 01 	maxx.xyzw vf23xyzw,vf23xyzw,vf00x 	iaddi vi03,vi03,1
  1dcab0:	7d 93 e4 81 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	sqi.xyzw vf18xyzw,(vi04++)
  1dcab8:	f2 67 0c 80 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	iaddi vi12,vi12,-1
  1dcac0:	72 58 07 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	iaddi vi07,vi11,1
  1dcac8:	3c 03 00 80 be 38 fd 01 	maddaz.xyzw accxyzw,vf07xyzw,vf29z 	nop
  1dcad0:	3c 03 00 80 bd 30 fd 01 	madday.xyzw accxyzw,vf06xyzw,vf29y 	nop
  1dcad8:	bc 03 f9 81 c8 2e fd 01 	maddx.xyzw vf27xyzw,vf05xyzw,vf29x 	div q,vf00w,vf00x
  1dcae0:	fe 37 4a 08 bc 69 f7 01 	mulax.xyzw accxyzw,vf13xyzw,vf23x 	ilw.z vi10,-2(vi06)z
  1dcae8:	72 00 09 80 bd 70 f7 01 	madday.xyzw accxyzw,vf14xyzw,vf23y 	iaddi vi09,vi00,1
  1dcaf0:	3c 03 00 80 be 78 f7 01 	maddaz.xyzw accxyzw,vf15xyzw,vf23z 	nop
  1dcaf8:	3c 03 00 80 8b 85 f7 01 	maddw.xyzw vf22xyzw,vf16xyzw,vf23w 	nop
  1dcb00:	3c 03 00 80 ff d9 db 01 	clipw.xyz vf27xyz,vf27w 	nop
  1dcb08:	7c 13 fe 81 bf 01 e0 01 	mulaw.xyzw accxyzw,vf00xyzw,vf00w 	lqi.xyzw vf30xyzw,(vi02++)
  1dcb10:	3c 03 00 80 be 58 ff 01 	maddaz.xyzw accxyzw,vf11xyzw,vf31z 	nop
  1dcb18:	7c 1b fd 81 bd 50 ff 01 	madday.xyzw accxyzw,vf10xyzw,vf31y 	lqi.xyzw vf29xyzw,(vi03++)
  1dcb20:	00 00 7f 43 aa b5 f5 81 	mul[i].xyzw vf22xyzw,vf22xyzw,vf21xyzw 	loi 255
  1dcb28:	ff ff 03 24 c8 4d ff 01 	maddx.xyzw vf23xyzw,vf09xyzw,vf31x 	fcand vi01,0x3ffff
  1dcb30:	7c 33 ff 81 9c ce e0 01 	mulq.xyzw vf26xyzw,vf25xyzw,q 	lqi.xyzw vf31xyzw,(vi06++)
  1dcb38:	71 48 01 80 9c f7 c0 01 	mulq.xyz vf30xyz,vf30xyz,q 	isub vi01,vi09,vi01
  1dcb40:	74 50 01 80 9f b5 e0 01 	minii.xyzw vf22xyzw,vf22xyzw,i 	iand vi01,vi10,vi01
  1dcb48:	f2 0f 01 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddi vi01,vi01,-1
  1dcb50:	74 38 01 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iand vi01,vi07,vi01
  1dcb58:	7d f3 e4 81 d0 bd e0 01 	maxx.xyzw vf23xyzw,vf23xyzw,vf00x 	sqi.xyzw vf30xyzw,(vi04++)
  1dcb60:	3c 03 00 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	nop
  1dcb68:	fd 0b 3a 80 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	mfir.w vf26w,vi01
  1dcb70:	fe 37 4a 08 7c b1 f6 01 	ftoi0.xyzw vf22xyzw,vf22xyzw 	ilw.z vi10,-2(vi06)z
  1dcb78:	3c 03 00 80 7d d1 da 01 	ftoi4.xyz vf26xyz,vf26xyz 	nop
  1dcb80:	3c 03 00 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	nop
  1dcb88:	bc 03 f9 81 be 38 fd 01 	maddaz.xyzw accxyzw,vf07xyzw,vf29z 	div q,vf00w,vf00x
  1dcb90:	00 00 00 00 00 01 00 4a 	*unknown* 	lq. vf00,0(vi00)
  1dcb98:	7d b3 e4 81 bd 30 fd 01 	madday.xyzw accxyzw,vf06xyzw,vf29y 	sqi.xyzw vf22xyzw,(vi04++)
  1dcba0:	3c 03 00 80 c8 2e fd 01 	maddx.xyzw vf27xyzw,vf05xyzw,vf29x 	nop
  1dcba8:	f2 67 0c 80 bc 69 f7 01 	mulax.xyzw accxyzw,vf13xyzw,vf23x 	iaddi vi12,vi12,-1
  1dcbb0:	7d d3 e4 81 bd 70 f7 01 	madday.xyzw accxyzw,vf14xyzw,vf23y 	sqi.xyzw vf26xyzw,(vi04++)
  1dcbb8:	3c 03 00 80 be 78 f7 01 	maddaz.xyzw accxyzw,vf15xyzw,vf23z 	nop
  1dcbc0:	e9 67 00 5a ff d9 db 01 	clipw.xyz vf27xyz,vf27w 	ibgtz vi12,0x1dcb10
  1dcbc8:	3c 03 00 80 8b 85 f7 01 	maddw.xyzw vf22xyzw,vf16xyzw,vf23w 	nop
  1dcbd0:	7c 13 fe 81 ff 02 00 00 	nop 	lqi.xyzw vf30xyzw,(vi02++)
  1dcbd8:	f2 20 04 80 ff 02 00 00 	nop 	iaddi vi04,vi04,3
  1dcbe0:	ff ff 03 24 aa b5 f5 01 	mul.xyzw vf22xyzw,vf22xyzw,vf21xyzw 	fcand vi01,0x3ffff
  1dcbe8:	71 48 01 80 9c ce e0 01 	mulq.xyzw vf26xyzw,vf25xyzw,q 	isub vi01,vi09,vi01
  1dcbf0:	f2 6f 0d 80 9c f7 c0 01 	mulq.xyz vf30xyz,vf30xyz,q 	iaddi vi13,vi13,-1
  1dcbf8:	74 50 01 80 ff 02 00 00 	nop 	iand vi01,vi10,vi01
  1dcc00:	32 10 06 80 9f b5 e0 01 	minii.xyzw vf22xyzw,vf22xyzw,i 	iaddi vi06,vi02,0
  1dcc08:	f2 0f 01 80 7d d1 fa 01 	ftoi4.xyzw vf26xyzw,vf26xyzw 	iaddi vi01,vi01,-1
  1dcc10:	74 38 01 80 ff 02 00 00 	nop 	iand vi01,vi07,vi01
  1dcc18:	fd f7 e4 03 7c b1 f6 01 	ftoi0.xyzw vf22xyzw,vf22xyzw 	sq.xyzw vf30xyzw,-3(vi04)
  1dcc20:	ff d7 e4 03 ff 02 00 00 	nop 	sq.xyzw vf26xyzw,-1(vi04)
  1dcc28:	ff 27 21 0a ff 02 00 00 	nop 	isw.w vi01,-1(vi04)w
  1dcc30:	c1 6f 00 5a ff 02 00 00 	nop 	ibgtz vi13,0x1dca40
  1dcc38:	fe b7 e4 03 ff 02 00 00 	nop 	sq.xyzw vf22xyzw,-2(vi04)
  1dcc40:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dcc48:	b0 07 00 40 ff 02 00 00 	nop 	b 0x1dc9d0
  1dcc50:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dcc58:	51 07 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dc6e8
  1dcc60:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dcc68:	03 00 00 40 ff 02 00 00 	nop 	b 0x1dcc88
  1dcc70:	32 00 08 80 ff 02 00 00 	nop 	iaddi vi08,vi00,0
  1dcc78:	4d 07 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dc6e8
  1dcc80:	72 00 08 80 ff 02 00 00 	nop 	iaddi vi08,vi00,1
  1dcc88:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dcc90:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dcc98:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dcca0:	fe 33 8c 80 ff 02 00 00 	nop 	ilwr.y vi12,(vi06)y
  1dcca8:	fe 33 0d 81 ff 02 00 00 	nop 	ilwr.x vi13,(vi06)x
  1dccb0:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dccb8:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dccc0:	06 00 0c 50 ff 02 00 00 	nop 	ibeq vi12,vi00,0x1dccf8
  1dccc8:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dccd0:	7c 33 fd 81 ff 02 00 00 	nop 	lqi.xyzw vf29xyzw,(vi06++)
  1dccd8:	f2 67 0c 80 ff 02 00 00 	nop 	iaddi vi12,vi12,-1
  1dcce0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dcce8:	fc 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dccd0
  1dccf0:	7d eb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf29xyzw,(vi04++)
  1dccf8:	fe 33 0c 81 ff 02 00 00 	nop 	ilwr.x vi12,(vi06)x
  1dcd00:	ff 07 eb 11 ff 02 00 00 	nop 	iaddiu vi11,vi00,0x7fff
  1dcd08:	7c 33 fb 81 ff 02 00 00 	nop 	lqi.xyzw vf27xyzw,(vi06++)
  1dcd10:	34 5b 0c 80 ff 02 00 00 	nop 	iand vi12,vi11,vi12
  1dcd18:	f0 30 0c 80 ff 02 00 00 	nop 	iadd vi03,vi06,vi12
  1dcd20:	00 18 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,0(vi03)
  1dcd28:	01 18 f8 01 ff 02 00 00 	nop 	lq.xyzw vf24xyzw,1(vi03)
  1dcd30:	b0 18 0c 80 6c 64 fd 01 	sub.xyzw vf17xyzw,vf12xyzw,vf29xyzw 	iadd vi02,vi03,vi12
  1dcd38:	7c 33 ff 81 ac 64 f8 01 	sub.xyzw vf18xyzw,vf12xyzw,vf24xyzw 	lqi.xyzw vf31xyzw,(vi06++)
  1dcd40:	00 00 00 40 6a 8e f1 81 	mul[i].xyzw vf25xyzw,vf17xyzw,vf17xyzw 	loi 2
  1dcd48:	3f 97 c0 81 ea 8c df 01 	mul.xyz vf19xyz,vf17xyz,vf31xyz 	erleng p,vf18
  1dcd50:	72 18 03 80 1e fd c0 01 	muli.xyz vf20xyz,vf31xyz,i 	iaddi vi03,vi03,1
  1dcd58:	3c 03 00 80 bc 01 39 00 	mulax.w accw,vf00w,vf25x 	nop
  1dcd60:	3c 03 00 80 bd 00 39 00 	madday.w accw,vf00w,vf25y 	nop
  1dcd68:	3c 03 00 80 4a 06 39 00 	maddz.w vf25w,vf00w,vf25z 	nop
  1dcd70:	3c 03 00 80 bc 01 33 00 	mulax.w accw,vf00w,vf19x 	nop
  1dcd78:	3c 03 00 80 bd 00 33 00 	madday.w accw,vf00w,vf19y 	nop
  1dcd80:	3c 03 00 80 ca 04 33 00 	maddz.w vf19w,vf00w,vf19z 	nop
  1dcd88:	be 03 f9 81 bf 01 e0 01 	mulaw.xyzw accxyzw,vf00xyzw,vf00w 	rsqrt q,vf00w,vf00x
  1dcd90:	3c 03 00 80 be 58 ff 01 	maddaz.xyzw accxyzw,vf11xyzw,vf31z 	nop
  1dcd98:	f2 6f 0d 80 bd 50 ff 01 	madday.xyzw accxyzw,vf10xyzw,vf31y 	iaddi vi13,vi13,-1
  1dcda0:	7d db e4 81 c8 4d ff 01 	maddx.xyzw vf23xyzw,vf09xyzw,vf31x 	sqi.xyzw vf27xyzw,(vi04++)
  1dcda8:	72 58 07 80 fc 02 d1 01 	suba.xyz accxyz,vf00xyz,vf17xyz 	iaddi vi07,vi11,1
  1dcdb0:	3c 03 00 80 cb a4 d3 01 	maddw.xyz vf19xyz,vf20xyz,vf19w 	nop
  1dcdb8:	fd 63 fa 81 ff 02 00 00 	nop 	mfir.xyzw vf26xyzw,vi12
  1dcdc0:	7c 00 fe 01 3c d1 fa 01 	itof0.xyzw vf26xyzw,vf26xyzw 	lq.xyzw vf30xyzw,124(vi00)
  1dcdc8:	3c 03 00 80 a8 f7 3a 00 	add.w vf30w,vf30w,vf26w 	nop
  1dcdd0:	7c f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,124(vi00)
  1dcdd8:	bf 03 00 80 ff 02 00 00 	nop 	waitq
  1dcde0:	3c 03 00 80 dc 9c e0 01 	mulq.xyzw vf19xyzw,vf19xyzw,q 	nop
  1dcde8:	fc fb 4a 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	mtir vi10,vf31z
  1dcdf0:	72 00 01 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iaddi vi01,vi00,1
  1dcdf8:	01 18 f8 01 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	lq.xyzw vf24xyzw,1(vi03)
  1dce00:	bf 07 00 80 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	waitp
  1dce08:	7c 06 3a 80 be 59 d3 01 	mulaz.xyz accxyz,vf11xyz,vf19z 	mfp.w vf26w,p
  1dce10:	b1 0a 0a 80 bd 50 d3 01 	madday.xyz accxyz,vf10xyz,vf19y 	isub vi10,vi01,vi10
  1dce18:	b4 52 01 80 c8 4c d3 01 	maddx.xyz vf19xyz,vf09xyz,vf19x 	iand vi10,vi10,vi01
  1dce20:	bc 03 f9 81 d0 bd e0 01 	maxx.xyzw vf23xyzw,vf23xyzw,vf00x 	div q,vf00w,vf00x
  1dce28:	3c 03 00 80 5b 94 fa 01 	mulw.xyzw vf17xyzw,vf18xyzw,vf26w 	nop
  1dce30:	3c 03 00 80 ac 64 f8 01 	sub.xyzw vf18xyzw,vf12xyzw,vf24xyzw 	nop
  1dce38:	3c 03 00 80 d0 9c c0 01 	maxx.xyz vf19xyz,vf19xyz,vf00x 	nop
  1dce40:	3c 03 00 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	nop
  1dce48:	3c 03 00 80 be 38 fd 01 	maddaz.xyzw accxyzw,vf07xyzw,vf29z 	nop
  1dce50:	3f 97 c0 81 ea 9c d3 01 	mul.xyz vf19xyz,vf19xyz,vf19xyz 	erleng p,vf18
  1dce58:	3c 03 00 80 bd 30 fd 01 	madday.xyzw accxyzw,vf06xyzw,vf29y 	nop
  1dce60:	3c 03 00 80 c8 2e fd 01 	maddx.xyzw vf27xyzw,vf05xyzw,vf29x 	nop
  1dce68:	3c 03 00 80 ea 9c d3 01 	mul.xyz vf19xyz,vf19xyz,vf19xyz 	nop
  1dce70:	3c 03 00 80 bf b9 e0 01 	mulaw.xyzw accxyzw,vf23xyzw,vf00w 	nop
  1dce78:	7c 13 fe 81 cb 9d cc 01 	maddw.xyz vf23xyz,vf19xyz,vf12w 	lqi.xyzw vf30xyzw,(vi02++)
  1dce80:	3c 03 00 80 ff d9 db 01 	clipw.xyz vf27xyz,vf27w 	nop
  1dce88:	7c 1b fd 81 bf 81 e0 01 	mulaw.xyzw accxyzw,vf16xyzw,vf00w 	lqi.xyzw vf29xyzw,(vi03++)
  1dce90:	3c 03 00 80 be 78 f7 01 	maddaz.xyzw accxyzw,vf15xyzw,vf23z 	nop
  1dce98:	7c 33 ff 81 bd 70 f7 01 	madday.xyzw accxyzw,vf14xyzw,vf23y 	lqi.xyzw vf31xyzw,(vi06++)
  1dcea0:	ff ff 03 24 88 6d f7 01 	maddx.xyzw vf22xyzw,vf13xyzw,vf23x 	fcand vi01,0x3ffff
  1dcea8:	74 40 01 80 5c ce e0 01 	mulq.xyzw vf25xyzw,vf25xyzw,q 	iand vi01,vi08,vi01
  1dceb0:	75 50 01 80 9c f7 c0 01 	mulq.xyz vf30xyz,vf30xyz,q 	ior vi01,vi10,vi01
  1dceb8:	71 00 01 80 ea 8c df 01 	mul.xyz vf19xyz,vf17xyz,vf31xyz 	isub vi01,vi00,vi01
  1dcec0:	74 38 01 80 aa b5 f5 01 	mul.xyzw vf22xyzw,vf22xyzw,vf21xyzw 	iand vi01,vi07,vi01
  1dcec8:	00 00 00 40 7d c9 d9 81 	ftoi4[i].xyz vf25xyz,vf25xyz 	loi 2
  1dced0:	00 f0 e4 03 1e fd c0 01 	muli.xyz vf20xyz,vf31xyz,i 	sq.xyzw vf30xyzw,0(vi04)
  1dced8:	00 00 7f 43 bc 01 33 80 	mulax[i].w accw,vf00w,vf19x 	loi 255
  1dcee0:	3c 03 00 80 9f b5 e0 01 	minii.xyzw vf22xyzw,vf22xyzw,i 	nop
  1dcee8:	fd 0b 39 80 bd 00 33 00 	madday.w accw,vf00w,vf19y 	mfir.w vf25w,vi01
  1dcef0:	3c 03 00 80 ca 04 33 00 	maddz.w vf19w,vf00w,vf19z 	nop
  1dcef8:	3c 03 00 80 bf 01 e0 01 	mulaw.xyzw accxyzw,vf00xyzw,vf00w 	nop
  1dcf00:	3c 03 00 80 7c b1 f6 01 	ftoi0.xyzw vf22xyzw,vf22xyzw 	nop
  1dcf08:	02 c8 e4 03 be 58 ff 01 	maddaz.xyzw accxyzw,vf11xyzw,vf31z 	sq.xyzw vf25xyzw,2(vi04)
  1dcf10:	f2 67 0c 80 bd 50 ff 01 	madday.xyzw accxyzw,vf10xyzw,vf31y 	iaddi vi12,vi12,-1
  1dcf18:	f2 20 04 80 c8 4d ff 01 	maddx.xyzw vf23xyzw,vf09xyzw,vf31x 	iaddi vi04,vi04,3
  1dcf20:	d8 67 00 5a fc 02 d1 01 	suba.xyz accxyz,vf00xyz,vf17xyz 	ibgtz vi12,0x1dcde8
  1dcf28:	fe b7 e4 03 cb a4 d3 01 	maddw.xyz vf19xyz,vf20xyz,vf19w 	sq.xyzw vf22xyzw,-2(vi04)
  1dcf30:	b8 6f 00 5a ff 02 00 00 	nop 	ibgtz vi13,0x1dccf8
  1dcf38:	32 10 06 80 ff 02 00 00 	nop 	iaddi vi06,vi02,0
  1dcf40:	03 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1dcf60
  1dcf48:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dcf50:	a6 07 00 40 ff 02 00 00 	nop 	b 0x1dcc88
  1dcf58:	72 00 08 80 ff 02 00 00 	nop 	iaddi vi08,vi00,1
  1dcf60:	a4 07 00 40 ff 02 00 00 	nop 	b 0x1dcc88
  1dcf68:	32 00 08 80 ff 02 00 00 	nop 	iaddi vi08,vi00,0
  1dcf70:	ee 06 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dc6e8
  1dcf78:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dcf80:	03 00 00 40 ff 02 00 00 	nop 	b 0x1dcfa0
  1dcf88:	32 00 09 80 ff 02 00 00 	nop 	iaddi vi09,vi00,0
  1dcf90:	ea 06 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dc6e8
  1dcf98:	72 00 09 80 ff 02 00 00 	nop 	iaddi vi09,vi00,1
  1dcfa0:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dcfa8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dcfb0:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dcfb8:	fe 33 8c 80 ff 02 00 00 	nop 	ilwr.y vi12,(vi06)y
  1dcfc0:	fe 33 0d 81 ff 02 00 00 	nop 	ilwr.x vi13,(vi06)x
  1dcfc8:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dcfd0:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dcfd8:	06 00 0c 50 ff 02 00 00 	nop 	ibeq vi12,vi00,0x1dd010
  1dcfe0:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dcfe8:	7c 33 fd 81 ff 02 00 00 	nop 	lqi.xyzw vf29xyzw,(vi06++)
  1dcff0:	f2 67 0c 80 ff 02 00 00 	nop 	iaddi vi12,vi12,-1
  1dcff8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd000:	fc 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dcfe8
  1dd008:	7d eb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf29xyzw,(vi04++)
  1dd010:	01 30 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,1(vi06)
  1dd018:	fe 33 0c 81 ff 02 00 00 	nop 	ilwr.x vi12,(vi06)x
  1dd020:	02 30 f3 01 ec 86 fd 01 	sub.xyzw vf27xyzw,vf16xyzw,vf29xyzw 	lq.xyzw vf19xyzw,2(vi06)
  1dd028:	3f df c0 81 ff 02 00 00 	nop 	erleng p,vf27
  1dd030:	ff 07 eb 11 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	iaddiu vi11,vi00,0x7fff
  1dd038:	34 5b 0c 80 be 38 fd 01 	maddaz.xyzw accxyzw,vf07xyzw,vf29z 	iand vi12,vi11,vi12
  1dd040:	7c 33 f8 81 bd 30 fd 01 	madday.xyzw accxyzw,vf06xyzw,vf29y 	lqi.xyzw vf24xyzw,(vi06++)
  1dd048:	f0 30 0c 80 c8 2f fd 01 	maddx.xyzw vf31xyzw,vf05xyzw,vf29x 	iadd vi03,vi06,vi12
  1dd050:	7c 1b fe 81 6c 84 f3 01 	sub.xyzw vf17xyzw,vf16xyzw,vf19xyzw 	lqi.xyzw vf30xyzw,(vi03++)
  1dd058:	3c 03 00 80 58 05 e0 01 	mulx.xyzw vf21xyzw,vf00xyzw,vf00x 	nop
  1dd060:	72 58 07 80 43 03 40 00 	addw.z vf13z,vf00z,vf00w 	iaddi vi07,vi11,1
  1dd068:	b2 30 06 80 ff 02 00 00 	nop 	iaddi vi06,vi06,2
  1dd070:	7d c3 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf24xyzw,(vi04++)
  1dd078:	f2 6f 0d 80 ff 02 00 00 	nop 	iaddi vi13,vi13,-1
  1dd080:	3c 03 00 80 43 05 4d 00 	addw.z vf21z,vf00z,vf13w 	nop
  1dd088:	fd 63 f9 81 ff 02 00 00 	nop 	mfir.xyzw vf25xyzw,vi12
  1dd090:	7c 00 f8 01 3c c9 f9 01 	itof0.xyzw vf25xyzw,vf25xyzw 	lq.xyzw vf24xyzw,124(vi00)
  1dd098:	3c 03 00 80 28 c6 19 01 	add.x vf24x,vf24x,vf25x 	nop
  1dd0a0:	7c c0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf24xyzw,124(vi00)
  1dd0a8:	bf 07 00 80 ff 02 00 00 	nop 	waitp
  1dd0b0:	7c 06 3a 80 ff 02 00 00 	nop 	mfp.w vf26w,p
  1dd0b8:	3f 8f c0 81 db de fa 01 	mulw.xyzw vf27xyzw,vf27xyzw,vf26w 	erleng p,vf17
  1dd0c0:	20 00 08 10 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddiu vi08,vi00,0x20
  1dd0c8:	3c 03 00 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	nop
  1dd0d0:	3c 03 00 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	nop
  1dd0d8:	3c 03 00 80 6a f6 db 01 	mul.xyz vf25xyz,vf30xyz,vf27xyz 	nop
  1dd0e0:	3c 03 00 80 08 0d fd 01 	maddx.xyzw vf20xyzw,vf01xyzw,vf29x 	nop
  1dd0e8:	3c 9b fd 81 be 59 fe 01 	mulaz.xyzw accxyzw,vf11xyzw,vf30z 	move.xyzw vf29xyzw,vf19xyzw
  1dd0f0:	7c 33 f3 81 bd 50 fe 01 	madday.xyzw accxyzw,vf10xyzw,vf30y 	lqi.xyzw vf19xyzw,(vi06++)
  1dd0f8:	3c 03 00 80 08 4e fe 01 	maddx.xyzw vf24xyzw,vf09xyzw,vf30x 	nop
  1dd100:	bc 03 f4 81 bc 01 39 00 	mulax.w accw,vf00w,vf25x 	div q,vf00w,vf00x
  1dd108:	7c 1b fe 81 bd 00 39 00 	madday.w accw,vf00w,vf25y 	lqi.xyzw vf30xyzw,(vi03++)
  1dd110:	f2 67 0c 80 4a 06 39 00 	maddz.w vf25w,vf00w,vf25z 	iaddi vi12,vi12,-1
  1dd118:	f2 20 04 80 be 59 fb 01 	mulaz.xyzw accxyzw,vf11xyzw,vf27z 	iaddi vi04,vi04,3
  1dd120:	fe 1f 4a 08 bd 50 fb 01 	madday.xyzw accxyzw,vf10xyzw,vf27y 	ilw.z vi10,-2(vi03)z
  1dd128:	72 00 01 80 c8 4e fb 01 	maddx.xyzw vf27xyzw,vf09xyzw,vf27x 	iaddi vi01,vi00,1
  1dd130:	fe 77 e4 03 ff f9 df 01 	clipw.xyz vf31xyz,vf31w 	sq.xyzw vf14xyzw,-2(vi04)
  1dd138:	00 00 00 bf 3c a8 e0 81 	addax[i].xyzw accxyzw,vf21xyzw,vf00x 	loi -0.5
  1dd140:	b1 0a 0a 80 21 a5 e0 01 	maddq.xyzw vf20xyzw,vf20xyzw,q 	isub vi10,vi01,vi10
  1dd148:	b4 52 01 80 3c 78 c0 01 	addax.xyz accxyz,vf15xyz,vf00x 	iand vi10,vi10,vi01
  1dd150:	ff ff 03 24 3f da c0 01 	maddai.xyz accxyz,vf27xyz,i 	fcand vi01,0x3ffff
  1dd158:	74 08 09 80 8b c4 d9 01 	maddw.xyz vf18xyz,vf24xyz,vf25w 	iand vi01,vi01,vi09
  1dd160:	75 08 0a 80 7d a1 f4 01 	ftoi4.xyzw vf20xyzw,vf20xyzw 	ior vi01,vi01,vi10
  1dd168:	71 00 01 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	isub vi01,vi00,vi01
  1dd170:	74 38 01 80 ca 3f fd 01 	maddz.xyzw vf31xyzw,vf07xyzw,vf29z 	iand vi01,vi07,vi01
  1dd178:	00 40 02 34 dc 6d 40 00 	mulq.z vf23z,vf13z,q 	fmand vi02,vi08
  1dd180:	08 00 02 50 dc 95 80 01 	mulq.xy vf23xy,vf18xy,q 	ibeq vi02,vi00,0x1dd1c8
  1dd188:	7c 06 3a 80 c0 8e e0 01 	addx.xyzw vf27xyzw,vf17xyzw,vf00x 	mfp.w vf26w,p
  1dd190:	00 00 80 3e ac 94 8f 81 	sub[i].xy vf18xy,vf18xy,vf15xy 	loi 0.25
  1dd198:	3c 03 00 80 3e 02 40 00 	addai.z accz,vf00z,i 	nop
  1dd1a0:	3c 03 00 80 ad 95 52 00 	msub.z vf22z,vf18z,vf18z 	nop
  1dd1a8:	be 03 76 81 ff 02 00 00 	nop 	rsqrt q,vf00w,vf00x
  1dd1b0:	bf 03 00 80 fc 7a 92 01 	suba.xy accxy,vf15xy,vf18xy 	waitq
  1dd1b8:	3c 03 00 80 a1 94 80 01 	maddq.xy vf18xy,vf18xy,q 	nop
  1dd1c0:	3c 03 00 80 da 95 97 01 	mulz.xy vf23xy,vf18xy,vf23z 	nop
  1dd1c8:	ff a7 e4 03 6c 84 f3 01 	sub.xyzw vf17xyzw,vf16xyzw,vf19xyzw 	sq.xyzw vf20xyzw,-1(vi04)
  1dd1d0:	ff 27 21 0a bf f9 e0 01 	mulaw.xyzw accxyzw,vf31xyzw,vf00w 	isw.w vi01,-1(vi04)w
  1dd1d8:	db 67 00 5a bd 30 fd 01 	madday.xyzw accxyzw,vf06xyzw,vf29y 	ibgtz vi12,0x1dd0b8
  1dd1e0:	fd bf e4 03 c8 2f fd 01 	maddx.xyzw vf31xyzw,vf05xyzw,vf29x 	sq.xyzw vf23xyzw,-3(vi04)
  1dd1e8:	c4 6f 00 5a ff 02 00 00 	nop 	ibgtz vi13,0x1dd010
  1dd1f0:	f2 1f 06 80 ff 02 00 00 	nop 	iaddi vi06,vi03,-1
  1dd1f8:	03 00 09 50 ff 02 00 00 	nop 	ibeq vi09,vi00,0x1dd218
  1dd200:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dd208:	b2 07 00 40 ff 02 00 00 	nop 	b 0x1dcfa0
  1dd210:	72 00 09 80 ff 02 00 00 	nop 	iaddi vi09,vi00,1
  1dd218:	b0 07 00 40 ff 02 00 00 	nop 	b 0x1dcfa0
  1dd220:	32 00 09 80 ff 02 00 00 	nop 	iaddi vi09,vi00,0
  1dd228:	d3 00 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8c8
  1dd230:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd238:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dd240:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd248:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dd250:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dd258:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dd260:	7c 33 fe 81 ff 02 00 00 	nop 	lqi.xyzw vf30xyzw,(vi06++)
  1dd268:	7c 33 ea 81 ff 02 00 00 	nop 	lqi.xyzw vf10xyzw,(vi06++)
  1dd270:	7c 33 eb 81 ff 02 00 00 	nop 	lqi.xyzw vf11xyzw,(vi06++)
  1dd278:	7c 33 ff 81 ff 02 00 00 	nop 	lqi.xyzw vf31xyzw,(vi06++)
  1dd280:	01 00 07 10 ff 02 00 00 	nop 	iaddiu vi07,vi00,1
  1dd288:	7c 33 fb 81 ff 02 00 00 	nop 	lqi.xyzw vf27xyzw,(vi06++)
  1dd290:	7c 33 fc 81 ff 02 00 00 	nop 	lqi.xyzw vf28xyzw,(vi06++)
  1dd298:	fe 33 0c 81 19 53 df 01 	muly.xyz vf12xyz,vf10xyz,vf31y 	ilwr.x vi12,(vi06)x
  1dd2a0:	7c 33 f2 81 59 5b df 01 	muly.xyz vf13xyz,vf11xyz,vf31y 	lqi.xyzw vf18xyzw,(vi06++)
  1dd2a8:	fe 33 2d 80 98 52 df 01 	mulx.xyz vf10xyz,vf10xyz,vf31x 	ilwr.w vi13,(vi06)w
  1dd2b0:	7c 33 fd 81 d8 5a df 01 	mulx.xyz vf11xyz,vf11xyz,vf31x 	lqi.xyzw vf29xyzw,(vi06++)
  1dd2b8:	ff 07 eb 11 ff 02 00 00 	nop 	iaddiu vi11,vi00,0x7fff
  1dd2c0:	7d 93 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf18xyzw,(vi04++)
  1dd2c8:	74 6a 07 80 ff 02 00 00 	nop 	iand vi09,vi13,vi07
  1dd2d0:	00 00 00 22 ff 02 00 00 	nop 	fcset 0
  1dd2d8:	34 5b 0c 80 ff 02 00 00 	nop 	iand vi12,vi11,vi12
  1dd2e0:	fd 63 f9 81 ff 02 00 00 	nop 	mfir.xyzw vf25xyzw,vi12
  1dd2e8:	7c 00 f8 01 3c c9 f9 01 	itof0.xyzw vf25xyzw,vf25xyzw 	lq.xyzw vf24xyzw,124(vi00)
  1dd2f0:	3c 03 00 80 28 c6 99 00 	add.y vf24y,vf24y,vf25y 	nop
  1dd2f8:	7c c0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf24xyzw,124(vi00)
  1dd300:	03 48 00 5a ff 02 00 00 	nop 	ibgtz vi09,0x1dd320
  1dd308:	02 00 08 10 3c f0 e0 01 	addax.xyzw accxyzw,vf30xyzw,vf00x 	iaddiu vi08,vi00,2
  1dd310:	03 00 00 40 bc 60 dd 01 	maddax.xyz accxyz,vf12xyz,vf29x 	b 0x1dd330
  1dd318:	7d e3 e4 81 c9 6d dd 01 	maddy.xyz vf23xyz,vf13xyz,vf29y 	sqi.xyzw vf28xyzw,(vi04++)
  1dd320:	3c 03 00 80 bc 50 dd 01 	maddax.xyz accxyz,vf10xyz,vf29x 	nop
  1dd328:	7d db e4 81 c9 5d dd 01 	maddy.xyz vf23xyz,vf11xyz,vf29y 	sqi.xyzw vf27xyzw,(vi04++)
  1dd330:	34 5b 0c 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iand vi12,vi11,vi12
  1dd338:	b4 68 08 80 ff 02 00 00 	nop 	iand vi02,vi13,vi08
  1dd340:	f2 67 0c 80 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	iaddi vi12,vi12,-1
  1dd348:	fe 33 2d 80 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	ilwr.w vi13,(vi06)w
  1dd350:	3c 03 00 80 48 0e f7 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf23x 	nop
  1dd358:	01 20 04 10 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	iaddiu vi04,vi04,1
  1dd360:	72 58 0a 80 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	iaddi vi10,vi11,1
  1dd368:	74 6a 07 80 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	iand vi09,vi13,vi07
  1dd370:	bc 03 f9 81 88 2e f7 01 	maddx.xyzw vf26xyzw,vf05xyzw,vf23x 	div q,vf00w,vf00x
  1dd378:	3c 03 00 80 ff d1 da 01 	clipw.xyz vf26xyz,vf26w 	nop
  1dd380:	bf 03 00 80 5c ce e0 01 	mulq.xyzw vf25xyzw,vf25xyzw,q 	waitq
  1dd388:	02 10 00 5a ff 02 00 00 	nop 	ibgtz vi02,0x1dd3a0
  1dd390:	ff ff 03 24 ff 02 00 00 	nop 	fcand vi01,0x3ffff
  1dd398:	00 00 00 00 00 02 00 4a 	*unknown* 	lq. vf00,0(vi00)
  1dd3a0:	06 00 01 50 ff 02 00 00 	nop 	ibeq vi01,vi00,0x1dd3d8
  1dd3a8:	7c 33 fd 81 7d c9 f8 01 	ftoi4.xyzw vf24xyzw,vf25xyzw 	lqi.xyzw vf29xyzw,(vi06++)
  1dd3b0:	ff c7 e4 03 ff 02 00 00 	nop 	sq.xyzw vf24xyzw,-1(vi04)
  1dd3b8:	e9 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dd308
  1dd3c0:	ff 27 2a 0a ff 02 00 00 	nop 	isw.w vi10,-1(vi04)w
  1dd3c8:	d0 07 00 40 ff 02 00 40 	nop[e] 	b 0x1dd250
  1dd3d0:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dd3d8:	e5 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dd308
  1dd3e0:	ff c7 e4 03 ff 02 00 00 	nop 	sq.xyzw vf24xyzw,-1(vi04)
  1dd3e8:	cc 07 00 40 ff 02 00 40 	nop[e] 	b 0x1dd250
  1dd3f0:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dd3f8:	9a 00 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8d0
  1dd400:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd408:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dd410:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd418:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dd420:	fe 33 88 80 ff 02 00 00 	nop 	ilwr.y vi08,(vi06)y
  1dd428:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dd430:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dd438:	ff 07 ea 11 ff 02 00 00 	nop 	iaddiu vi10,vi00,0x7fff
  1dd440:	06 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1dd478
  1dd448:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dd450:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1dd458:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1dd460:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd468:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1dd450
  1dd470:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1dd478:	01 30 f7 01 ff 02 00 00 	nop 	lq.xyzw vf23xyzw,1(vi06)
  1dd480:	fe 33 08 81 ff 02 00 00 	nop 	ilwr.x vi08,(vi06)x
  1dd488:	7c 33 f2 81 ff 02 00 00 	nop 	lqi.xyzw vf18xyzw,(vi06++)
  1dd490:	72 30 06 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddi vi06,vi06,1
  1dd498:	3c 03 00 80 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	nop
  1dd4a0:	7c 33 fb 81 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	lqi.xyzw vf27xyzw,(vi06++)
  1dd4a8:	34 42 0a 80 08 0e f7 01 	maddx.xyzw vf24xyzw,vf01xyzw,vf23x 	iand vi08,vi08,vi10
  1dd4b0:	7e 00 2d 00 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	lq.w vf13w,126(vi00)
  1dd4b8:	7d 93 e4 81 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	sqi.xyzw vf18xyzw,(vi04++)
  1dd4c0:	72 50 0a 80 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	iaddi vi10,vi10,1
  1dd4c8:	bc 03 f8 81 2f c7 2d 00 	mini.w vf28w,vf24w,vf13w 	div q,vf00w,vf00x
  1dd4d0:	7c 33 f7 81 48 2e f7 01 	maddx.xyzw vf25xyzw,vf05xyzw,vf23x 	lqi.xyzw vf23xyzw,(vi06++)
  1dd4d8:	fd 43 fa 81 ff 02 00 00 	nop 	mfir.xyzw vf26xyzw,vi08
  1dd4e0:	7d 00 fe 01 3c d1 fa 01 	itof0.xyzw vf26xyzw,vf26xyzw 	lq.xyzw vf30xyzw,125(vi00)
  1dd4e8:	3c 03 00 80 a8 f7 1a 01 	add.x vf30x,vf30x,vf26x 	nop
  1dd4f0:	7d f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,125(vi00)
  1dd4f8:	3c 03 00 80 ea de 3c 00 	mul.w vf27w,vf27w,vf28w 	nop
  1dd500:	3c 03 00 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	nop
  1dd508:	b2 20 04 80 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	iaddi vi04,vi04,2
  1dd510:	f2 47 08 80 ff c9 d9 01 	clipw.xyz vf25xyz,vf25w 	iaddi vi08,vi08,-1
  1dd518:	3c db df 81 9c c6 e0 01 	mulq.xyzw vf26xyzw,vf24xyzw,q 	move.xyz vf31xyz,vf27xyz
  1dd520:	3c bb fe 81 dc df 20 00 	mulq.w vf31w,vf27w,q 	move.xyzw vf30xyzw,vf23xyzw
  1dd528:	7c 33 fb 81 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	lqi.xyzw vf27xyzw,(vi06++)
  1dd530:	3f 00 00 24 08 0e f7 01 	maddx.xyzw vf24xyzw,vf01xyzw,vf23x 	fcand vi01,0x3f
  1dd538:	71 00 01 80 7d d1 fa 01 	ftoi4.xyzw vf26xyzw,vf26xyzw 	isub vi01,vi00,vi01
  1dd540:	74 50 01 80 7c f9 ff 01 	ftoi0.xyzw vf31xyzw,vf31xyzw 	iand vi01,vi10,vi01
  1dd548:	7c 33 f7 81 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	lqi.xyzw vf23xyzw,(vi06++)
  1dd550:	bc 03 f8 81 2f c7 2d 00 	mini.w vf28w,vf24w,vf13w 	div q,vf00w,vf00x
  1dd558:	ff d7 e4 03 be 38 fe 01 	maddaz.xyzw accxyzw,vf07xyzw,vf30z 	sq.xyzw vf26xyzw,-1(vi04)
  1dd560:	ff 27 21 0a bd 30 fe 01 	madday.xyzw accxyzw,vf06xyzw,vf30y 	isw.w vi01,-1(vi04)w
  1dd568:	f2 47 00 5a 48 2e fe 01 	maddx.xyzw vf25xyzw,vf05xyzw,vf30x 	ibgtz vi08,0x1dd500
  1dd570:	fe ff e4 03 ea de 3c 00 	mul.w vf27w,vf27w,vf28w 	sq.xyzw vf31xyzw,-2(vi04)
  1dd578:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dd580:	d0 07 00 40 ff 02 00 00 	nop 	b 0x1dd408
  1dd588:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd590:	67 00 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8d0
  1dd598:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd5a0:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dd5a8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd5b0:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dd5b8:	fe 33 88 80 ff 02 00 00 	nop 	ilwr.y vi08,(vi06)y
  1dd5c0:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dd5c8:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dd5d0:	ff 07 ea 11 ff 02 00 00 	nop 	iaddiu vi10,vi00,0x7fff
  1dd5d8:	06 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1dd610
  1dd5e0:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dd5e8:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1dd5f0:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1dd5f8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd600:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1dd5e8
  1dd608:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1dd610:	01 30 f8 01 ff 02 00 00 	nop 	lq.xyzw vf24xyzw,1(vi06)
  1dd618:	fe 33 08 81 ff 02 00 00 	nop 	ilwr.x vi08,(vi06)x
  1dd620:	00 30 f2 01 ff 02 00 00 	nop 	lq.xyzw vf18xyzw,0(vi06)
  1dd628:	02 30 fb 01 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lq.xyzw vf27xyzw,2(vi06)
  1dd630:	03 30 f7 01 be 18 f8 01 	maddaz.xyzw accxyzw,vf03xyzw,vf24z 	lq.xyzw vf23xyzw,3(vi06)
  1dd638:	03 30 06 10 bd 10 f8 01 	madday.xyzw accxyzw,vf02xyzw,vf24y 	iaddiu vi06,vi06,3
  1dd640:	7e 00 2d 00 08 0e f8 01 	maddx.xyzw vf24xyzw,vf01xyzw,vf24x 	lq.w vf13w,126(vi00)
  1dd648:	34 42 0a 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iand vi08,vi08,vi10
  1dd650:	7d 93 e4 81 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	sqi.xyzw vf18xyzw,(vi04++)
  1dd658:	3c 03 00 80 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	nop
  1dd660:	bc 03 f8 81 88 0f f7 01 	maddx.xyzw vf30xyzw,vf01xyzw,vf23x 	div q,vf00w,vf00x
  1dd668:	34 42 0a 80 2f c7 2d 00 	mini.w vf28w,vf24w,vf13w 	iand vi08,vi08,vi10
  1dd670:	f2 47 08 80 db df c0 01 	mulw.xyz vf31xyz,vf27xyz,vf00w 	iaddi vi08,vi08,-1
  1dd678:	72 40 09 80 ff 02 00 00 	nop 	iaddi vi09,vi08,1
  1dd680:	fd 4b f6 81 ff 02 00 00 	nop 	mfir.xyzw vf22xyzw,vi09
  1dd688:	7d 00 fd 01 3c b1 f6 01 	itof0.xyzw vf22xyzw,vf22xyzw 	lq.xyzw vf29xyzw,125(vi00)
  1dd690:	3c 03 00 80 68 ef 16 01 	add.x vf29x,vf29x,vf22x 	nop
  1dd698:	7d e8 e0 03 ff 02 00 00 	nop 	sq.xyzw vf29xyzw,125(vi00)
  1dd6a0:	bf 03 00 80 ea de 3c 00 	mul.w vf27w,vf27w,vf28w 	waitq
  1dd6a8:	b2 30 06 80 9c c6 e0 01 	mulq.xyzw vf26xyzw,vf24xyzw,q 	iaddi vi06,vi06,2
  1dd6b0:	00 30 f7 01 dc df 20 00 	mulq.w vf31w,vf27w,q 	lq.xyzw vf23xyzw,0(vi06)
  1dd6b8:	bc 03 fe 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	div q,vf00w,vf00x
  1dd6c0:	ff 37 fb 01 2f f7 2d 00 	mini.w vf28w,vf30w,vf13w 	lq.xyzw vf27xyzw,-1(vi06)
  1dd6c8:	3c f3 f8 81 7d d1 fa 01 	ftoi4.xyzw vf26xyzw,vf26xyzw 	move.xyzw vf24xyzw,vf30xyzw
  1dd6d0:	f2 47 08 80 7c f9 ff 01 	ftoi0.xyzw vf31xyzw,vf31xyzw 	iaddi vi08,vi08,-1
  1dd6d8:	b2 20 04 80 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	iaddi vi04,vi04,2
  1dd6e0:	3c 03 00 80 ea de 3c 00 	mul.w vf27w,vf27w,vf28w 	nop
  1dd6e8:	ff d7 e4 03 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	sq.xyzw vf26xyzw,-1(vi04)
  1dd6f0:	f6 47 00 5a 88 0f f7 01 	maddx.xyzw vf30xyzw,vf01xyzw,vf23x 	ibgtz vi08,0x1dd6a8
  1dd6f8:	fe ff e4 03 db df c0 01 	mulw.xyz vf31xyz,vf27xyz,vf00w 	sq.xyzw vf31xyzw,-2(vi04)
  1dd700:	3c 03 00 80 9c c6 e0 01 	mulq.xyzw vf26xyzw,vf24xyzw,q 	nop
  1dd708:	3c 03 00 80 dc df 20 00 	mulq.w vf31w,vf27w,q 	nop
  1dd710:	3c 03 00 80 7d d1 fa 01 	ftoi4.xyzw vf26xyzw,vf26xyzw 	nop
  1dd718:	3c 03 00 80 7c f9 ff 01 	ftoi0.xyzw vf31xyzw,vf31xyzw 	nop
  1dd720:	01 d0 e4 03 ff 02 00 00 	nop 	sq.xyzw vf26xyzw,1(vi04)
  1dd728:	00 f8 e4 03 ff 02 00 00 	nop 	sq.xyzw vf31xyzw,0(vi04)
  1dd730:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dd738:	cc 07 00 40 ff 02 00 00 	nop 	b 0x1dd5a0
  1dd740:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd748:	30 00 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8d0
  1dd750:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd758:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dd760:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd768:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dd770:	fe 33 8c 80 ff 02 00 00 	nop 	ilwr.y vi12,(vi06)y
  1dd778:	fe 33 0d 81 ff 02 00 00 	nop 	ilwr.x vi13,(vi06)x
  1dd780:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dd788:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dd790:	06 00 0c 50 ff 02 00 00 	nop 	ibeq vi12,vi00,0x1dd7c8
  1dd798:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dd7a0:	7c 33 fd 81 ff 02 00 00 	nop 	lqi.xyzw vf29xyzw,(vi06++)
  1dd7a8:	f2 67 0c 80 ff 02 00 00 	nop 	iaddi vi12,vi12,-1
  1dd7b0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd7b8:	fc 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dd7a0
  1dd7c0:	7d eb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf29xyzw,(vi04++)
  1dd7c8:	01 30 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,1(vi06)
  1dd7d0:	fe 33 0c 81 ff 02 00 00 	nop 	ilwr.x vi12,(vi06)x
  1dd7d8:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1dd7e0:	ff 07 eb 11 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddiu vi11,vi00,0x7fff
  1dd7e8:	34 5b 0c 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iand vi12,vi11,vi12
  1dd7f0:	72 30 06 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	iaddi vi06,vi06,1
  1dd7f8:	7c 33 fd 81 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	lqi.xyzw vf29xyzw,(vi06++)
  1dd800:	fd 63 fa 81 ff 02 00 00 	nop 	mfir.xyzw vf26xyzw,vi12
  1dd808:	7b 00 fe 01 3c d1 fa 01 	itof0.xyzw vf26xyzw,vf26xyzw 	lq.xyzw vf30xyzw,123(vi00)
  1dd810:	3c 03 00 80 a8 f7 1a 01 	add.x vf30x,vf30x,vf26x 	nop
  1dd818:	7b f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,123(vi00)
  1dd820:	f2 67 0c 80 98 05 e0 01 	mulx.xyzw vf22xyzw,vf00xyzw,vf00x 	iaddi vi12,vi12,-1
  1dd828:	bc 03 f9 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	div q,vf00w,vf00x
  1dd830:	3c cb fa 81 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	move.xyzw vf26xyzw,vf25xyzw
  1dd838:	ff 00 80 3f bd 10 fd 81 	madday[i].xyzw accxyzw,vf02xyzw,vf29y 	loi 1.00003
  1dd840:	7c 33 fd 81 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	lqi.xyzw vf29xyzw,(vi06++)
  1dd848:	bf 03 00 80 a2 b5 e0 01 	addi.xyzw vf22xyzw,vf22xyzw,i 	waitq
  1dd850:	bc 03 f9 81 1c d6 e0 01 	mulq.xyzw vf24xyzw,vf26xyzw,q 	div q,vf00w,vf00x
  1dd858:	3c cb fa 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	move.xyzw vf26xyzw,vf25xyzw
  1dd860:	7d bb e4 81 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	sqi.xyzw vf23xyzw,(vi04++)
  1dd868:	f2 67 0c 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	iaddi vi12,vi12,-1
  1dd870:	7c 33 fd 81 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	lqi.xyzw vf29xyzw,(vi06++)
  1dd878:	fa 67 00 5a 7d c1 f7 01 	ftoi4.xyzw vf23xyzw,vf24xyzw 	ibgtz vi12,0x1dd850
  1dd880:	7d b3 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf22xyzw,(vi04++)
  1dd888:	f2 6f 0d 80 1c d6 e0 01 	mulq.xyzw vf24xyzw,vf26xyzw,q 	iaddi vi13,vi13,-1
  1dd890:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1dd898:	7d b3 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf22xyzw,(vi04++)
  1dd8a0:	b2 37 06 80 7d c1 f7 01 	ftoi4.xyzw vf23xyzw,vf24xyzw 	iaddi vi06,vi06,-2
  1dd8a8:	e3 6f 00 5a ff 02 00 00 	nop 	ibgtz vi13,0x1dd7c8
  1dd8b0:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1dd8b8:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dd8c0:	d2 07 00 40 ff 02 00 00 	nop 	b 0x1dd758
  1dd8c8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd8d0:	00 00 e1 01 ff 02 00 00 	nop 	lq.xyzw vf01xyzw,0(vi00)
  1dd8d8:	01 00 e2 01 ff 02 00 00 	nop 	lq.xyzw vf02xyzw,1(vi00)
  1dd8e0:	02 00 e3 01 ff 02 00 00 	nop 	lq.xyzw vf03xyzw,2(vi00)
  1dd8e8:	03 00 e4 01 ff 02 00 00 	nop 	lq.xyzw vf04xyzw,3(vi00)
  1dd8f0:	04 00 e5 01 ff 02 00 00 	nop 	lq.xyzw vf05xyzw,4(vi00)
  1dd8f8:	05 00 e6 01 ff 02 00 00 	nop 	lq.xyzw vf06xyzw,5(vi00)
  1dd900:	06 00 e7 01 ff 02 00 00 	nop 	lq.xyzw vf07xyzw,6(vi00)
  1dd908:	07 00 e8 01 ff 02 00 00 	nop 	lq.xyzw vf08xyzw,7(vi00)
  1dd910:	08 00 e9 01 ff 02 00 00 	nop 	lq.xyzw vf09xyzw,8(vi00)
  1dd918:	09 00 ea 01 ff 02 00 00 	nop 	lq.xyzw vf10xyzw,9(vi00)
  1dd920:	0a 00 eb 01 ff 02 00 00 	nop 	lq.xyzw vf11xyzw,10(vi00)
  1dd928:	00 78 00 48 ff 02 00 00 	nop 	jr vi15
  1dd930:	0b 00 ec 01 ff 02 00 00 	nop 	lq.xyzw vf12xyzw,11(vi00)
  1dd938:	f2 07 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8d0
  1dd940:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd948:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dd950:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd958:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dd960:	fe 33 8c 80 ff 02 00 00 	nop 	ilwr.y vi12,(vi06)y
  1dd968:	fe 33 0d 81 ff 02 00 00 	nop 	ilwr.x vi13,(vi06)x
  1dd970:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dd978:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dd980:	06 00 0c 50 ff 02 00 00 	nop 	ibeq vi12,vi00,0x1dd9b8
  1dd988:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dd990:	7c 33 fd 81 ff 02 00 00 	nop 	lqi.xyzw vf29xyzw,(vi06++)
  1dd998:	f2 67 0c 80 ff 02 00 00 	nop 	iaddi vi12,vi12,-1
  1dd9a0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dd9a8:	fc 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1dd990
  1dd9b0:	7d eb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf29xyzw,(vi04++)
  1dd9b8:	01 30 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,1(vi06)
  1dd9c0:	fe 33 0c 81 ff 02 00 00 	nop 	ilwr.x vi12,(vi06)x
  1dd9c8:	7c 33 f2 81 ff 02 00 00 	nop 	lqi.xyzw vf18xyzw,(vi06++)
  1dd9d0:	ff 07 eb 11 ff 02 00 00 	nop 	iaddiu vi11,vi00,0x7fff
  1dd9d8:	34 5b 0c 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iand vi12,vi11,vi12
  1dd9e0:	b0 30 0c 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iadd vi02,vi06,vi12
  1dd9e8:	72 30 06 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	iaddi vi06,vi06,1
  1dd9f0:	7c 33 fd 81 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	lqi.xyzw vf29xyzw,(vi06++)
  1dd9f8:	f0 10 0c 80 ff 02 00 00 	nop 	iadd vi03,vi02,vi12
  1dda00:	fd 63 fa 81 ff 02 00 00 	nop 	mfir.xyzw vf26xyzw,vi12
  1dda08:	7b 00 fe 01 3c d1 fa 01 	itof0.xyzw vf26xyzw,vf26xyzw 	lq.xyzw vf30xyzw,123(vi00)
  1dda10:	3c 03 00 80 a8 f7 1a 01 	add.x vf30x,vf30x,vf26x 	nop
  1dda18:	7b f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,123(vi00)
  1dda20:	72 58 08 80 ff 02 00 00 	nop 	iaddi vi08,vi11,1
  1dda28:	bc 03 f9 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	div q,vf00w,vf00x
  1dda30:	3c cb fa 81 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	move.xyzw vf26xyzw,vf25xyzw
  1dda38:	7d 93 e4 81 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	sqi.xyzw vf18xyzw,(vi04++)
  1dda40:	70 22 0c 80 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	iadd vi09,vi04,vi12
  1dda48:	7c 1b ff 81 ff 02 00 00 	nop 	lqi.xyzw vf31xyzw,(vi03++)
  1dda50:	70 4a 0c 80 ff 02 00 00 	nop 	iadd vi09,vi09,vi12
  1dda58:	7c 13 fe 81 ff 02 00 00 	nop 	lqi.xyzw vf30xyzw,(vi02++)
  1dda60:	70 4a 0c 80 ff 02 00 00 	nop 	iadd vi09,vi09,vi12
  1dda68:	32 4f 09 80 ff 02 00 00 	nop 	iaddi vi09,vi09,-4
  1dda70:	7c 33 fd 81 ff 02 00 00 	nop 	lqi.xyzw vf29xyzw,(vi06++)
  1dda78:	72 00 01 80 ff 02 00 00 	nop 	iaddi vi01,vi00,1
  1dda80:	fc fb 4a 80 1c d6 e0 01 	mulq.xyzw vf24xyzw,vf26xyzw,q 	mtir vi10,vf31z
  1dda88:	7c 13 fe 81 dc f6 c0 01 	mulq.xyz vf27xyz,vf30xyz,q 	lqi.xyzw vf30xyzw,(vi02++)
  1dda90:	bc 03 f9 81 80 ce e0 01 	addx.xyzw vf26xyzw,vf25xyzw,vf00x 	div q,vf00w,vf00x
  1dda98:	7c 33 fc 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lqi.xyzw vf28xyzw,(vi06++)
  1ddaa0:	b4 52 01 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iand vi10,vi10,vi01
  1ddaa8:	b1 42 0a 80 7d c1 d8 01 	ftoi4.xyz vf24xyz,vf24xyz 	isub vi10,vi08,vi10
  1ddab0:	7d db e4 81 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	sqi.xyzw vf27xyzw,(vi04++)
  1ddab8:	fd 53 38 80 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	mfir.w vf24w,vi10
  1ddac0:	7d fb e4 81 40 e7 e0 01 	addx.xyzw vf29xyzw,vf28xyzw,vf00x 	sqi.xyzw vf31xyzw,(vi04++)
  1ddac8:	7c 1b ff 81 ff 02 00 00 	nop 	lqi.xyzw vf31xyzw,(vi03++)
  1ddad0:	f5 4f 04 52 ff 02 00 00 	nop 	ibne vi04,vi09,0x1dda80
  1ddad8:	7d c3 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf24xyzw,(vi04++)
  1ddae0:	f2 6f 0d 80 1c d6 e0 01 	mulq.xyzw vf24xyzw,vf26xyzw,q 	iaddi vi13,vi13,-1
  1ddae8:	fc fb 4a 80 dc f6 c0 01 	mulq.xyz vf27xyz,vf30xyz,q 	mtir vi10,vf31z
  1ddaf0:	b0 01 03 80 7d c1 f8 01 	ftoi4.xyzw vf24xyzw,vf24xyzw 	iadd vi06,vi00,vi03
  1ddaf8:	b4 52 01 80 ff 02 00 00 	nop 	iand vi10,vi10,vi01
  1ddb00:	b1 42 0a 80 ff 02 00 00 	nop 	isub vi10,vi08,vi10
  1ddb08:	fd 53 38 80 ff 02 00 00 	nop 	mfir.w vf24w,vi10
  1ddb10:	7d db e4 81 ff 02 00 00 	nop 	sqi.xyzw vf27xyzw,(vi04++)
  1ddb18:	7d fb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf31xyzw,(vi04++)
  1ddb20:	d2 6f 00 5a ff 02 00 00 	nop 	ibgtz vi13,0x1dd9b8
  1ddb28:	7d c3 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf24xyzw,(vi04++)
  1ddb30:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1ddb38:	c1 07 00 40 ff 02 00 00 	nop 	b 0x1dd948
  1ddb40:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ddb48:	b0 07 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8d0
  1ddb50:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ddb58:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1ddb60:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ddb68:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1ddb70:	fe 33 88 80 ff 02 00 00 	nop 	ilwr.y vi08,(vi06)y
  1ddb78:	fe 33 05 81 ff 02 00 00 	nop 	ilwr.x vi05,(vi06)x
  1ddb80:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1ddb88:	e0 30 0d 10 ff 02 00 00 	nop 	iaddiu vi13,vi06,0xe0
  1ddb90:	01 00 09 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,1
  1ddb98:	45 00 07 10 ff 02 00 00 	nop 	iaddiu vi07,vi00,0x45
  1ddba0:	00 00 00 00 00 03 00 4a 	*unknown* 	lq. vf00,0(vi00)
  1ddba8:	06 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1ddbe0
  1ddbb0:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1ddbb8:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1ddbc0:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1ddbc8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ddbd0:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1ddbb8
  1ddbd8:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1ddbe0:	01 30 f7 01 ff 02 00 00 	nop 	lq.xyzw vf23xyzw,1(vi06)
  1ddbe8:	fe 33 08 81 ff 02 00 00 	nop 	ilwr.x vi08,(vi06)x
  1ddbf0:	f2 2f 05 80 ff 02 00 00 	nop 	iaddi vi05,vi05,-1
  1ddbf8:	7c 33 f2 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lqi.xyzw vf18xyzw,(vi06++)
  1ddc00:	ff 07 e1 11 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	iaddiu vi01,vi00,0x7fff
  1ddc08:	34 0a 08 80 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	iand vi08,vi01,vi08
  1ddc10:	b0 30 08 80 08 0e f7 01 	maddx.xyzw vf24xyzw,vf01xyzw,vf23x 	iadd vi02,vi06,vi08
  1ddc18:	f0 10 08 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	iadd vi03,vi02,vi08
  1ddc20:	72 30 06 80 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	iaddi vi06,vi06,1
  1ddc28:	72 08 0a 80 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	iaddi vi10,vi01,1
  1ddc30:	bc 03 f8 81 48 2e f7 01 	maddx.xyzw vf25xyzw,vf05xyzw,vf23x 	div q,vf00w,vf00x
  1ddc38:	7d 93 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf18xyzw,(vi04++)
  1ddc40:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1ddc48:	fd 43 ff 81 ff 02 00 00 	nop 	mfir.xyzw vf31xyzw,vi08
  1ddc50:	7b 00 fe 01 3c f9 ff 01 	itof0.xyzw vf31xyzw,vf31xyzw 	lq.xyzw vf30xyzw,123(vi00)
  1ddc58:	3c 03 00 80 a8 f7 9f 00 	add.y vf30y,vf30y,vf31y 	nop
  1ddc60:	7b f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,123(vi00)
  1ddc68:	3c 03 00 80 ff c9 d9 01 	clipw.xyz vf25xyz,vf25w 	nop
  1ddc70:	7c 1b ff 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lqi.xyzw vf31xyzw,(vi03++)
  1ddc78:	7c 13 fe 81 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	lqi.xyzw vf30xyzw,(vi02++)
  1ddc80:	ff 1f 4c 08 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	ilw.z vi12,-1(vi03)z
  1ddc88:	ff ff 03 24 9c c6 e0 01 	mulq.xyzw vf26xyzw,vf24xyzw,q 	fcand vi01,0x3ffff
  1ddc90:	01 f8 e4 03 c8 0e f7 01 	maddx.xyzw vf27xyzw,vf01xyzw,vf23x 	sq.xyzw vf31xyzw,1(vi04)
  1ddc98:	f2 47 08 80 9c f7 c0 01 	mulq.xyz vf30xyz,vf30xyz,q 	iaddi vi08,vi08,-1
  1ddca0:	34 63 09 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	iand vi12,vi12,vi09
  1ddca8:	7c 33 f6 81 7d d1 fa 01 	ftoi4.xyzw vf26xyzw,vf26xyzw 	lqi.xyzw vf22xyzw,(vi06++)
  1ddcb0:	bc 03 fb 81 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	div q,vf00w,vf00x
  1ddcb8:	00 f0 e4 03 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	sq.xyzw vf30xyzw,0(vi04)
  1ddcc0:	0f 00 0c 50 48 2e f7 01 	maddx.xyzw vf25xyzw,vf05xyzw,vf23x 	ibeq vi12,vi00,0x1ddd40
  1ddcc8:	02 d0 e4 03 00 de e0 01 	addx.xyzw vf24xyzw,vf27xyzw,vf00x 	sq.xyzw vf26xyzw,2(vi04)
  1ddcd0:	0e 00 01 50 ff 02 00 00 	nop 	ibeq vi01,vi00,0x1ddd48
  1ddcd8:	df f7 fd 26 ff 02 00 00 	nop 	fcor vi01,0xfdf7df
  1ddce0:	0b 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1ddd40
  1ddce8:	f7 7d ff 26 ff 02 00 00 	nop 	fcor vi01,0xff7df7
  1ddcf0:	09 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1ddd40
  1ddcf8:	fb be ff 26 ff 02 00 00 	nop 	fcor vi01,0xffbefb
  1ddd00:	07 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1ddd40
  1ddd08:	7d df ff 26 ff 02 00 00 	nop 	fcor vi01,0xffdf7d
  1ddd10:	05 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1ddd40
  1ddd18:	be ef ff 26 ff 02 00 00 	nop 	fcor vi01,0xffefbe
  1ddd20:	03 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1ddd40
  1ddd28:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ddd30:	09 00 0f 42 ff 02 00 00 	nop 	bal vi15,0x1ddd80
  1ddd38:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ddd40:	02 20 2a 0a ff 02 00 00 	nop 	isw.w vi10,2(vi04)w
  1ddd48:	e4 47 00 5a c0 b5 e0 01 	addx.xyzw vf23xyzw,vf22xyzw,vf00x 	ibgtz vi08,0x1ddc70
  1ddd50:	f2 20 04 80 ff c9 d9 01 	clipw.xyz vf25xyz,vf25w 	iaddi vi04,vi04,3
  1ddd58:	d0 2f 00 5a ff 02 00 00 	nop 	ibgtz vi05,0x1ddbe0
  1ddd60:	b0 01 03 80 ff 02 00 00 	nop 	iadd vi06,vi00,vi03
  1ddd68:	fc 6e 00 80 ff 02 00 00 	nop 	xgkick vi13
  1ddd70:	bd 07 00 40 ff 02 00 00 	nop 	b 0x1ddb60
  1ddd78:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ddd80:	fb 37 f3 01 ff 02 00 00 	nop 	lq.xyzw vf19xyzw,-5(vi06)
  1ddd88:	fc 37 f4 01 ff 02 00 00 	nop 	lq.xyzw vf20xyzw,-4(vi06)
  1ddd90:	fd 17 fa 01 ff 02 00 00 	nop 	lq.xyzw vf26xyzw,-3(vi02)
  1ddd98:	fe 17 fb 01 bf 61 e0 01 	mulaw.xyzw accxyzw,vf12xyzw,vf00w 	lq.xyzw vf27xyzw,-2(vi02)
  1ddda0:	ff 17 fc 01 be 58 f3 01 	maddaz.xyzw accxyzw,vf11xyzw,vf19z 	lq.xyzw vf28xyzw,-1(vi02)
  1ddda8:	fd 37 f5 01 bd 50 f3 01 	madday.xyzw accxyzw,vf10xyzw,vf19y 	lq.xyzw vf21xyzw,-3(vi06)
  1dddb0:	77 00 2d 0a 88 4b f3 01 	maddx.xyzw vf14xyzw,vf09xyzw,vf19x 	isw.w vi13,119(vi00)w
  1dddb8:	18 00 0d 10 bf 61 e0 01 	mulaw.xyzw accxyzw,vf12xyzw,vf00w 	iaddiu vi13,vi00,0x18
  1dddc0:	01 d0 ed 03 be 58 f4 01 	maddaz.xyzw accxyzw,vf11xyzw,vf20z 	sq.xyzw vf26xyzw,1(vi13)
  1dddc8:	04 d8 ed 03 bd 50 f4 01 	madday.xyzw accxyzw,vf10xyzw,vf20y 	sq.xyzw vf27xyzw,4(vi13)
  1dddd0:	07 e0 ed 03 c8 4b f4 01 	maddx.xyzw vf15xyzw,vf09xyzw,vf20x 	sq.xyzw vf28xyzw,7(vi13)
  1dddd8:	fd 1f fa 01 bf 61 e0 01 	mulaw.xyzw accxyzw,vf12xyzw,vf00w 	lq.xyzw vf26xyzw,-3(vi03)
  1ddde0:	fe 1f fb 01 be 58 f5 01 	maddaz.xyzw accxyzw,vf11xyzw,vf21z 	lq.xyzw vf27xyzw,-2(vi03)
  1ddde8:	ff 1f fc 01 bd 50 f5 01 	madday.xyzw accxyzw,vf10xyzw,vf21y 	lq.xyzw vf28xyzw,-1(vi03)
  1dddf0:	02 98 ed 03 08 4c f5 01 	maddx.xyzw vf16xyzw,vf09xyzw,vf21x 	sq.xyzw vf19xyzw,2(vi13)
  1dddf8:	05 a0 ed 03 3c d1 fa 01 	itof0.xyzw vf26xyzw,vf26xyzw 	sq.xyzw vf20xyzw,5(vi13)
  1dde00:	08 a8 ed 03 3c d9 fb 01 	itof0.xyzw vf27xyzw,vf27xyzw 	sq.xyzw vf21xyzw,8(vi13)
  1dde08:	20 08 02 24 3c e1 fc 01 	itof0.xyzw vf28xyzw,vf28xyzw 	fcand vi01,0x20820
  1dde10:	77 00 08 0b ff 71 ce 01 	clipw.xyz vf14xyz,vf14w 	isw.x vi08,119(vi00)x
  1dde18:	77 00 89 0a ff 79 cf 01 	clipw.xyz vf15xyz,vf15w 	isw.y vi09,119(vi00)y
  1dde20:	00 d0 ed 03 ff 81 d0 01 	clipw.xyz vf16xyz,vf16w 	sq.xyzw vf26xyzw,0(vi13)
  1dde28:	03 d8 ed 03 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	sq.xyzw vf27xyzw,3(vi13)
  1dde30:	06 e0 ed 03 be 38 f4 01 	maddaz.xyzw accxyzw,vf07xyzw,vf20z 	sq.xyzw vf28xyzw,6(vi13)
  1dde38:	77 00 4a 0a bd 30 f4 01 	madday.xyzw accxyzw,vf06xyzw,vf20y 	isw.z vi10,119(vi00)z
  1dde40:	78 00 44 0a 08 2d f4 01 	maddx.xyzw vf20xyzw,vf05xyzw,vf20x 	isw.z vi04,120(vi00)z
  1dde48:	78 00 23 0a bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	isw.w vi03,120(vi00)w
  1dde50:	79 00 42 0a be 38 f5 01 	maddaz.xyzw accxyzw,vf07xyzw,vf21z 	isw.z vi02,121(vi00)z
  1dde58:	79 00 2f 0a bd 30 f5 01 	madday.xyzw accxyzw,vf06xyzw,vf21y 	isw.w vi15,121(vi00)w
  1dde60:	06 68 0e 10 48 2d f5 01 	maddx.xyzw vf21xyzw,vf05xyzw,vf21x 	iaddiu vi14,vi13,6
  1dde68:	2d 00 0c 10 ff 02 00 00 	nop 	iaddiu vi12,vi00,0x2d
  1dde70:	07 00 01 50 ff 02 00 00 	nop 	ibeq vi01,vi00,0x1ddeb0
  1dde78:	03 00 0b 10 ff 02 00 00 	nop 	iaddiu vi11,vi00,3
  1dde80:	20 00 29 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,0x820
  1dde88:	0c 00 f4 01 ff 02 00 00 	nop 	lq.xyzw vf20xyzw,12(vi00)
  1dde90:	69 00 0f 42 ff 02 00 00 	nop 	bal vi15,0x1de1e0
  1dde98:	0d 00 f5 01 ff 02 00 00 	nop 	lq.xyzw vf21xyzw,13(vi00)
  1ddea0:	15 00 00 40 ff 02 00 00 	nop 	b 0x1ddf50
  1ddea8:	0f 00 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi00,15
  1ddeb0:	ff ff 03 24 ff 02 00 00 	nop 	fcand vi01,0x3ffff
  1ddeb8:	06 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1ddef0
  1ddec0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ddec8:	f0 7b 09 80 ff a1 d4 01 	clipw.xyz vf20xyz,vf20w 	iadd vi15,vi15,vi09
  1dded0:	01 00 09 10 ff a9 d5 01 	clipw.xyz vf21xyz,vf21w 	iaddiu vi09,vi00,1
  1dded8:	77 00 2d 08 ff 02 00 00 	nop 	ilw.w vi13,119(vi00)w
  1ddee0:	00 78 00 48 ff 02 00 00 	nop 	jr vi15
  1ddee8:	78 00 44 08 ff 02 00 00 	nop 	ilw.z vi04,120(vi00)z
  1ddef0:	32 00 04 80 ff 02 00 00 	nop 	iaddi vi04,vi00,0
  1ddef8:	08 82 00 24 ff 02 00 00 	nop 	fcand vi01,0x8208
  1ddf00:	35 21 01 80 ff 02 00 00 	nop 	ior vi04,vi04,vi01
  1ddf08:	30 21 04 80 ff 02 00 00 	nop 	iadd vi04,vi04,vi04
  1ddf10:	04 41 00 24 ff 02 00 00 	nop 	fcand vi01,0x4104
  1ddf18:	35 21 01 80 ff 02 00 00 	nop 	ior vi04,vi04,vi01
  1ddf20:	30 21 04 80 ff 02 00 00 	nop 	iadd vi04,vi04,vi04
  1ddf28:	82 20 00 24 ff 02 00 00 	nop 	fcand vi01,0x2082
  1ddf30:	35 21 01 80 ff 02 00 00 	nop 	ior vi04,vi04,vi01
  1ddf38:	30 21 04 80 ff 02 00 00 	nop 	iadd vi04,vi04,vi04
  1ddf40:	41 10 00 24 ff 02 00 00 	nop 	fcand vi01,0x1041
  1ddf48:	35 21 01 80 ff 02 00 00 	nop 	ior vi04,vi04,vi01
  1ddf50:	16 00 02 10 ff 02 00 00 	nop 	iaddiu vi02,vi00,0x16
  1ddf58:	04 00 03 10 ff 02 00 00 	nop 	iaddiu vi03,vi00,4
  1ddf60:	41 00 09 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,0x41
  1ddf68:	72 5f 0a 80 ff 02 00 00 	nop 	iaddi vi10,vi11,-3
  1ddf70:	74 48 04 80 ff 02 00 00 	nop 	iand vi01,vi09,vi04
  1ddf78:	08 50 00 58 ff 02 00 00 	nop 	ibltz vi10,0x1ddfc0
  1ddf80:	f2 1f 03 80 ff 02 00 00 	nop 	iaddi vi03,vi03,-1
  1ddf88:	03 00 01 50 ff 02 00 00 	nop 	ibeq vi01,vi00,0x1ddfa8
  1ddf90:	00 10 f4 01 ff 02 00 00 	nop 	lq.xyzw vf20xyzw,0(vi02)
  1ddf98:	48 00 0f 42 ff 02 00 00 	nop 	bal vi15,0x1de1e0
  1ddfa0:	01 10 f5 01 ff 02 00 00 	nop 	lq.xyzw vf21xyzw,1(vi02)
  1ddfa8:	70 4a 09 80 ff 02 00 00 	nop 	iadd vi09,vi09,vi09
  1ddfb0:	f6 1f 00 5a ff 02 00 00 	nop 	ibgtz vi03,0x1ddf68
  1ddfb8:	b2 17 02 80 ff 02 00 00 	nop 	iaddi vi02,vi02,-2
  1ddfc0:	00 68 0c 10 ff 02 00 00 	nop 	iaddiu vi12,vi13,0
  1ddfc8:	fc 37 f4 01 ff 02 00 00 	nop 	lq.xyzw vf20xyzw,-4(vi06)
  1ddfd0:	72 5f 0a 80 ff 02 00 00 	nop 	iaddi vi10,vi11,-3
  1ddfd8:	01 38 0d 10 ff 02 00 00 	nop 	iaddiu vi13,vi07,1
  1ddfe0:	0a 50 00 5e ff 02 00 00 	nop 	ibgez vi10,0x1de038
  1ddfe8:	fd 37 f5 01 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	lq.xyzw vf21xyzw,-3(vi06)
  1ddff0:	bc 03 f8 81 be 38 f4 01 	maddaz.xyzw accxyzw,vf07xyzw,vf20z 	div q,vf00w,vf00x
  1ddff8:	77 00 4a 08 bd 30 f4 01 	madday.xyzw accxyzw,vf06xyzw,vf20y 	ilw.z vi10,119(vi00)z
  1de000:	77 00 08 09 08 2d f4 01 	maddx.xyzw vf20xyzw,vf05xyzw,vf20x 	ilw.x vi08,119(vi00)x
  1de008:	77 00 89 08 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	ilw.y vi09,119(vi00)y
  1de010:	77 00 2d 08 be 38 f5 01 	maddaz.xyzw accxyzw,vf07xyzw,vf21z 	ilw.w vi13,119(vi00)w
  1de018:	78 00 44 08 bd 30 f5 01 	madday.xyzw accxyzw,vf06xyzw,vf21y 	ilw.z vi04,120(vi00)z
  1de020:	78 00 23 08 48 2d f5 01 	maddx.xyzw vf21xyzw,vf05xyzw,vf21x 	ilw.w vi03,120(vi00)w
  1de028:	34 00 00 40 ff a1 d4 01 	clipw.xyz vf20xyz,vf20w 	b 0x1de1d0
  1de030:	79 00 42 08 ff a9 d5 01 	clipw.xyz vf21xyz,vf21w 	ilw.z vi02,121(vi00)z
  1de038:	02 60 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,2(vi12)
  1de040:	f2 5f 0a 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddi vi10,vi11,-1
  1de048:	78 00 44 08 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	ilw.z vi04,120(vi00)z
  1de050:	78 00 23 08 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	ilw.w vi03,120(vi00)w
  1de058:	05 60 fd 01 88 0e fd 01 	maddx.xyzw vf26xyzw,vf01xyzw,vf29x 	lq.xyzw vf29xyzw,5(vi12)
  1de060:	bc 03 fa 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	div q,vf00w,vf00x
  1de068:	79 00 42 08 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	ilw.z vi02,121(vi00)z
  1de070:	3c 03 00 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	nop
  1de078:	01 60 fe 01 48 0d fd 01 	maddx.xyzw vf21xyzw,vf01xyzw,vf29x 	lq.xyzw vf30xyzw,1(vi12)
  1de080:	08 60 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,8(vi12)
  1de088:	bf 03 00 80 ff 02 00 00 	nop 	waitq
  1de090:	00 60 ff 01 1c d7 e0 01 	mulq.xyzw vf28xyzw,vf26xyzw,q 	lq.xyzw vf31xyzw,0(vi12)
  1de098:	bc 03 f5 81 dc f6 c0 01 	mulq.xyz vf27xyz,vf30xyz,q 	div q,vf00w,vf00x
  1de0a0:	3c ab fa 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	move.xyzw vf26xyzw,vf21xyzw
  1de0a8:	f2 60 0c 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iaddi vi12,vi12,3
  1de0b0:	f2 57 0a 80 7c f9 ff 01 	ftoi0.xyzw vf31xyzw,vf31xyzw 	iaddi vi10,vi10,-1
  1de0b8:	01 60 fe 01 7d e1 fc 01 	ftoi4.xyzw vf28xyzw,vf28xyzw 	lq.xyzw vf30xyzw,1(vi12)
  1de0c0:	7d db ed 81 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	sqi.xyzw vf27xyzw,(vi13++)
  1de0c8:	08 60 fd 01 48 0d fd 01 	maddx.xyzw vf21xyzw,vf01xyzw,vf29x 	lq.xyzw vf29xyzw,8(vi12)
  1de0d0:	7d fb ed 81 ff 02 00 00 	nop 	sqi.xyzw vf31xyzw,(vi13++)
  1de0d8:	f6 57 00 5a ff 02 00 00 	nop 	ibgtz vi10,0x1de090
  1de0e0:	7d e3 ed 81 ff 02 00 00 	nop 	sqi.xyzw vf28xyzw,(vi13++)
  1de0e8:	00 60 ff 01 1c d7 e0 01 	mulq.xyzw vf28xyzw,vf26xyzw,q 	lq.xyzw vf31xyzw,0(vi12)
  1de0f0:	77 00 4a 08 dc f6 c0 01 	mulq.xyz vf27xyz,vf30xyz,q 	ilw.z vi10,119(vi00)z
  1de0f8:	77 00 08 09 7c f9 ff 01 	ftoi0.xyzw vf31xyzw,vf31xyzw 	ilw.x vi08,119(vi00)x
  1de100:	77 00 89 08 7d e1 fc 01 	ftoi4.xyzw vf28xyzw,vf28xyzw 	ilw.y vi09,119(vi00)y
  1de108:	fc 37 f4 01 ff 02 00 00 	nop 	lq.xyzw vf20xyzw,-4(vi06)
  1de110:	7d db ed 81 ff 02 00 00 	nop 	sqi.xyzw vf27xyzw,(vi13++)
  1de118:	7d fb ed 81 ff 02 00 00 	nop 	sqi.xyzw vf31xyzw,(vi13++)
  1de120:	7d e3 ed 81 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	sqi.xyzw vf28xyzw,(vi13++)
  1de128:	fd 37 f5 01 be 38 f4 01 	maddaz.xyzw accxyzw,vf07xyzw,vf20z 	lq.xyzw vf21xyzw,-3(vi06)
  1de130:	77 00 2d 08 bd 30 f4 01 	madday.xyzw accxyzw,vf06xyzw,vf20y 	ilw.w vi13,119(vi00)w
  1de138:	bc 06 0c 80 08 2d f4 01 	maddx.xyzw vf20xyzw,vf05xyzw,vf20x 	xtop vi12
  1de140:	fe 63 81 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	ilwr.y vi01,(vi12)y
  1de148:	f5 5a 0a 80 be 38 f5 01 	maddaz.xyzw accxyzw,vf07xyzw,vf21z 	ior vi11,vi11,vi10
  1de150:	00 38 0b 0b bd 30 f5 01 	madday.xyzw accxyzw,vf06xyzw,vf21y 	isw.x vi11,0(vi07)x
  1de158:	bc 03 f8 81 48 2d f5 01 	maddx.xyzw vf21xyzw,vf05xyzw,vf21x 	div q,vf00w,vf00x
  1de160:	08 00 01 50 ff a1 d4 01 	clipw.xyz vf20xyz,vf20w 	ibeq vi01,vi00,0x1de1a8
  1de168:	ff 63 80 80 ff 02 00 00 	nop 	iswr.y vi00,(vi12)y
  1de170:	01 60 0b 09 ff 02 00 00 	nop 	ilw.x vi11,1(vi12)x
  1de178:	f5 5a 0a 80 ff 02 00 00 	nop 	ior vi11,vi11,vi10
  1de180:	00 68 0b 0b ff 02 00 00 	nop 	isw.x vi11,0(vi13)x
  1de188:	f0 02 0d 80 ff 02 00 00 	nop 	iadd vi11,vi00,vi13
  1de190:	70 0b 0d 80 ff 02 00 00 	nop 	iadd vi13,vi01,vi13
  1de198:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de1a0:	fc 5e 00 80 ff 02 00 00 	nop 	xgkick vi11
  1de1a8:	45 00 0c 10 ff 02 00 00 	nop 	iaddiu vi12,vi00,0x45
  1de1b0:	fc 3e 00 80 ff a9 d5 01 	clipw.xyz vf21xyz,vf21w 	xgkick vi07
  1de1b8:	02 38 0c 50 ff 02 00 00 	nop 	ibeq vi12,vi07,0x1de1d0
  1de1c0:	5e 00 07 10 ff 02 00 00 	nop 	iaddiu vi07,vi00,0x5e
  1de1c8:	45 00 07 10 ff 02 00 00 	nop 	iaddiu vi07,vi00,0x45
  1de1d0:	00 78 00 48 ff 02 00 00 	nop 	jr vi15
  1de1d8:	01 00 09 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,1
  1de1e0:	fd 5b ff 81 ff 02 00 00 	nop 	mfir.xyzw vf31xyzw,vi11
  1de1e8:	7c 00 fe 01 3c f9 ff 01 	itof0.xyzw vf31xyzw,vf31xyzw 	lq.xyzw vf30xyzw,124(vi00)
  1de1f0:	3c 03 00 80 a8 f7 5f 00 	add.z vf30z,vf30z,vf31z 	nop
  1de1f8:	7c f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,124(vi00)
  1de200:	02 70 f0 01 ff 02 00 00 	nop 	lq.xyzw vf16xyzw,2(vi14)
  1de208:	01 70 ef 01 ff 02 00 00 	nop 	lq.xyzw vf15xyzw,1(vi14)
  1de210:	00 70 ee 01 ff 02 00 00 	nop 	lq.xyzw vf14xyzw,0(vi14)
  1de218:	3f 00 0e 10 bf 61 e0 01 	mulaw.xyzw accxyzw,vf12xyzw,vf00w 	iaddiu vi14,vi00,0x3f
  1de220:	02 68 f3 01 be 58 f0 01 	maddaz.xyzw accxyzw,vf11xyzw,vf16z 	lq.xyzw vf19xyzw,2(vi13)
  1de228:	05 68 fe 01 bd 50 f0 01 	madday.xyzw accxyzw,vf10xyzw,vf16y 	lq.xyzw vf30xyzw,5(vi13)
  1de230:	00 00 0a 10 48 4c f0 01 	maddx.xyzw vf17xyzw,vf09xyzw,vf16x 	iaddiu vi10,vi00,0
  1de238:	78 00 0c 0b bf 61 e0 01 	mulaw.xyzw accxyzw,vf12xyzw,vf00w 	isw.x vi12,120(vi00)x
  1de240:	78 00 8d 0a be 58 f3 01 	maddaz.xyzw accxyzw,vf11xyzw,vf19z 	isw.y vi13,120(vi00)y
  1de248:	3c 03 00 80 bd 50 f3 01 	madday.xyzw accxyzw,vf10xyzw,vf19y 	nop
  1de250:	3c 03 00 80 48 4b f3 01 	maddx.xyzw vf13xyzw,vf09xyzw,vf19x 	nop
  1de258:	3c 03 00 80 ff 89 d1 01 	clipw.xyz vf17xyz,vf17w 	nop
  1de260:	02 68 f3 01 ff 69 cd 01 	clipw.xyz vf13xyz,vf13w 	lq.xyzw vf19xyzw,2(vi13)
  1de268:	01 68 f2 01 bf 61 e0 01 	mulaw.xyzw accxyzw,vf12xyzw,vf00w 	lq.xyzw vf18xyzw,1(vi13)
  1de270:	00 68 f1 01 be 58 fe 01 	maddaz.xyzw accxyzw,vf11xyzw,vf30z 	lq.xyzw vf17xyzw,0(vi13)
  1de278:	f2 5f 0b 80 bd 50 fe 01 	madday.xyzw accxyzw,vf10xyzw,vf30y 	iaddi vi11,vi11,-1
  1de280:	00 00 01 38 48 4b fe 01 	maddx.xyzw vf13xyzw,vf09xyzw,vf30x 	fcget vi01
  1de288:	34 0a 09 80 ff 02 00 00 	nop 	iand vi08,vi01,vi09
  1de290:	32 56 01 80 ff 02 00 00 	nop 	iaddi vi01,vi10,-8
  1de298:	20 48 08 50 ff 02 00 00 	nop 	ibeq vi08,vi09,0x1de3a0
  1de2a0:	f2 68 0d 80 ff 02 00 00 	nop 	iaddi vi13,vi13,3
  1de2a8:	18 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1de370
  1de2b0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de2b8:	3c 03 00 80 ec 9f f0 01 	sub.xyzw vf31xyzw,vf19xyzw,vf16xyzw 	nop
  1de2c0:	3c 03 00 80 ac ae f0 01 	sub.xyzw vf26xyzw,vf21xyzw,vf16xyzw 	nop
  1de2c8:	3c 03 00 80 2c 97 ef 01 	sub.xyzw vf28xyzw,vf18xyzw,vf15xyzw 	nop
  1de2d0:	3c 03 00 80 ec 8e ee 01 	sub.xyzw vf27xyzw,vf17xyzw,vf14xyzw 	nop
  1de2d8:	3c 03 00 80 ea fd f4 01 	mul.xyzw vf23xyzw,vf31xyzw,vf20xyzw 	nop
  1de2e0:	3c 03 00 80 6a d7 f4 01 	mul.xyzw vf29xyzw,vf26xyzw,vf20xyzw 	nop
  1de2e8:	3c 03 00 80 c1 bd 17 01 	addy.x vf23x,vf23x,vf23y 	nop
  1de2f0:	3c 03 00 80 41 ef 1d 01 	addy.x vf29x,vf29x,vf29y 	nop
  1de2f8:	3c 03 00 80 c2 bd 17 01 	addz.x vf23x,vf23x,vf23z 	nop
  1de300:	3c 03 00 80 42 ef 1d 01 	addz.x vf29x,vf29x,vf29z 	nop
  1de308:	bc eb 17 80 ff 02 00 00 	nop 	div q,vf29x,vf00x
  1de310:	11 08 00 5e ff 02 00 00 	nop 	ibgez vi01,0x1de3a0
  1de318:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de320:	bf 03 00 80 ff 02 00 00 	nop 	waitq
  1de328:	3c 03 00 80 3c 70 e0 01 	addax.xyzw accxyzw,vf14xyzw,vf00x 	nop
  1de330:	72 56 01 80 e1 de e0 01 	maddq.xyzw vf27xyzw,vf27xyzw,q 	iaddi vi01,vi10,-7
  1de338:	34 42 0e 80 3c 78 e0 01 	addax.xyzw accxyzw,vf15xyzw,vf00x 	iand vi08,vi08,vi14
  1de340:	3c 03 00 80 21 e7 e0 01 	maddq.xyzw vf28xyzw,vf28xyzw,q 	nop
  1de348:	01 50 0a 10 3c 80 e0 01 	addax.xyzw accxyzw,vf16xyzw,vf00x 	iaddiu vi10,vi10,1
  1de350:	7d db ec 81 e1 ff e0 01 	maddq.xyzw vf31xyzw,vf31xyzw,q 	sqi.xyzw vf27xyzw,(vi12++)
  1de358:	7d e3 ec 81 ff 02 00 00 	nop 	sqi.xyzw vf28xyzw,(vi12++)
  1de360:	07 40 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1de3a0
  1de368:	7d fb ec 81 ff 02 00 00 	nop 	sqi.xyzw vf31xyzw,(vi12++)
  1de370:	05 08 00 5e ff 02 00 00 	nop 	ibgez vi01,0x1de3a0
  1de378:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de380:	7d 8b ec 81 ff 02 00 00 	nop 	sqi.xyzw vf17xyzw,(vi12++)
  1de388:	7d 93 ec 81 ff 02 00 00 	nop 	sqi.xyzw vf18xyzw,(vi12++)
  1de390:	7d 9b ec 81 ff 02 00 00 	nop 	sqi.xyzw vf19xyzw,(vi12++)
  1de398:	01 50 0a 10 ff 02 00 00 	nop 	iaddiu vi10,vi10,1
  1de3a0:	05 68 fe 01 00 9c e0 01 	addx.xyzw vf16xyzw,vf19xyzw,vf00x 	lq.xyzw vf30xyzw,5(vi13)
  1de3a8:	00 00 00 00 00 04 00 4a 	*unknown* 	lq. vf00,0(vi00)
  1de3b0:	d6 5f 00 5a c0 93 e0 01 	addx.xyzw vf15xyzw,vf18xyzw,vf00x 	ibgtz vi11,0x1de268
  1de3b8:	3c 03 00 80 80 8b e0 01 	addx.xyzw vf14xyzw,vf17xyzw,vf00x 	nop
  1de3c0:	72 67 0e 80 ff 02 00 00 	nop 	iaddi vi14,vi12,-3
  1de3c8:	78 00 8c 08 ff 02 00 00 	nop 	ilw.y vi12,120(vi00)y
  1de3d0:	78 00 0d 09 ff 02 00 00 	nop 	ilw.x vi13,120(vi00)x
  1de3d8:	f0 52 00 80 ff 02 00 00 	nop 	iadd vi11,vi10,vi00
  1de3e0:	00 78 00 48 ff 02 00 00 	nop 	jr vi15
  1de3e8:	79 00 2f 08 ff 02 00 00 	nop 	ilw.w vi15,121(vi00)w
  1de3f0:	61 04 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dc700
  1de3f8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de400:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1de408:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de410:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1de418:	fe 33 88 80 ff 02 00 00 	nop 	ilwr.y vi08,(vi06)y
  1de420:	fe 33 05 81 ff 02 00 00 	nop 	ilwr.x vi05,(vi06)x
  1de428:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1de430:	e0 30 0d 10 ff 02 00 00 	nop 	iaddiu vi13,vi06,0xe0
  1de438:	01 00 09 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,1
  1de440:	45 00 07 10 ff 02 00 00 	nop 	iaddiu vi07,vi00,0x45
  1de448:	06 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1de480
  1de450:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1de458:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1de460:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1de468:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de470:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1de458
  1de478:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1de480:	01 30 f7 01 ff 02 00 00 	nop 	lq.xyzw vf23xyzw,1(vi06)
  1de488:	fe 33 08 81 ff 02 00 00 	nop 	ilwr.x vi08,(vi06)x
  1de490:	f2 2f 05 80 ff 02 00 00 	nop 	iaddi vi05,vi05,-1
  1de498:	7c 33 f2 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lqi.xyzw vf18xyzw,(vi06++)
  1de4a0:	ff 07 e1 11 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	iaddiu vi01,vi00,0x7fff
  1de4a8:	34 0a 08 80 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	iand vi08,vi01,vi08
  1de4b0:	b0 30 08 80 08 0e f7 01 	maddx.xyzw vf24xyzw,vf01xyzw,vf23x 	iadd vi02,vi06,vi08
  1de4b8:	f0 10 08 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	iadd vi03,vi02,vi08
  1de4c0:	72 30 06 80 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	iaddi vi06,vi06,1
  1de4c8:	72 08 0a 80 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	iaddi vi10,vi01,1
  1de4d0:	bc 03 f8 81 48 2e f7 01 	maddx.xyzw vf25xyzw,vf05xyzw,vf23x 	div q,vf00w,vf00x
  1de4d8:	7c 1b ff 81 ff 02 00 00 	nop 	lqi.xyzw vf31xyzw,(vi03++)
  1de4e0:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1de4e8:	7d 93 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf18xyzw,(vi04++)
  1de4f0:	fd 43 fa 81 ff 02 00 00 	nop 	mfir.xyzw vf26xyzw,vi08
  1de4f8:	7b 00 fe 01 3c d1 fa 01 	itof0.xyzw vf26xyzw,vf26xyzw 	lq.xyzw vf30xyzw,123(vi00)
  1de500:	3c 03 00 80 a8 f7 9a 00 	add.y vf30y,vf30y,vf26y 	nop
  1de508:	7b f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,123(vi00)
  1de510:	b0 23 08 80 ff c9 d9 01 	clipw.xyz vf25xyz,vf25w 	iadd vi14,vi04,vi08
  1de518:	b0 73 08 80 ff 02 00 00 	nop 	iadd vi14,vi14,vi08
  1de520:	b0 73 08 80 ff 02 00 00 	nop 	iadd vi14,vi14,vi08
  1de528:	7c 13 fe 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lqi.xyzw vf30xyzw,(vi02++)
  1de530:	fc fb 4c 80 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	mtir vi12,vf31z
  1de538:	01 f8 e4 03 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	sq.xyzw vf31xyzw,1(vi04)
  1de540:	ff ff 03 24 9c c6 e0 01 	mulq.xyzw vf26xyzw,vf24xyzw,q 	fcand vi01,0x3ffff
  1de548:	7c 1b ff 81 c8 0e f7 01 	maddx.xyzw vf27xyzw,vf01xyzw,vf23x 	lqi.xyzw vf31xyzw,(vi03++)
  1de550:	34 63 09 80 9c f7 c0 01 	mulq.xyz vf30xyz,vf30xyz,q 	iand vi12,vi12,vi09
  1de558:	31 4b 0c 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	isub vi12,vi09,vi12
  1de560:	75 60 01 80 7d d1 da 01 	ftoi4.xyz vf26xyz,vf26xyz 	ior vi01,vi12,vi01
  1de568:	bc 03 fb 81 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	div q,vf00w,vf00x
  1de570:	00 f0 e4 03 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	sq.xyzw vf30xyzw,0(vi04)
  1de578:	71 00 01 80 48 2e f7 01 	maddx.xyzw vf25xyzw,vf05xyzw,vf23x 	isub vi01,vi00,vi01
  1de580:	fd 0b 3a 80 00 de e0 01 	addx.xyzw vf24xyzw,vf27xyzw,vf00x 	mfir.w vf26w,vi01
  1de588:	f2 20 04 80 ff 02 00 00 	nop 	iaddi vi04,vi04,3
  1de590:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1de598:	f1 77 04 52 ff c9 d9 01 	clipw.xyz vf25xyz,vf25w 	ibne vi04,vi14,0x1de528
  1de5a0:	ff d7 e4 03 ff 02 00 00 	nop 	sq.xyzw vf26xyzw,-1(vi04)
  1de5a8:	da 2f 00 5a ff 02 00 00 	nop 	ibgtz vi05,0x1de480
  1de5b0:	f2 1f 06 80 ff 02 00 00 	nop 	iaddi vi06,vi03,-1
  1de5b8:	fc 6e 00 80 ff 02 00 00 	nop 	xgkick vi13
  1de5c0:	c7 07 00 40 ff 02 00 00 	nop 	b 0x1de400
  1de5c8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de5d0:	61 06 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8e0
  1de5d8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de5e0:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1de5e8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de5f0:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1de5f8:	fe 33 8c 80 ff 02 00 00 	nop 	ilwr.y vi12,(vi06)y
  1de600:	fe 33 0d 81 ff 02 00 00 	nop 	ilwr.x vi13,(vi06)x
  1de608:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1de610:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1de618:	7e 00 0e 01 ff 02 00 00 	nop 	lq.x vf14x,126(vi00)
  1de620:	06 00 0c 50 ff 02 00 00 	nop 	ibeq vi12,vi00,0x1de658
  1de628:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1de630:	7c 33 fd 81 ff 02 00 00 	nop 	lqi.xyzw vf29xyzw,(vi06++)
  1de638:	f2 67 0c 80 ff 02 00 00 	nop 	iaddi vi12,vi12,-1
  1de640:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de648:	fc 67 00 5a ff 02 00 00 	nop 	ibgtz vi12,0x1de630
  1de650:	7d eb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf29xyzw,(vi04++)
  1de658:	7c 33 ed 81 ff 02 00 00 	nop 	lqi.xyzw vf13xyzw,(vi06++)
  1de660:	01 30 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,1(vi06)
  1de668:	fe 33 0c 81 ff 02 00 00 	nop 	ilwr.x vi12,(vi06)x
  1de670:	7c 33 f2 81 ff 02 00 00 	nop 	lqi.xyzw vf18xyzw,(vi06++)
  1de678:	ff 07 eb 11 58 6b 8e 01 	mulx.xy vf13xy,vf13xy,vf14x 	iaddiu vi11,vi00,0x7fff
  1de680:	34 5b 0c 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iand vi12,vi11,vi12
  1de688:	b0 30 0c 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iadd vi02,vi06,vi12
  1de690:	72 30 06 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	iaddi vi06,vi06,1
  1de698:	f0 10 0c 80 7c 69 8f 01 	ftoi0.xy vf15xy,vf13xy 	iadd vi03,vi02,vi12
  1de6a0:	7c 33 fd 81 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	lqi.xyzw vf29xyzw,(vi06++)
  1de6a8:	fd 63 fa 81 ff 02 00 00 	nop 	mfir.xyzw vf26xyzw,vi12
  1de6b0:	7b 00 fe 01 3c d1 fa 01 	itof0.xyzw vf26xyzw,vf26xyzw 	lq.xyzw vf30xyzw,123(vi00)
  1de6b8:	3c 03 00 80 a8 f7 1a 01 	add.x vf30x,vf30x,vf26x 	nop
  1de6c0:	7b f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,123(vi00)
  1de6c8:	72 58 08 80 ff 02 00 00 	nop 	iaddi vi08,vi11,1
  1de6d0:	7c 13 fe 81 ff 02 00 00 	nop 	lqi.xyzw vf30xyzw,(vi02++)
  1de6d8:	3c 03 00 80 3c 79 8f 01 	itof0.xy vf15xy,vf15xy 	nop
  1de6e0:	bc 03 f9 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	div q,vf00w,vf00x
  1de6e8:	3c 03 00 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	nop
  1de6f0:	3c cb fa 81 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	move.xyzw vf26xyzw,vf25xyzw
  1de6f8:	3c 03 00 80 6c 6b 8f 01 	sub.xy vf13xy,vf13xy,vf15xy 	nop
  1de700:	7d 93 e4 81 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	sqi.xyzw vf18xyzw,(vi04++)
  1de708:	7c 33 fd 81 5a 6b 8d 01 	mulz.xy vf13xy,vf13xy,vf13z 	lqi.xyzw vf29xyzw,(vi06++)
  1de710:	70 22 0c 80 7c 69 8d 01 	ftoi0.xy vf13xy,vf13xy 	iadd vi09,vi04,vi12
  1de718:	70 4a 0c 80 3c 69 8d 01 	itof0.xy vf13xy,vf13xy 	iadd vi09,vi09,vi12
  1de720:	7c 1b ff 81 ff 02 00 00 	nop 	lqi.xyzw vf31xyzw,(vi03++)
  1de728:	70 4a 0c 80 bf 69 8d 01 	mulaw.xy accxy,vf13xy,vf13w 	iadd vi09,vi09,vi12
  1de730:	32 4f 09 80 8b f7 80 01 	maddw.xy vf30xy,vf30xy,vf00w 	iaddi vi09,vi09,-4
  1de738:	72 00 01 80 4b 03 80 01 	maddw.xy vf13xy,vf00xy,vf00w 	iaddi vi01,vi00,1
  1de740:	fc fb 4a 80 1c d6 e0 01 	mulq.xyzw vf24xyzw,vf26xyzw,q 	mtir vi10,vf31z
  1de748:	7c 13 fe 81 dc f6 c0 01 	mulq.xyz vf27xyz,vf30xyz,q 	lqi.xyzw vf30xyzw,(vi02++)
  1de750:	bc 03 f9 81 80 ce e0 01 	addx.xyzw vf26xyzw,vf25xyzw,vf00x 	div q,vf00w,vf00x
  1de758:	7c 33 fc 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lqi.xyzw vf28xyzw,(vi06++)
  1de760:	b4 52 01 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iand vi10,vi10,vi01
  1de768:	b1 42 0a 80 7d c1 d8 01 	ftoi4.xyz vf24xyz,vf24xyz 	isub vi10,vi08,vi10
  1de770:	7d db e4 81 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	sqi.xyzw vf27xyzw,(vi04++)
  1de778:	fd 53 38 80 48 0e fd 01 	maddx.xyzw vf25xyzw,vf01xyzw,vf29x 	mfir.w vf24w,vi10
  1de780:	7d fb e4 81 40 e7 e0 01 	addx.xyzw vf29xyzw,vf28xyzw,vf00x 	sqi.xyzw vf31xyzw,(vi04++)
  1de788:	7c 1b ff 81 a8 f7 8d 01 	add.xy vf30xy,vf30xy,vf13xy 	lqi.xyzw vf31xyzw,(vi03++)
  1de790:	f5 4f 04 52 ff 02 00 00 	nop 	ibne vi04,vi09,0x1de740
  1de798:	7d c3 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf24xyzw,(vi04++)
  1de7a0:	f2 6f 0d 80 1c d6 e0 01 	mulq.xyzw vf24xyzw,vf26xyzw,q 	iaddi vi13,vi13,-1
  1de7a8:	fc fb 4a 80 dc f6 c0 01 	mulq.xyz vf27xyz,vf30xyz,q 	mtir vi10,vf31z
  1de7b0:	b0 01 03 80 7d c1 d8 01 	ftoi4.xyz vf24xyz,vf24xyz 	iadd vi06,vi00,vi03
  1de7b8:	b4 52 01 80 ff 02 00 00 	nop 	iand vi10,vi10,vi01
  1de7c0:	b1 42 0a 80 ff 02 00 00 	nop 	isub vi10,vi08,vi10
  1de7c8:	fd 53 38 80 ff 02 00 00 	nop 	mfir.w vf24w,vi10
  1de7d0:	7d db e4 81 ff 02 00 00 	nop 	sqi.xyzw vf27xyzw,(vi04++)
  1de7d8:	7d fb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf31xyzw,(vi04++)
  1de7e0:	ce 6f 00 5a ff 02 00 00 	nop 	ibgtz vi13,0x1de658
  1de7e8:	7d c3 e4 81 ff 02 00 00 	nop 	sqi.xyzw vf24xyzw,(vi04++)
  1de7f0:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1de7f8:	bc 07 00 40 ff 02 00 00 	nop 	b 0x1de5e0
  1de800:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de808:	1a 06 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8e0
  1de810:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de818:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1de820:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de828:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1de830:	fe 33 88 80 ff 02 00 00 	nop 	ilwr.y vi08,(vi06)y
  1de838:	fe 33 05 81 ff 02 00 00 	nop 	ilwr.x vi05,(vi06)x
  1de840:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1de848:	e0 30 0d 10 ff 02 00 00 	nop 	iaddiu vi13,vi06,0xe0
  1de850:	01 00 09 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,1
  1de858:	45 00 07 10 ff 02 00 00 	nop 	iaddiu vi07,vi00,0x45
  1de860:	06 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1de898
  1de868:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1de870:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1de878:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1de880:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1de888:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1de870
  1de890:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1de898:	7e 00 0e 01 ff 02 00 00 	nop 	lq.x vf14x,126(vi00)
  1de8a0:	7c 33 ed 81 ff 02 00 00 	nop 	lqi.xyzw vf13xyzw,(vi06++)
  1de8a8:	01 30 f7 01 ff 02 00 00 	nop 	lq.xyzw vf23xyzw,1(vi06)
  1de8b0:	fe 33 08 81 ff 02 00 00 	nop 	ilwr.x vi08,(vi06)x
  1de8b8:	f2 2f 05 80 ff 02 00 00 	nop 	iaddi vi05,vi05,-1
  1de8c0:	3c 03 00 80 58 6b 8e 01 	mulx.xy vf13xy,vf13xy,vf14x 	nop
  1de8c8:	7c 33 f2 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lqi.xyzw vf18xyzw,(vi06++)
  1de8d0:	ff 07 e1 11 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	iaddiu vi01,vi00,0x7fff
  1de8d8:	34 0a 08 80 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	iand vi08,vi01,vi08
  1de8e0:	3c 03 00 80 7c 69 8f 01 	ftoi0.xy vf15xy,vf13xy 	nop
  1de8e8:	b0 30 08 80 08 0e f7 01 	maddx.xyzw vf24xyzw,vf01xyzw,vf23x 	iadd vi02,vi06,vi08
  1de8f0:	f0 10 08 80 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	iadd vi03,vi02,vi08
  1de8f8:	72 30 06 80 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	iaddi vi06,vi06,1
  1de900:	72 08 0a 80 3c 79 8f 01 	itof0.xy vf15xy,vf15xy 	iaddi vi10,vi01,1
  1de908:	bc 03 f8 81 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	div q,vf00w,vf00x
  1de910:	7d 93 e4 81 48 2e f7 01 	maddx.xyzw vf25xyzw,vf05xyzw,vf23x 	sqi.xyzw vf18xyzw,(vi04++)
  1de918:	7c 33 f7 81 6c 6b 8f 01 	sub.xy vf13xy,vf13xy,vf15xy 	lqi.xyzw vf23xyzw,(vi06++)
  1de920:	fd 43 ff 81 ff 02 00 00 	nop 	mfir.xyzw vf31xyzw,vi08
  1de928:	7b 00 fe 01 3c f9 ff 01 	itof0.xyzw vf31xyzw,vf31xyzw 	lq.xyzw vf30xyzw,123(vi00)
  1de930:	3c 03 00 80 a8 f7 9f 00 	add.y vf30y,vf30y,vf31y 	nop
  1de938:	7b f0 e0 03 ff 02 00 00 	nop 	sq.xyzw vf30xyzw,123(vi00)
  1de940:	3c 03 00 80 ff c9 d9 01 	clipw.xyz vf25xyz,vf25w 	nop
  1de948:	3c 03 00 80 5a 6b 8d 01 	mulz.xy vf13xy,vf13xy,vf13z 	nop
  1de950:	3c 03 00 80 7c 69 8d 01 	ftoi0.xy vf13xy,vf13xy 	nop
  1de958:	00 10 fe 01 3c 69 8d 01 	itof0.xy vf13xy,vf13xy 	lq.xyzw vf30xyzw,0(vi02)
  1de960:	3c 03 00 80 5b 6b 8d 01 	mulw.xy vf13xy,vf13xy,vf13w 	nop
  1de968:	7c 1b ff 81 a8 f7 8d 01 	add.xy vf30xy,vf30xy,vf13xy 	lqi.xyzw vf31xyzw,(vi03++)
  1de970:	ff 1f 4c 08 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	ilw.z vi12,-1(vi03)z
  1de978:	f2 47 08 80 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	iaddi vi08,vi08,-1
  1de980:	ff ff 03 24 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	fcand vi01,0x3ffff
  1de988:	7d f3 e2 81 9c c6 e0 01 	mulq.xyzw vf26xyzw,vf24xyzw,q 	sqi.xyzw vf30xyzw,(vi02++)
  1de990:	01 f8 e4 03 c8 0e f7 01 	maddx.xyzw vf27xyzw,vf01xyzw,vf23x 	sq.xyzw vf31xyzw,1(vi04)
  1de998:	34 63 09 80 9c f3 c0 01 	mulq.xyz vf14xyz,vf30xyz,q 	iand vi12,vi12,vi09
  1de9a0:	00 10 fe 01 bf 41 e0 01 	mulaw.xyzw accxyzw,vf08xyzw,vf00w 	lq.xyzw vf30xyzw,0(vi02)
  1de9a8:	7c 33 f6 81 7d d1 fa 01 	ftoi4.xyzw vf26xyzw,vf26xyzw 	lqi.xyzw vf22xyzw,(vi06++)
  1de9b0:	bc 03 fb 81 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	div q,vf00w,vf00x
  1de9b8:	00 70 e4 03 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	sq.xyzw vf14xyzw,0(vi04)
  1de9c0:	13 00 0c 50 48 2e f7 01 	maddx.xyzw vf25xyzw,vf05xyzw,vf23x 	ibeq vi12,vi00,0x1dea60
  1de9c8:	02 d0 e4 03 00 de e0 01 	addx.xyzw vf24xyzw,vf27xyzw,vf00x 	sq.xyzw vf26xyzw,2(vi04)
  1de9d0:	12 00 01 50 ff 02 00 00 	nop 	ibeq vi01,vi00,0x1dea68
  1de9d8:	df f7 fd 26 ff 02 00 00 	nop 	fcor vi01,0xfdf7df
  1de9e0:	0f 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1dea60
  1de9e8:	f7 7d ff 26 ff 02 00 00 	nop 	fcor vi01,0xff7df7
  1de9f0:	0d 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1dea60
  1de9f8:	fb be ff 26 ff 02 00 00 	nop 	fcor vi01,0xffbefb
  1dea00:	0b 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1dea60
  1dea08:	7d df ff 26 ff 02 00 00 	nop 	fcor vi01,0xffdf7d
  1dea10:	09 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1dea60
  1dea18:	be ef ff 26 ff 02 00 00 	nop 	fcor vi01,0xffefbe
  1dea20:	07 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1dea60
  1dea28:	10 04 01 24 ff 02 00 00 	nop 	fcand vi01,0x10410
  1dea30:	06 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1dea68
  1dea38:	79 68 80 03 ff 02 00 00 	nop 	sq.xy vf13xy,121(vi00)
  1dea40:	68 06 0f 42 ff 02 00 00 	nop 	bal vi15,0x1ddd88
  1dea48:	03 00 09 10 ff 02 00 00 	nop 	iaddiu vi09,vi00,3
  1dea50:	79 00 8d 01 ff 02 00 00 	nop 	lq.xy vf13xy,121(vi00)
  1dea58:	00 10 fe 01 ff 02 00 00 	nop 	lq.xyzw vf30xyzw,0(vi02)
  1dea60:	02 20 2a 0a ff 02 00 00 	nop 	isw.w vi10,2(vi04)w
  1dea68:	df 47 00 5a c0 b5 e0 01 	addx.xyzw vf23xyzw,vf22xyzw,vf00x 	ibgtz vi08,0x1de968
  1dea70:	f2 20 04 80 ff c9 d9 01 	clipw.xyz vf25xyz,vf25w 	iaddi vi04,vi04,3
  1dea78:	c3 2f 00 5a ff 02 00 00 	nop 	ibgtz vi05,0x1de898
  1dea80:	b0 01 03 80 ff 02 00 00 	nop 	iadd vi06,vi00,vi03
  1dea88:	fc 6e 00 80 ff 02 00 00 	nop 	xgkick vi13
  1dea90:	b0 07 00 40 ff 02 00 00 	nop 	b 0x1de818
  1dea98:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1deaa0:	c7 05 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8e0
  1deaa8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1deab0:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1deab8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1deac0:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1deac8:	fe 33 88 80 ff 02 00 00 	nop 	ilwr.y vi08,(vi06)y
  1dead0:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dead8:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1deae0:	ff 07 ea 11 ff 02 00 00 	nop 	iaddiu vi10,vi00,0x7fff
  1deae8:	06 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1deb20
  1deaf0:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1deaf8:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1deb00:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1deb08:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1deb10:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1deaf8
  1deb18:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1deb20:	01 30 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,1(vi06)
  1deb28:	fe 33 08 81 ff 02 00 00 	nop 	ilwr.x vi08,(vi06)x
  1deb30:	03 30 f8 01 ff 02 00 00 	nop 	lq.xyzw vf24xyzw,3(vi06)
  1deb38:	7c 33 f2 81 ff 02 00 00 	nop 	lqi.xyzw vf18xyzw,(vi06++)
  1deb40:	01 30 bc 01 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lq.xyw vf28xyw,1(vi06)
  1deb48:	77 00 f9 01 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	lq.xyzw vf25xyzw,119(vi00)
  1deb50:	78 00 ea 01 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	lq.xyzw vf10xyzw,120(vi00)
  1deb58:	34 42 0a 80 88 0f fd 01 	maddx.xyzw vf30xyzw,vf01xyzw,vf29x 	iand vi08,vi08,vi10
  1deb60:	72 50 0b 80 c5 06 1c 01 	suby.x vf27x,vf00x,vf28y 	iaddi vi11,vi10,1
  1deb68:	70 42 08 80 c0 06 9c 00 	addx.y vf27y,vf00y,vf28x 	iadd vi09,vi08,vi08
  1deb70:	bc 03 fe 81 1a e7 2a 00 	mulz.w vf28w,vf28w,vf10z 	div q,vf00w,vf00x
  1deb78:	7d 93 e4 81 7c c1 f8 01 	ftoi0.xyzw vf24xyzw,vf24xyzw 	sqi.xyzw vf18xyzw,(vi04++)
  1deb80:	70 4a 09 80 ff 02 00 00 	nop 	iadd vi09,vi09,vi09
  1deb88:	75 4a 0b 80 ff 02 00 00 	nop 	ior vi09,vi09,vi11
  1deb90:	ff 27 09 0b ff 02 00 00 	nop 	isw.x vi09,-1(vi04)x
  1deb98:	fd 43 f6 81 ff 02 00 00 	nop 	mfir.xyzw vf22xyzw,vi08
  1deba0:	7d 00 fd 01 3c b1 f6 01 	itof0.xyzw vf22xyzw,vf22xyzw 	lq.xyzw vf29xyzw,125(vi00)
  1deba8:	3c 03 00 80 68 ef 96 00 	add.y vf29y,vf29y,vf22y 	nop
  1debb0:	00 00 00 00 00 05 f6 4a 	*unknown* 	lq. vf00,0(vi00)
  1debb8:	7d e8 e0 03 ff 02 00 00 	nop 	sq.xyzw vf29xyzw,125(vi00)
  1debc0:	3c 03 f3 81 06 f3 39 00 	subz.w vf12w,vf30w,vf25z 	move.xyzw vf19xyzw,vf00xyzw
  1debc8:	3c 03 f2 81 18 e7 8a 00 	mulx.y vf28y,vf28y,vf10x 	move.xyzw vf18xyzw,vf00xyzw
  1debd0:	3c 03 5c 80 d8 de 8a 00 	mulx.y vf27y,vf27y,vf10x 	move.z vf28z,vf00z
  1debd8:	3c 03 f1 81 1c e7 20 00 	mulq.w vf28w,vf28w,q 	move.xyzw vf17xyzw,vf00xyzw
  1debe0:	32 23 04 80 dc f7 e0 01 	mulq.xyzw vf31xyzw,vf30xyzw,q 	iaddi vi04,vi04,12
  1debe8:	f5 c7 e4 03 e0 04 40 00 	addq.z vf19z,vf00z,q 	sq.xyzw vf24xyzw,-11(vi04)
  1debf0:	f8 c7 e4 03 a0 04 c0 00 	addq.yz vf18yz,vf00yz,q 	sq.xyzw vf24xyzw,-8(vi04)
  1debf8:	fb c7 e4 03 1b e7 9c 01 	mulw.xy vf28xy,vf28xy,vf28w 	sq.xyzw vf24xyzw,-5(vi04)
  1dec00:	fe c7 e4 03 db de 9c 01 	mulw.xy vf27xy,vf27xy,vf28w 	sq.xyzw vf24xyzw,-2(vi04)
  1dec08:	fd 9f e4 03 60 04 40 01 	addq.xz vf17xz,vf00xz,q 	sq.xyzw vf19xyzw,-3(vi04)
  1dec10:	03 30 06 10 20 04 c0 01 	addq.xyz vf16xyz,vf00xyz,q 	iaddiu vi06,vi06,3
  1dec18:	00 30 fd 01 ec fd dc 01 	sub.xyz vf23xyz,vf31xyz,vf28xyz 	lq.xyzw vf29xyzw,0(vi06)
  1dec20:	3d 63 4c 80 a8 fd dc 01 	add.xyz vf22xyz,vf31xyz,vf28xyz 	mr32.z vf12z,vf12z
  1dec28:	fa 97 e4 03 6c fd dc 01 	sub.xyz vf21xyz,vf31xyz,vf28xyz 	sq.xyzw vf18xyzw,-6(vi04)
  1dec30:	3c 03 00 80 28 fd dc 01 	add.xyz vf20xyz,vf31xyz,vf28xyz 	nop
  1dec38:	f7 8f e4 03 ec bd 9b 01 	sub.xy vf23xy,vf23xy,vf27xy 	sq.xyzw vf17xyzw,-9(vi04)
  1dec40:	3c 03 00 80 ac b5 9b 01 	sub.xy vf22xy,vf22xy,vf27xy 	nop
  1dec48:	f4 87 e4 03 68 ad 9b 01 	add.xy vf21xy,vf21xy,vf27xy 	sq.xyzw vf16xyzw,-12(vi04)
  1dec50:	3c 03 00 80 28 a5 9b 01 	add.xy vf20xy,vf20xy,vf27xy 	nop
  1dec58:	3c 03 00 80 ec bb 99 01 	sub.xy vf15xy,vf23xy,vf25xy 	nop
  1dec60:	02 30 f8 01 ac b3 99 01 	sub.xy vf14xy,vf22xy,vf25xy 	lq.xyzw vf24xyzw,2(vi06)
  1dec68:	3c 03 00 80 6c ab 99 01 	sub.xy vf13xy,vf21xy,vf25xy 	nop
  1dec70:	3c 03 00 80 2c a3 99 01 	sub.xy vf12xy,vf20xy,vf25xy 	nop
  1dec78:	01 30 bc 01 7d b9 f7 01 	ftoi4.xyzw vf23xyzw,vf23xyzw 	lq.xyw vf28xyw,1(vi06)
  1dec80:	3c 03 00 80 7d b1 f6 01 	ftoi4.xyzw vf22xyzw,vf22xyzw 	nop
  1dec88:	79 00 eb 01 7d a9 f5 01 	ftoi4.xyzw vf21xyzw,vf21xyzw 	lq.xyzw vf11xyzw,121(vi00)
  1dec90:	3c 03 00 80 7d a1 f4 01 	ftoi4.xyzw vf20xyzw,vf20xyzw 	nop
  1dec98:	ff bf e4 03 ff 79 d9 01 	clipw.xyz vf15xyz,vf25w 	sq.xyzw vf23xyzw,-1(vi04)
  1deca0:	fc b7 e4 03 ff 71 d9 01 	clipw.xyz vf14xyz,vf25w 	sq.xyzw vf22xyzw,-4(vi04)
  1deca8:	f9 af e4 03 ff 69 d9 01 	clipw.xyz vf13xyz,vf25w 	sq.xyzw vf21xyzw,-7(vi04)
  1decb0:	f6 a7 e4 03 ff 61 d9 01 	clipw.xyz vf12xyz,vf25w 	sq.xyzw vf20xyzw,-10(vi04)
  1decb8:	f2 47 08 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddi vi08,vi08,-1
  1decc0:	f9 27 2b 0a be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	isw.w vi11,-7(vi04)w
  1decc8:	3c 03 00 80 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	nop
  1decd0:	f6 27 2b 0a 88 0f fd 01 	maddx.xyzw vf30xyzw,vf01xyzw,vf29x 	isw.w vi11,-10(vi04)w
  1decd8:	3c 03 00 80 ec 7b 8b 01 	sub.xy vf15xy,vf15xy,vf11xy 	nop
  1dece0:	3c 03 00 80 ac 73 8b 01 	sub.xy vf14xy,vf14xy,vf11xy 	nop
  1dece8:	3c 03 00 80 6c 6b 8b 01 	sub.xy vf13xy,vf13xy,vf11xy 	nop
  1decf0:	3c 03 00 80 2c 63 8b 01 	sub.xy vf12xy,vf12xy,vf11xy 	nop
  1decf8:	ef f3 3c 24 d9 7b 8a 00 	muly.y vf15y,vf15y,vf10y 	fcand vi01,0x3cf3ef
  1ded00:	3c 03 00 80 99 73 8a 00 	muly.y vf14y,vf14y,vf10y 	nop
  1ded08:	3c 03 00 80 59 6b 8a 00 	muly.y vf13y,vf13y,vf10y 	nop
  1ded10:	bc 03 fe 81 19 63 8a 00 	muly.y vf12y,vf12y,vf10y 	div q,vf00w,vf00x
  1ded18:	3c 03 00 80 ff 79 ca 01 	clipw.xyz vf15xyz,vf10w 	nop
  1ded20:	3c 03 00 80 ff 71 ca 01 	clipw.xyz vf14xyz,vf10w 	nop
  1ded28:	3c 03 00 80 ff 69 ca 01 	clipw.xyz vf13xyz,vf10w 	nop
  1ded30:	f0 59 00 80 ff 61 ca 01 	clipw.xyz vf12xyz,vf10w 	iadd vi07,vi11,vi00
  1ded38:	3c 03 00 80 c5 06 1c 01 	suby.x vf27x,vf00x,vf28y 	nop
  1ded40:	3c 03 00 80 c0 06 9c 00 	addx.y vf27y,vf00y,vf28x 	nop
  1ded48:	0a 00 01 52 1a e7 2a 00 	mulz.w vf28w,vf28w,vf10z 	ibne vi01,vi00,0x1deda0
  1ded50:	f7 7d df 26 7c c1 f8 01 	ftoi0.xyzw vf24xyzw,vf24xyzw 	fcor vi01,0xdf7df7
  1ded58:	08 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1deda0
  1ded60:	fb be ef 26 ff 02 00 00 	nop 	fcor vi01,0xefbefb
  1ded68:	06 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1deda0
  1ded70:	7d df f7 26 ff 02 00 00 	nop 	fcor vi01,0xf7df7d
  1ded78:	04 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1deda0
  1ded80:	be ef fb 26 ff 02 00 00 	nop 	fcor vi01,0xfbefbe
  1ded88:	02 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1deda0
  1ded90:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1ded98:	32 00 07 80 ff 02 00 00 	nop 	iaddi vi07,vi00,0
  1deda0:	ff 27 27 0a ff 02 00 00 	nop 	isw.w vi07,-1(vi04)w
  1deda8:	c2 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1debc0
  1dedb0:	fc 27 27 0a ff 02 00 00 	nop 	isw.w vi07,-4(vi04)w
  1dedb8:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1dedc0:	9e 07 00 40 ff 02 00 00 	nop 	b 0x1deab8
  1dedc8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dedd0:	62 05 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8e8
  1dedd8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dede0:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1dede8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dedf0:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1dedf8:	fe 33 88 80 ff 02 00 00 	nop 	ilwr.y vi08,(vi06)y
  1dee00:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1dee08:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1dee10:	ff 07 ea 11 ff 02 00 00 	nop 	iaddiu vi10,vi00,0x7fff
  1dee18:	06 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1dee50
  1dee20:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1dee28:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1dee30:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1dee38:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dee40:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1dee28
  1dee48:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1dee50:	01 30 fd 01 ff 02 00 00 	nop 	lq.xyzw vf29xyzw,1(vi06)
  1dee58:	fe 33 08 81 ff 02 00 00 	nop 	ilwr.x vi08,(vi06)x
  1dee60:	03 30 f8 01 ff 02 00 00 	nop 	lq.xyzw vf24xyzw,3(vi06)
  1dee68:	7c 33 f2 81 ff 02 00 00 	nop 	lqi.xyzw vf18xyzw,(vi06++)
  1dee70:	01 30 bc 01 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lq.xyw vf28xyw,1(vi06)
  1dee78:	77 00 f9 01 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	lq.xyzw vf25xyzw,119(vi00)
  1dee80:	78 00 ea 01 bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	lq.xyzw vf10xyzw,120(vi00)
  1dee88:	34 42 0a 80 88 0f fd 01 	maddx.xyzw vf30xyzw,vf01xyzw,vf29x 	iand vi08,vi08,vi10
  1dee90:	72 50 0b 80 c5 06 1c 01 	suby.x vf27x,vf00x,vf28y 	iaddi vi11,vi10,1
  1dee98:	70 42 08 80 c0 06 9c 00 	addx.y vf27y,vf00y,vf28x 	iadd vi09,vi08,vi08
  1deea0:	bc 03 fe 81 ff 02 00 00 	nop 	div q,vf00w,vf00x
  1deea8:	7d 93 e4 81 7c c1 f8 01 	ftoi0.xyzw vf24xyzw,vf24xyzw 	sqi.xyzw vf18xyzw,(vi04++)
  1deeb0:	70 4a 09 80 ff 02 00 00 	nop 	iadd vi09,vi09,vi09
  1deeb8:	75 4a 0b 80 ff 02 00 00 	nop 	ior vi09,vi09,vi11
  1deec0:	ff 27 09 0b ff 02 00 00 	nop 	isw.x vi09,-1(vi04)x
  1deec8:	fd 43 f6 81 ff 02 00 00 	nop 	mfir.xyzw vf22xyzw,vi08
  1deed0:	7d 00 fd 01 3c b1 f6 01 	itof0.xyzw vf22xyzw,vf22xyzw 	lq.xyzw vf29xyzw,125(vi00)
  1deed8:	3c 03 00 80 68 ef 96 00 	add.y vf29y,vf29y,vf22y 	nop
  1deee0:	7d e8 e0 03 ff 02 00 00 	nop 	sq.xyzw vf29xyzw,125(vi00)
  1deee8:	3c 03 f3 81 06 f3 39 00 	subz.w vf12w,vf30w,vf25z 	move.xyzw vf19xyzw,vf00xyzw
  1deef0:	3c 03 f2 81 18 e7 8a 00 	mulx.y vf28y,vf28y,vf10x 	move.xyzw vf18xyzw,vf00xyzw
  1deef8:	3c 03 5c 80 d8 de 8a 00 	mulx.y vf27y,vf27y,vf10x 	move.z vf28z,vf00z
  1def00:	3c 03 f1 81 ff 02 00 00 	nop 	move.xyzw vf17xyzw,vf00xyzw
  1def08:	32 23 04 80 dc f7 e0 01 	mulq.xyzw vf31xyzw,vf30xyzw,q 	iaddi vi04,vi04,12
  1def10:	f5 c7 e4 03 e0 04 40 00 	addq.z vf19z,vf00z,q 	sq.xyzw vf24xyzw,-11(vi04)
  1def18:	f8 c7 e4 03 a0 04 c0 00 	addq.yz vf18yz,vf00yz,q 	sq.xyzw vf24xyzw,-8(vi04)
  1def20:	fb c7 e4 03 1b e7 9c 01 	mulw.xy vf28xy,vf28xy,vf28w 	sq.xyzw vf24xyzw,-5(vi04)
  1def28:	fe c7 e4 03 db de 9c 01 	mulw.xy vf27xy,vf27xy,vf28w 	sq.xyzw vf24xyzw,-2(vi04)
  1def30:	fd 9f e4 03 60 04 40 01 	addq.xz vf17xz,vf00xz,q 	sq.xyzw vf19xyzw,-3(vi04)
  1def38:	03 30 06 10 20 04 c0 01 	addq.xyz vf16xyz,vf00xyz,q 	iaddiu vi06,vi06,3
  1def40:	00 30 fd 01 ec fd dc 01 	sub.xyz vf23xyz,vf31xyz,vf28xyz 	lq.xyzw vf29xyzw,0(vi06)
  1def48:	3d 63 4c 80 a8 fd dc 01 	add.xyz vf22xyz,vf31xyz,vf28xyz 	mr32.z vf12z,vf12z
  1def50:	fa 97 e4 03 6c fd dc 01 	sub.xyz vf21xyz,vf31xyz,vf28xyz 	sq.xyzw vf18xyzw,-6(vi04)
  1def58:	3c 03 00 80 28 fd dc 01 	add.xyz vf20xyz,vf31xyz,vf28xyz 	nop
  1def60:	f7 8f e4 03 ec bd 9b 01 	sub.xy vf23xy,vf23xy,vf27xy 	sq.xyzw vf17xyzw,-9(vi04)
  1def68:	3c 03 00 80 ac b5 9b 01 	sub.xy vf22xy,vf22xy,vf27xy 	nop
  1def70:	f4 87 e4 03 68 ad 9b 01 	add.xy vf21xy,vf21xy,vf27xy 	sq.xyzw vf16xyzw,-12(vi04)
  1def78:	3c 03 00 80 28 a5 9b 01 	add.xy vf20xy,vf20xy,vf27xy 	nop
  1def80:	3c 03 00 80 ec bb 99 01 	sub.xy vf15xy,vf23xy,vf25xy 	nop
  1def88:	02 30 f8 01 ac b3 99 01 	sub.xy vf14xy,vf22xy,vf25xy 	lq.xyzw vf24xyzw,2(vi06)
  1def90:	3c 03 00 80 6c ab 99 01 	sub.xy vf13xy,vf21xy,vf25xy 	nop
  1def98:	3c 03 00 80 2c a3 99 01 	sub.xy vf12xy,vf20xy,vf25xy 	nop
  1defa0:	01 30 bc 01 7d b9 f7 01 	ftoi4.xyzw vf23xyzw,vf23xyzw 	lq.xyw vf28xyw,1(vi06)
  1defa8:	3c 03 00 80 7d b1 f6 01 	ftoi4.xyzw vf22xyzw,vf22xyzw 	nop
  1defb0:	3c 03 00 80 7d a9 f5 01 	ftoi4.xyzw vf21xyzw,vf21xyzw 	nop
  1defb8:	3c 03 00 80 7d a1 f4 01 	ftoi4.xyzw vf20xyzw,vf20xyzw 	nop
  1defc0:	ff bf e4 03 ff 79 d9 01 	clipw.xyz vf15xyz,vf25w 	sq.xyzw vf23xyzw,-1(vi04)
  1defc8:	fc b7 e4 03 ff 71 d9 01 	clipw.xyz vf14xyz,vf25w 	sq.xyzw vf22xyzw,-4(vi04)
  1defd0:	f9 af e4 03 ff 69 d9 01 	clipw.xyz vf13xyz,vf25w 	sq.xyzw vf21xyzw,-7(vi04)
  1defd8:	f6 a7 e4 03 ff 61 d9 01 	clipw.xyz vf12xyz,vf25w 	sq.xyzw vf20xyzw,-10(vi04)
  1defe0:	3c 03 00 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	nop
  1defe8:	f2 47 08 80 be 18 fd 01 	maddaz.xyzw accxyzw,vf03xyzw,vf29z 	iaddi vi08,vi08,-1
  1deff0:	f9 27 2b 0a bd 10 fd 01 	madday.xyzw accxyzw,vf02xyzw,vf29y 	isw.w vi11,-7(vi04)w
  1deff8:	f6 27 2b 0a 88 0f fd 01 	maddx.xyzw vf30xyzw,vf01xyzw,vf29x 	isw.w vi11,-10(vi04)w
  1df000:	ef f3 3c 24 c5 06 1c 01 	suby.x vf27x,vf00x,vf28y 	fcand vi01,0x3cf3ef
  1df008:	71 00 01 80 c0 06 9c 00 	addx.y vf27y,vf00y,vf28x 	isub vi01,vi00,vi01
  1df010:	74 58 01 80 ff 02 00 00 	nop 	iand vi01,vi11,vi01
  1df018:	bc 03 fe 81 7c c1 f8 01 	ftoi0.xyzw vf24xyzw,vf24xyzw 	div q,vf00w,vf00x
  1df020:	ff 27 21 0a ff 02 00 00 	nop 	isw.w vi01,-1(vi04)w
  1df028:	d7 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1deee8
  1df030:	fc 27 21 0a ff 02 00 00 	nop 	isw.w vi01,-4(vi04)w
  1df038:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1df040:	b3 07 00 40 ff 02 00 00 	nop 	b 0x1dede0
  1df048:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1df050:	12 05 0f 42 ff 02 00 00 	nop 	bal vi15,0x1dd8e8
  1df058:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1df060:	3c 03 00 80 ff 02 00 40 	nop[e] 	nop
  1df068:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1df070:	bc 06 06 80 ff 02 00 00 	nop 	xtop vi06
  1df078:	fe 33 88 80 ff 02 00 00 	nop 	ilwr.y vi08,(vi06)y
  1df080:	fe 33 0d 81 ff 02 00 00 	nop 	ilwr.x vi13,(vi06)x
  1df088:	e0 30 04 10 ff 02 00 00 	nop 	iaddiu vi04,vi06,0xe0
  1df090:	e0 30 05 10 ff 02 00 00 	nop 	iaddiu vi05,vi06,0xe0
  1df098:	ff 07 ea 11 ff 02 00 00 	nop 	iaddiu vi10,vi00,0x7fff
  1df0a0:	06 00 08 50 ff 02 00 00 	nop 	ibeq vi08,vi00,0x1df0d8
  1df0a8:	01 30 06 10 ff 02 00 00 	nop 	iaddiu vi06,vi06,1
  1df0b0:	7c 33 f7 81 ff 02 00 00 	nop 	lqi.xyzw vf23xyzw,(vi06++)
  1df0b8:	f2 47 08 80 ff 02 00 00 	nop 	iaddi vi08,vi08,-1
  1df0c0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1df0c8:	fc 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1df0b0
  1df0d0:	7d bb e4 81 ff 02 00 00 	nop 	sqi.xyzw vf23xyzw,(vi04++)
  1df0d8:	01 30 f9 01 ff 02 00 00 	nop 	lq.xyzw vf25xyzw,1(vi06)
  1df0e0:	fe 33 08 81 ff 02 00 00 	nop 	ilwr.x vi08,(vi06)x
  1df0e8:	03 30 f8 01 98 06 e0 01 	mulx.xyzw vf26xyzw,vf00xyzw,vf00x 	lq.xyzw vf24xyzw,3(vi06)
  1df0f0:	72 50 0b 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	iaddi vi11,vi10,1
  1df0f8:	05 30 f7 01 be 18 f9 01 	maddaz.xyzw accxyzw,vf03xyzw,vf25z 	lq.xyzw vf23xyzw,5(vi06)
  1df100:	f4 41 0b 80 bd 10 f9 01 	madday.xyzw accxyzw,vf02xyzw,vf25y 	iand vi07,vi08,vi11
  1df108:	f2 6f 0d 80 48 0d f9 01 	maddx.xyzw vf21xyzw,vf01xyzw,vf25x 	iaddi vi13,vi13,-1
  1df110:	7c 33 f2 81 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	lqi.xyzw vf18xyzw,(vi06++)
  1df118:	34 42 0a 80 be 18 f8 01 	maddaz.xyzw accxyzw,vf03xyzw,vf24z 	iand vi08,vi08,vi10
  1df120:	70 42 08 80 bd 10 f8 01 	madday.xyzw accxyzw,vf02xyzw,vf24y 	iadd vi09,vi08,vi08
  1df128:	be af 60 80 08 0d f8 01 	maddx.xyzw vf20xyzw,vf01xyzw,vf24x 	ercpr p,vf21w
  1df130:	3d c3 58 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	mr32.z vf24z,vf24z
  1df138:	7d 93 e4 81 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	sqi.xyzw vf18xyzw,(vi04++)
  1df140:	3c d3 f2 81 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	move.xyzw vf18xyzw,vf26xyzw
  1df148:	bc 03 f4 81 c8 0c f7 01 	maddx.xyzw vf19xyzw,vf01xyzw,vf23x 	div q,vf00w,vf00x
  1df150:	75 4a 07 80 ff 02 00 00 	nop 	ior vi09,vi09,vi07
  1df158:	11 00 07 10 ff 02 00 00 	nop 	iaddiu vi07,vi00,0x11
  1df160:	bf 07 00 80 c6 aa 2f 00 	subz.w vf11w,vf21w,vf15z 	waitp
  1df168:	7c 06 89 80 1c a2 e0 01 	mulq.xyzw vf08xyzw,vf20xyzw,q 	mfp.y vf09y,p
  1df170:	00 38 03 34 60 02 40 00 	addq.z vf09z,vf00z,q 	fmand vi03,vi07
  1df178:	77 00 ef 01 9c c5 40 00 	mulq.z vf22z,vf24z,q 	lq.xyzw vf15xyzw,119(vi00)
  1df180:	ff 27 09 0b ff 02 00 00 	nop 	isw.x vi09,-1(vi04)x
  1df188:	3d 5b 4b 80 d9 a9 e9 01 	muly.xyzw vf07xyzw,vf21xyzw,vf09y 	mr32.z vf11z,vf11z
  1df190:	78 00 ea 01 9b 4d 99 00 	mulw.y vf22y,vf09y,vf25w 	lq.xyzw vf10xyzw,120(vi00)
  1df198:	3d 03 2a 80 c6 a2 2f 00 	subz.w vf11w,vf20w,vf15z 	mr32.w vf10w,vf00w
  1df1a0:	3c 03 5c 80 ec 46 87 01 	sub.xy vf27xy,vf08xy,vf07xy 	move.z vf28z,vf00z
  1df1a8:	3c 03 f8 80 2a df 9b 01 	mul.xy vf28xy,vf27xy,vf27xy 	move.yzw vf24yzw,vf00yzw
  1df1b0:	3d 5b cb 80 01 e7 1c 01 	addy.x vf28x,vf28x,vf28y 	mr32.yz vf11yz,vf11yz
  1df1b8:	be 03 7c 80 83 02 00 01 	addw.x vf10x,vf00x,vf00w 	rsqrt q,vf00w,vf00x
  1df1c0:	fd 43 e5 81 ff 02 00 00 	nop 	mfir.xyzw vf05xyzw,vi08
  1df1c8:	7d 00 fd 01 3c 29 e5 01 	itof0.xyzw vf05xyzw,vf05xyzw 	lq.xyzw vf29xyzw,125(vi00)
  1df1d0:	3c 03 00 80 68 ef 45 00 	add.z vf29z,vf29z,vf05z 	nop
  1df1d8:	7d e8 e0 03 ff 02 00 00 	nop 	sq.xyzw vf29xyzw,125(vi00)
  1df1e0:	bf 03 00 80 ff 02 00 00 	nop 	waitq
  1df1e8:	3c 03 00 80 dc de 80 01 	mulq.xy vf27xy,vf27xy,q 	nop
  1df1f0:	bc 03 f3 81 28 d3 9b 01 	add.xy vf12xy,vf26xy,vf27xy 	div q,vf00w,vf00x
  1df1f8:	3c db fa 81 c6 9a 2f 00 	subz.w vf11w,vf19w,vf15z 	move.xyzw vf26xyzw,vf27xyzw
  1df200:	b2 21 04 80 2a 66 8c 01 	mul.xy vf24xy,vf12xy,vf12xy 	iaddi vi04,vi04,6
  1df208:	b2 30 06 80 01 c6 18 01 	addy.x vf24x,vf24x,vf24y 	iaddi vi06,vi06,2
  1df210:	b2 47 08 80 1c 9d e0 01 	mulq.xyzw vf20xyzw,vf19xyzw,q 	iaddi vi08,vi08,-2
  1df218:	3c 03 90 80 9c bd 20 00 	mulq.w vf22w,vf23w,q 	move.y vf16y,vf00y
  1df220:	fd 43 3f 80 60 52 20 00 	addq.w vf09w,vf10w,q 	mfir.w vf31w,vi08
  1df228:	be 03 78 80 05 06 0c 01 	suby.x vf24x,vf00x,vf12y 	rsqrt q,vf00w,vf00x
  1df230:	3d 5b cb 81 2c a7 88 01 	sub.xy vf28xy,vf20xy,vf08xy 	mr32.xyz vf11xyz,vf11xyz
  1df238:	ff 37 ec 01 18 56 8c 00 	mulx.y vf24y,vf10y,vf12x 	lq.xyzw vf12xyzw,-1(vi06)
  1df240:	3c 03 00 80 01 04 49 00 	addy.z vf16z,vf00z,vf09y 	nop
  1df248:	04 30 f7 01 41 04 c9 00 	addy.yz vf17yz,vf00yz,vf09y 	lq.xyzw vf23xyzw,4(vi06)
  1df250:	3f e7 c0 81 19 94 09 01 	muly.x vf16x,vf18x,vf09y 	erleng p,vf28
  1df258:	3c 03 00 80 59 94 09 01 	muly.x vf17x,vf18x,vf09y 	nop
  1df260:	3d 4b c9 80 7c 61 ec 01 	ftoi0.xyzw vf12xyzw,vf12xyzw 	mr32.yz vf09yz,vf09yz
  1df268:	3c 03 00 80 ac 54 12 01 	sub.x vf18x,vf10x,vf18x 	nop
  1df270:	72 40 08 80 9a b5 8a 00 	mulz.y vf22y,vf22y,vf10z 	iaddi vi08,vi08,1
  1df278:	02 00 03 50 3c f9 3f 00 	itof0.w vf31w,vf31w 	ibeq vi03,vi00,0x1df290
  1df280:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1df288:	3d 03 3f 80 ff 02 00 00 	nop 	mr32.w vf31w,vf00w
  1df290:	bf 03 00 80 19 c6 96 01 	muly.xy vf24xy,vf24xy,vf22y 	waitq
  1df298:	3d b3 d6 80 1c c6 80 01 	mulq.xy vf24xy,vf24xy,q 	mr32.yz vf22yz,vf22yz
  1df2a0:	3c 03 00 80 ef ff 20 00 	mini.w vf31w,vf31w,vf00w 	nop
  1df2a8:	fa 87 e4 03 68 39 d8 01 	add.xyz vf05xyz,vf07xyz,vf24xyz 	sq.xyzw vf16xyzw,-6(vi04)
  1df2b0:	fd 8f e4 03 ac 39 d8 01 	sub.xyz vf06xyz,vf07xyz,vf24xyz 	sq.xyzw vf17xyzw,-3(vi04)
  1df2b8:	3c 03 00 80 40 03 4b 00 	addx.z vf13z,vf00z,vf11x 	nop
  1df2c0:	3c 03 00 80 ac 2b 8f 01 	sub.xy vf14xy,vf05xy,vf15xy 	nop
  1df2c8:	fb 67 e4 03 6c 33 8f 01 	sub.xy vf13xy,vf06xy,vf15xy 	sq.xyzw vf12xyzw,-5(vi04)
  1df2d0:	fe 67 e4 03 7d 29 e5 01 	ftoi4.xyzw vf05xyzw,vf05xyzw 	sq.xyzw vf12xyzw,-2(vi04)
  1df2d8:	3c 43 e7 81 7d 31 e6 01 	ftoi4.xyzw vf06xyzw,vf06xyzw 	move.xyzw vf07xyzw,vf08xyzw
  1df2e0:	3c a3 e8 81 ff 71 cf 01 	clipw.xyz vf14xyz,vf15w 	move.xyzw vf08xyzw,vf20xyzw
  1df2e8:	7c 06 3c 80 ff 69 cf 01 	clipw.xyz vf13xyz,vf15w 	mfp.w vf28w,p
  1df2f0:	3c 03 00 80 bf 21 e0 01 	mulaw.xyzw accxyzw,vf04xyzw,vf00w 	nop
  1df2f8:	fc 2f e4 03 be 18 f7 01 	maddaz.xyzw accxyzw,vf03xyzw,vf23z 	sq.xyzw vf05xyzw,-4(vi04)
  1df300:	ff 37 e4 03 bd 10 f7 01 	madday.xyzw accxyzw,vf02xyzw,vf23y 	sq.xyzw vf06xyzw,-1(vi04)
  1df308:	ff fb bf 24 db e6 9c 01 	mulw.xy vf27xy,vf28xy,vf28w 	fcand vi01,0xbffbff
  1df310:	71 00 01 80 ff 02 00 00 	nop 	isub vi01,vi00,vi01
  1df318:	74 58 01 80 c8 0c f7 01 	maddx.xyzw vf19xyzw,vf01xyzw,vf23x 	iand vi01,vi11,vi01
  1df320:	fc 27 21 0a ff 02 00 00 	nop 	isw.w vi01,-4(vi04)w
  1df328:	ff 27 21 0a db de 9f 01 	mulw.xy vf27xy,vf27xy,vf31w 	isw.w vi01,-1(vi04)w
  1df330:	d7 47 00 5a ff 02 00 00 	nop 	ibgtz vi08,0x1df1f0
  1df338:	00 38 03 34 ff 02 00 00 	nop 	fmand vi03,vi07
  1df340:	b2 6f 00 5a ff 02 00 00 	nop 	ibgtz vi13,0x1df0d8
  1df348:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1df350:	fc 2e 00 80 ff 02 00 00 	nop 	xgkick vi05
  1df358:	a0 07 00 40 ff 02 00 00 	nop 	b 0x1df060
  1df360:	3c 03 00 80 ff 02 00 00 	nop 	nop
	...
  1df370:	b2 00 00 70 00 00 00 00 	addx. vf00,vf00,vf00x 	*unknown*
  1df378:	00 00 00 00 00 00 00 4a 	*unknown* 	lq. vf00,0(vi00)
  1df380:	3c 03 00 80 bc 29 e1 01 	mulax.xyzw accxyzw,vf05xyzw,vf01x 	nop
  1df388:	3c 03 00 80 bd 30 e1 01 	madday.xyzw accxyzw,vf06xyzw,vf01y 	nop
  1df390:	3c 03 00 80 be 38 e1 01 	maddaz.xyzw accxyzw,vf07xyzw,vf01z 	nop
  1df398:	3c 03 00 80 4b 42 e1 01 	maddw.xyzw vf09xyzw,vf08xyzw,vf01w 	nop
  1df3a0:	3c 03 00 80 bc 29 e2 01 	mulax.xyzw accxyzw,vf05xyzw,vf02x 	nop
  1df3a8:	3c 03 00 80 bd 30 e2 01 	madday.xyzw accxyzw,vf06xyzw,vf02y 	nop
  1df3b0:	3c 03 00 80 be 38 e2 01 	maddaz.xyzw accxyzw,vf07xyzw,vf02z 	nop
  1df3b8:	3c 03 00 80 8b 42 e2 01 	maddw.xyzw vf10xyzw,vf08xyzw,vf02w 	nop
  1df3c0:	3c 03 00 80 bc 29 e3 01 	mulax.xyzw accxyzw,vf05xyzw,vf03x 	nop
  1df3c8:	3c 03 00 80 bd 30 e3 01 	madday.xyzw accxyzw,vf06xyzw,vf03y 	nop
  1df3d0:	3c 03 00 80 be 38 e3 01 	maddaz.xyzw accxyzw,vf07xyzw,vf03z 	nop
  1df3d8:	3c 03 00 80 cb 42 e3 01 	maddw.xyzw vf11xyzw,vf08xyzw,vf03w 	nop
  1df3e0:	3c 03 00 80 bc 29 e4 01 	mulax.xyzw accxyzw,vf05xyzw,vf04x 	nop
  1df3e8:	3c 03 00 80 bd 30 e4 01 	madday.xyzw accxyzw,vf06xyzw,vf04y 	nop
  1df3f0:	3c 03 00 80 be 38 e4 41 	maddaz[e].xyzw accxyzw,vf07xyzw,vf04z 	nop
  1df3f8:	3c 03 00 80 0b 43 e4 01 	maddw.xyzw vf12xyzw,vf08xyzw,vf04w 	nop
  1df400:	3c 03 00 80 bc 69 e1 01 	mulax.xyzw accxyzw,vf13xyzw,vf01x 	nop
  1df408:	3c 03 00 80 bd 70 e1 01 	madday.xyzw accxyzw,vf14xyzw,vf01y 	nop
  1df410:	3c 03 00 80 be 78 e1 01 	maddaz.xyzw accxyzw,vf15xyzw,vf01z 	nop
  1df418:	3c 03 00 80 4b 84 e1 01 	maddw.xyzw vf17xyzw,vf16xyzw,vf01w 	nop
  1df420:	3c 03 00 80 bc 69 e2 01 	mulax.xyzw accxyzw,vf13xyzw,vf02x 	nop
  1df428:	3c 03 00 80 bd 70 e2 01 	madday.xyzw accxyzw,vf14xyzw,vf02y 	nop
  1df430:	3c 03 00 80 be 78 e2 01 	maddaz.xyzw accxyzw,vf15xyzw,vf02z 	nop
  1df438:	3c 03 00 80 8b 84 e2 01 	maddw.xyzw vf18xyzw,vf16xyzw,vf02w 	nop
  1df440:	3c 03 00 80 bc 69 e3 01 	mulax.xyzw accxyzw,vf13xyzw,vf03x 	nop
  1df448:	3c 03 00 80 bd 70 e3 01 	madday.xyzw accxyzw,vf14xyzw,vf03y 	nop
  1df450:	3c 03 00 80 be 78 e3 01 	maddaz.xyzw accxyzw,vf15xyzw,vf03z 	nop
  1df458:	3c 03 00 80 cb 84 e3 01 	maddw.xyzw vf19xyzw,vf16xyzw,vf03w 	nop
  1df460:	3c 03 00 80 bc 69 e4 01 	mulax.xyzw accxyzw,vf13xyzw,vf04x 	nop
  1df468:	3c 03 00 80 bd 70 e4 01 	madday.xyzw accxyzw,vf14xyzw,vf04y 	nop
  1df470:	3c 03 00 80 be 78 e4 41 	maddaz[e].xyzw accxyzw,vf15xyzw,vf04z 	nop
  1df478:	3c 03 00 80 0b 85 e4 01 	maddw.xyzw vf20xyzw,vf16xyzw,vf04w 	nop
  1df480:	3d 03 2a 80 40 01 82 00 	addx.y vf05y,vf00y,vf02x 	mr32.w vf10w,vf00w
  1df488:	3d 1b 48 80 40 01 43 00 	addx.z vf05z,vf00z,vf03x 	mr32.z vf08z,vf03z
  1df490:	3c 0b 05 81 81 01 43 00 	addy.z vf06z,vf00z,vf03y 	move.x vf05x,vf01x
  1df498:	3d 23 25 80 81 51 24 00 	addy.w vf06w,vf10w,vf04y 	mr32.w vf05w,vf04w
  1df4a0:	3c 13 86 80 c2 51 24 00 	addz.w vf07w,vf10w,vf04z 	move.y vf06y,vf02y
  1df4a8:	3d 0b 06 81 c2 01 01 01 	addz.x vf07x,vf00x,vf01z 	mr32.x vf06x,vf01x
  1df4b0:	3c 1b 47 80 03 02 01 01 	addw.x vf08x,vf00x,vf01w 	move.z vf07z,vf03z
  1df4b8:	3d 13 87 80 03 02 82 00 	addw.y vf08y,vf00y,vf02w 	mr32.y vf07y,vf02y
  1df4c0:	3c 23 28 80 bf 41 e9 01 	mulaw.xyzw accxyzw,vf08xyzw,vf09w 	move.w vf08w,vf04w
  1df4c8:	3c 03 00 80 be 38 e9 01 	maddaz.xyzw accxyzw,vf07xyzw,vf09z 	nop
  1df4d0:	3c 03 00 80 bd 30 e9 41 	madday[e].xyzw accxyzw,vf06xyzw,vf09y 	nop
  1df4d8:	3c 03 00 80 88 2a e9 01 	maddx.xyzw vf10xyzw,vf05xyzw,vf09x 	nop
  1df4e0:	3c 13 86 80 40 01 82 00 	addx.y vf05y,vf00y,vf02x 	move.y vf06y,vf02y
  1df4e8:	3d 0b 06 81 40 01 43 00 	addx.z vf05z,vf00z,vf03x 	mr32.x vf06x,vf01x
  1df4f0:	3c 0b 05 81 81 01 43 00 	addy.z vf06z,vf00z,vf03y 	move.x vf05x,vf01x
  1df4f8:	3c 4b 2a 80 c2 01 01 01 	addz.x vf07x,vf00x,vf01z 	move.w vf10w,vf09w
  1df500:	3c 1b 47 80 ff 02 00 00 	nop 	move.z vf07z,vf03z
  1df508:	3d 13 87 80 ff 02 00 00 	nop 	mr32.y vf07y,vf02y
  1df510:	3c 03 00 80 bc 29 c9 01 	mulax.xyz accxyz,vf05xyz,vf09x 	nop
  1df518:	3c 03 00 80 bd 30 c9 01 	madday.xyz accxyz,vf06xyz,vf09y 	nop
  1df520:	3c 03 00 80 8a 3a c9 01 	maddz.xyz vf10xyz,vf07xyz,vf09z 	nop
  1df528:	04 00 02 10 ec 5a ca 01 	sub.xyz vf11xyz,vf11xyz,vf10xyz 	iaddiu vi02,vi00,4
  1df530:	3c 03 00 80 2c 63 ca 01 	sub.xyz vf12xyz,vf12xyz,vf10xyz 	nop
  1df538:	3c 03 00 80 6c 6b 4a 01 	sub.xz vf13xz,vf13xz,vf10xz 	nop
  1df540:	3c 03 00 80 fe 5a cc 01 	opmula.xyz accxyz,vf11xyz,vf12xyz 	nop
  1df548:	3c 03 00 80 ae 63 cb 01 	opmsub.xyz vf14xyz,vf12xyz,vf11xyz 	nop
  1df550:	3c 03 00 80 be 61 0d 01 	mulaz.x accx,vf12x,vf13z 	nop
  1df558:	3c 03 00 80 ce 6b 0c 01 	msubz.x vf15x,vf13x,vf12z 	nop
  1df560:	3c 03 00 80 be 69 0b 01 	mulaz.x accx,vf13x,vf11z 	nop
  1df568:	00 10 01 34 0e 5c 0d 01 	msubz.x vf16x,vf11x,vf13z 	fmand vi01,vi02
  1df570:	bc 03 ee 80 ff 02 00 00 	nop 	div q,vf00w,vf00x
  1df578:	03 00 01 52 bd 79 0b 01 	mulay.x accx,vf15x,vf11y 	ibne vi01,vi00,0x1df598
  1df580:	3c 03 00 80 49 84 0c 01 	maddy.x vf17x,vf16x,vf12y 	nop
  1df588:	bf 03 00 80 3d 00 0a 41 	adday[e].x accx,vf00x,vf10y 	waitq
  1df590:	3c 03 00 80 61 8c 00 01 	maddq.x vf17x,vf17x,q 	nop
  1df598:	3d 53 11 81 ff 02 00 40 	nop[e] 	mr32.x vf17x,vf10x
  1df5a0:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1df5a8:	3c 03 00 80 2c 77 4a 01 	sub.xz vf28xz,vf14xz,vf10xz 	nop
  1df5b0:	3c 03 00 80 2c 76 4b 01 	sub.xz vf24xz,vf14xz,vf11xz 	nop
  1df5b8:	3c 03 00 80 ec 5e 4a 01 	sub.xz vf27xz,vf11xz,vf10xz 	nop
  1df5c0:	3c 03 00 80 ac 65 4b 01 	sub.xz vf22xz,vf12xz,vf11xz 	nop
  1df5c8:	3c 03 00 80 ec 6d 4b 01 	sub.xz vf23xz,vf13xz,vf11xz 	nop
  1df5d0:	3c 03 00 80 6c 6e 4c 01 	sub.xz vf25xz,vf13xz,vf12xz 	nop
  1df5d8:	3c 03 00 80 ac 76 4c 01 	sub.xz vf26xz,vf14xz,vf12xz 	nop
  1df5e0:	3c 03 00 80 6c 57 4d 01 	sub.xz vf29xz,vf10xz,vf13xz 	nop
  1df5e8:	3c 03 00 80 ac 77 4d 01 	sub.xz vf30xz,vf14xz,vf13xz 	nop
  1df5f0:	3c 03 00 80 be b9 18 01 	mulaz.x accx,vf23x,vf24z 	nop
  1df5f8:	3c 03 00 80 ce c3 17 01 	msubz.x vf15x,vf24x,vf23z 	nop
  1df600:	3c 03 00 80 be b1 18 01 	mulaz.x accx,vf22x,vf24z 	nop
  1df608:	3c 03 00 80 0e c4 16 01 	msubz.x vf16x,vf24x,vf22z 	nop
  1df610:	3c 03 00 80 be c9 1a 01 	mulaz.x accx,vf25x,vf26z 	nop
  1df618:	3c 03 00 80 4e d4 19 01 	msubz.x vf17x,vf26x,vf25z 	nop
  1df620:	3c 03 00 80 be d9 1c 01 	mulaz.x accx,vf27x,vf28z 	nop
  1df628:	3c 03 00 80 8e e4 1b 01 	msubz.x vf18x,vf28x,vf27z 	nop
  1df630:	3c 03 00 80 be e9 1e 41 	mulaz[e].x accx,vf29x,vf30z 	nop
  1df638:	3c 03 00 80 ce f4 1d 01 	msubz.x vf19x,vf30x,vf29z 	nop
  1df640:	3c 03 8f 80 03 02 80 00 	addw.y vf08y,vf00y,vf00w 	move.y vf15y,vf00y
  1df648:	3c 03 48 81 c2 03 05 01 	addz.x vf15x,vf00x,vf05z 	move.xz vf08xz,vf00xz
  1df650:	3d 03 39 80 c4 03 45 00 	subx.z vf15z,vf00z,vf05x 	mr32.w vf25w,vf00w
  1df658:	3d 03 3b 80 be 29 c6 01 	mulaz.xyz accxyz,vf05xyz,vf06z 	mr32.w vf27w,vf00w
  1df660:	3d 03 3a 80 09 44 c6 01 	maddy.xyz vf16xyz,vf08xyz,vf06y 	mr32.w vf26w,vf00w
  1df668:	3c 03 00 80 bd 29 c6 01 	mulay.xyz accxyz,vf05xyz,vf06y 	nop
  1df670:	3c 03 00 80 ce 46 c6 01 	msubz.xyz vf27xyz,vf08xyz,vf06z 	nop
  1df678:	3c 03 00 80 bc 79 c7 01 	mulax.xyz accxyz,vf15xyz,vf07x 	nop
  1df680:	3c 03 00 80 49 86 c7 01 	maddy.xyz vf25xyz,vf16xyz,vf07y 	nop
  1df688:	3c 03 00 80 bc 81 c7 41 	mulax[e].xyz accxyz,vf16xyz,vf07x 	nop
  1df690:	3c 03 00 80 8d 7e c7 01 	msuby.xyz vf26xyz,vf15xyz,vf07y 	nop
  1df698:	3c 7b 21 81 6c 02 d2 01 	sub.xyz vf09xyz,vf00xyz,vf18xyz 	move.xw vf01xw,vf15xw
  1df6a0:	3c 83 a2 80 40 00 90 00 	addx.y vf01y,vf00y,vf16x 	move.yw vf02yw,vf16yw
  1df6a8:	3c 8b 63 80 40 00 51 00 	addx.z vf01z,vf00z,vf17x 	move.zw vf03zw,vf17zw
  1df6b0:	3d 7b 02 81 c2 00 0f 01 	addz.x vf03x,vf00x,vf15z 	mr32.x vf02x,vf15x
  1df6b8:	3d 83 83 80 81 00 51 00 	addy.z vf02z,vf00z,vf17y 	mr32.y vf03y,vf16y
  1df6c0:	3c 03 24 80 bc 09 c9 01 	mulax.xyz accxyz,vf01xyz,vf09x 	move.w vf04w,vf00w
  1df6c8:	3c 03 00 80 bd 10 c9 41 	madday[e].xyz accxyz,vf02xyz,vf09y 	nop
  1df6d0:	3c 03 00 80 0a 19 c9 01 	maddz.xyz vf04xyz,vf03xyz,vf09z 	nop
  1df6d8:	3c 03 00 80 ea 9c d3 01 	mul.xyz vf19xyz,vf19xyz,vf19xyz 	nop
  1df6e0:	3c 03 00 80 d8 7b f3 01 	mulx.xyzw vf15xyzw,vf15xyzw,vf19x 	nop
  1df6e8:	3c 03 00 80 19 84 f3 01 	muly.xyzw vf16xyzw,vf16xyzw,vf19y 	nop
  1df6f0:	3c 03 00 80 5a 8c f3 01 	mulz.xyzw vf17xyzw,vf17xyzw,vf19z 	nop
  1df6f8:	3c 7b 21 81 6c 02 d2 01 	sub.xyz vf09xyz,vf00xyz,vf18xyz 	move.xw vf01xw,vf15xw
  1df700:	3c 83 a2 80 40 00 90 00 	addx.y vf01y,vf00y,vf16x 	move.yw vf02yw,vf16yw
  1df708:	3c 8b 63 80 40 00 51 00 	addx.z vf01z,vf00z,vf17x 	move.zw vf03zw,vf17zw
  1df710:	3d 7b 02 81 c2 00 0f 01 	addz.x vf03x,vf00x,vf15z 	mr32.x vf02x,vf15x
  1df718:	3d 83 83 80 81 00 51 00 	addy.z vf02z,vf00z,vf17y 	mr32.y vf03y,vf16y
  1df720:	3c 03 24 80 bc 09 c9 01 	mulax.xyz accxyz,vf01xyz,vf09x 	move.w vf04w,vf00w
  1df728:	3c 03 00 80 bd 10 c9 41 	madday[e].xyz accxyz,vf02xyz,vf09y 	nop
  1df730:	3c 03 00 80 0a 19 c9 01 	maddz.xyz vf04xyz,vf03xyz,vf09z 	nop
  1df738:	80 00 02 10 bc 49 ee 01 	mulax.xyzw accxyzw,vf09xyzw,vf14x 	iaddiu vi02,vi00,0x80
  1df740:	3c 03 00 80 bd 50 ee 01 	madday.xyzw accxyzw,vf10xyzw,vf14y 	nop
  1df748:	3c 03 00 80 ca 5f ee 01 	maddz.xyzw vf31xyzw,vf11xyzw,vf14z 	nop
  1df750:	3c 03 00 80 bc 09 ee 01 	mulax.xyzw accxyzw,vf01xyzw,vf14x 	nop
  1df758:	3c 03 00 80 bd 10 ee 01 	madday.xyzw accxyzw,vf02xyzw,vf14y 	nop
  1df760:	3c 03 00 80 8a 1f ee 01 	maddz.xyzw vf30xyzw,vf03xyzw,vf14z 	nop
  1df768:	3c 03 00 80 fd f9 ff 01 	abs.xyzw vf31xyzw,vf31xyzw 	nop
  1df770:	3c 03 00 80 fe 62 c5 01 	opmula.xyz accxyz,vf12xyz,vf05xyz 	nop
  1df778:	3c 03 00 80 ee 2b cc 01 	opmsub.xyz vf15xyz,vf05xyz,vf12xyz 	nop
  1df780:	3c 03 00 80 fd f1 fe 01 	abs.xyzw vf30xyzw,vf30xyzw 	nop
  1df788:	3c 03 00 80 ec 9f 5f 00 	sub.z vf31z,vf19z,vf31z 	nop
  1df790:	3c 03 00 80 bc 49 e5 01 	mulax.xyzw accxyzw,vf09xyzw,vf05x 	nop
  1df798:	3c 03 00 80 bd 50 e5 01 	madday.xyzw accxyzw,vf10xyzw,vf05y 	nop
  1df7a0:	3c 03 00 80 4a 5f e5 01 	maddz.xyzw vf29xyzw,vf11xyzw,vf05z 	nop
  1df7a8:	3c 03 00 80 a8 f7 df 01 	add.xyz vf30xyz,vf30xyz,vf31xyz 	nop
  1df7b0:	3c 03 00 80 bc 09 e5 01 	mulax.xyzw accxyzw,vf01xyzw,vf05x 	nop
  1df7b8:	3c 03 00 80 bd 10 e5 01 	madday.xyzw accxyzw,vf02xyzw,vf05y 	nop
  1df7c0:	3c 03 00 80 0a 1f e5 01 	maddz.xyzw vf28xyzw,vf03xyzw,vf05z 	nop
  1df7c8:	3c 03 00 80 3d f0 1e 01 	adday.x accx,vf30x,vf30y 	nop
  1df7d0:	3c 03 00 80 8a 9f 1e 01 	maddz.x vf30x,vf19x,vf30z 	nop
  1df7d8:	3c 03 00 80 fd e9 fd 01 	abs.xyzw vf29xyzw,vf29xyzw 	nop
  1df7e0:	3c 03 00 80 fe 62 c6 01 	opmula.xyz accxyz,vf12xyz,vf06xyz 	nop
  1df7e8:	3c 03 00 80 2e 34 cc 01 	opmsub.xyz vf16xyz,vf06xyz,vf12xyz 	nop
  1df7f0:	00 10 01 34 fd e1 fc 01 	abs.xyzw vf28xyzw,vf28xyzw 	fmand vi01,vi02
  1df7f8:	77 00 01 52 6c 9f 5d 00 	sub.z vf29z,vf19z,vf29z 	ibne vi01,vi00,0x1dfbb8
  1df800:	3c 03 00 80 bc 49 e6 01 	mulax.xyzw accxyzw,vf09xyzw,vf06x 	nop
  1df808:	3c 03 00 80 bd 50 e6 01 	madday.xyzw accxyzw,vf10xyzw,vf06y 	nop
  1df810:	3c 03 00 80 ca 5f e6 01 	maddz.xyzw vf31xyzw,vf11xyzw,vf06z 	nop
  1df818:	3c 03 00 80 28 e7 dd 01 	add.xyz vf28xyz,vf28xyz,vf29xyz 	nop
  1df820:	3c 03 00 80 bc 09 e6 01 	mulax.xyzw accxyzw,vf01xyzw,vf06x 	nop
  1df828:	3c 03 00 80 bd 10 e6 01 	madday.xyzw accxyzw,vf02xyzw,vf06y 	nop
  1df830:	3c 03 00 80 8a 1f e6 01 	maddz.xyzw vf30xyzw,vf03xyzw,vf06z 	nop
  1df838:	3c 03 00 80 3d e0 1c 01 	adday.x accx,vf28x,vf28y 	nop
  1df840:	3c 03 00 80 0a 9f 1c 01 	maddz.x vf28x,vf19x,vf28z 	nop
  1df848:	3c 03 00 80 fd f9 ff 01 	abs.xyzw vf31xyzw,vf31xyzw 	nop
  1df850:	3c 03 00 80 fe 62 c7 01 	opmula.xyz accxyz,vf12xyz,vf07xyz 	nop
  1df858:	3c 03 00 80 6e 3c cc 01 	opmsub.xyz vf17xyz,vf07xyz,vf12xyz 	nop
  1df860:	00 10 01 34 fd f1 fe 01 	abs.xyzw vf30xyzw,vf30xyzw 	fmand vi01,vi02
  1df868:	69 00 01 52 ec 9f 5f 00 	sub.z vf31z,vf19z,vf31z 	ibne vi01,vi00,0x1dfbb8
  1df870:	3c 03 00 80 bc 49 e7 01 	mulax.xyzw accxyzw,vf09xyzw,vf07x 	nop
  1df878:	3c 03 00 80 bd 50 e7 01 	madday.xyzw accxyzw,vf10xyzw,vf07y 	nop
  1df880:	3c 03 00 80 4a 5f e7 01 	maddz.xyzw vf29xyzw,vf11xyzw,vf07z 	nop
  1df888:	3c 03 00 80 a8 f7 df 01 	add.xyz vf30xyz,vf30xyz,vf31xyz 	nop
  1df890:	3c 03 00 80 bc 09 e7 01 	mulax.xyzw accxyzw,vf01xyzw,vf07x 	nop
  1df898:	3c 03 00 80 bd 10 e7 01 	madday.xyzw accxyzw,vf02xyzw,vf07y 	nop
  1df8a0:	3c 03 00 80 0a 1f e7 01 	maddz.xyzw vf28xyzw,vf03xyzw,vf07z 	nop
  1df8a8:	3c 03 00 80 3d f0 1e 01 	adday.x accx,vf30x,vf30y 	nop
  1df8b0:	3c 03 00 80 8a 9f 1e 01 	maddz.x vf30x,vf19x,vf30z 	nop
  1df8b8:	3c 03 00 80 fd e9 fd 01 	abs.xyzw vf29xyzw,vf29xyzw 	nop
  1df8c0:	3c 03 00 80 fe 6a c5 01 	opmula.xyz accxyz,vf13xyz,vf05xyz 	nop
  1df8c8:	3c 03 00 80 ae 2c cd 01 	opmsub.xyz vf18xyz,vf05xyz,vf13xyz 	nop
  1df8d0:	00 10 01 34 fd e1 fc 01 	abs.xyzw vf28xyzw,vf28xyzw 	fmand vi01,vi02
  1df8d8:	5b 00 01 52 6c 9f 5d 00 	sub.z vf29z,vf19z,vf29z 	ibne vi01,vi00,0x1dfbb8
  1df8e0:	3c 03 00 80 bc 49 ef 01 	mulax.xyzw accxyzw,vf09xyzw,vf15x 	nop
  1df8e8:	3c 03 00 80 bd 50 ef 01 	madday.xyzw accxyzw,vf10xyzw,vf15y 	nop
  1df8f0:	3c 03 00 80 ca 5f ef 01 	maddz.xyzw vf31xyzw,vf11xyzw,vf15z 	nop
  1df8f8:	3c 03 00 80 28 e7 dd 01 	add.xyz vf28xyz,vf28xyz,vf29xyz 	nop
  1df900:	3c 03 00 80 bc 09 ef 01 	mulax.xyzw accxyzw,vf01xyzw,vf15x 	nop
  1df908:	3c 03 00 80 bd 10 ef 01 	madday.xyzw accxyzw,vf02xyzw,vf15y 	nop
  1df910:	3c 03 00 80 8a 1f ef 01 	maddz.xyzw vf30xyzw,vf03xyzw,vf15z 	nop
  1df918:	3c 03 00 80 3d e0 1c 01 	adday.x accx,vf28x,vf28y 	nop
  1df920:	3c 03 00 80 0a 9f 1c 01 	maddz.x vf28x,vf19x,vf28z 	nop
  1df928:	3c 03 00 80 fd f9 ff 01 	abs.xyzw vf31xyzw,vf31xyzw 	nop
  1df930:	3c 03 00 80 fe 6a c6 01 	opmula.xyz accxyz,vf13xyz,vf06xyz 	nop
  1df938:	3c 03 00 80 ee 33 cd 01 	opmsub.xyz vf15xyz,vf06xyz,vf13xyz 	nop
  1df940:	00 10 01 34 fd f1 fe 01 	abs.xyzw vf30xyzw,vf30xyzw 	fmand vi01,vi02
  1df948:	4d 00 01 52 ec 9f 5f 00 	sub.z vf31z,vf19z,vf31z 	ibne vi01,vi00,0x1dfbb8
  1df950:	3c 03 00 80 bc 49 f0 01 	mulax.xyzw accxyzw,vf09xyzw,vf16x 	nop
  1df958:	3c 03 00 80 bd 50 f0 01 	madday.xyzw accxyzw,vf10xyzw,vf16y 	nop
  1df960:	3c 03 00 80 4a 5f f0 01 	maddz.xyzw vf29xyzw,vf11xyzw,vf16z 	nop
  1df968:	3c 03 00 80 a8 f7 df 01 	add.xyz vf30xyz,vf30xyz,vf31xyz 	nop
  1df970:	3c 03 00 80 bc 09 f0 01 	mulax.xyzw accxyzw,vf01xyzw,vf16x 	nop
  1df978:	3c 03 00 80 bd 10 f0 01 	madday.xyzw accxyzw,vf02xyzw,vf16y 	nop
  1df980:	3c 03 00 80 0a 1f f0 01 	maddz.xyzw vf28xyzw,vf03xyzw,vf16z 	nop
  1df988:	3c 03 00 80 3d f0 1e 01 	adday.x accx,vf30x,vf30y 	nop
  1df990:	3c 03 00 80 8a 9f 1e 01 	maddz.x vf30x,vf19x,vf30z 	nop
  1df998:	3c 03 00 80 fd e9 fd 01 	abs.xyzw vf29xyzw,vf29xyzw 	nop
  1df9a0:	3c 03 00 80 fe 6a c7 01 	opmula.xyz accxyz,vf13xyz,vf07xyz 	nop
  1df9a8:	3c 03 00 80 2e 3c cd 01 	opmsub.xyz vf16xyz,vf07xyz,vf13xyz 	nop
  1df9b0:	00 10 01 34 fd e1 fc 01 	abs.xyzw vf28xyzw,vf28xyzw 	fmand vi01,vi02
  1df9b8:	3f 00 01 52 6c 9f 5d 00 	sub.z vf29z,vf19z,vf29z 	ibne vi01,vi00,0x1dfbb8
  1df9c0:	3c 03 00 80 bc 49 f1 01 	mulax.xyzw accxyzw,vf09xyzw,vf17x 	nop
  1df9c8:	3c 03 00 80 bd 50 f1 01 	madday.xyzw accxyzw,vf10xyzw,vf17y 	nop
  1df9d0:	3c 03 00 80 ca 5f f1 01 	maddz.xyzw vf31xyzw,vf11xyzw,vf17z 	nop
  1df9d8:	3c 03 00 80 28 e7 dd 01 	add.xyz vf28xyz,vf28xyz,vf29xyz 	nop
  1df9e0:	3c 03 00 80 bc 09 f1 01 	mulax.xyzw accxyzw,vf01xyzw,vf17x 	nop
  1df9e8:	3c 03 00 80 bd 10 f1 01 	madday.xyzw accxyzw,vf02xyzw,vf17y 	nop
  1df9f0:	3c 03 00 80 8a 1f f1 01 	maddz.xyzw vf30xyzw,vf03xyzw,vf17z 	nop
  1df9f8:	3c 03 00 80 3d e0 1c 01 	adday.x accx,vf28x,vf28y 	nop
  1dfa00:	3c 03 00 80 0a 9f 1c 01 	maddz.x vf28x,vf19x,vf28z 	nop
  1dfa08:	3c 03 00 80 fd f9 ff 01 	abs.xyzw vf31xyzw,vf31xyzw 	nop
  1dfa10:	3c 03 00 80 fd f1 fe 01 	abs.xyzw vf30xyzw,vf30xyzw 	nop
  1dfa18:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfa20:	00 10 01 34 ec 9f 5f 00 	sub.z vf31z,vf19z,vf31z 	fmand vi01,vi02
  1dfa28:	31 00 01 52 bc 49 f2 01 	mulax.xyzw accxyzw,vf09xyzw,vf18x 	ibne vi01,vi00,0x1dfbb8
  1dfa30:	3c 03 00 80 bd 50 f2 01 	madday.xyzw accxyzw,vf10xyzw,vf18y 	nop
  1dfa38:	3c 03 00 80 4a 5f f2 01 	maddz.xyzw vf29xyzw,vf11xyzw,vf18z 	nop
  1dfa40:	3c 03 00 80 a8 f7 df 01 	add.xyz vf30xyz,vf30xyz,vf31xyz 	nop
  1dfa48:	3c 03 00 80 bc 09 f2 01 	mulax.xyzw accxyzw,vf01xyzw,vf18x 	nop
  1dfa50:	3c 03 00 80 bd 10 f2 01 	madday.xyzw accxyzw,vf02xyzw,vf18y 	nop
  1dfa58:	3c 03 00 80 0a 1f f2 01 	maddz.xyzw vf28xyzw,vf03xyzw,vf18z 	nop
  1dfa60:	3c 03 00 80 3d f0 1e 01 	adday.x accx,vf30x,vf30y 	nop
  1dfa68:	3c 03 00 80 8a 9f 1e 01 	maddz.x vf30x,vf19x,vf30z 	nop
  1dfa70:	3c 03 00 80 fd e9 fd 01 	abs.xyzw vf29xyzw,vf29xyzw 	nop
  1dfa78:	3c 03 00 80 fd e1 fc 01 	abs.xyzw vf28xyzw,vf28xyzw 	nop
  1dfa80:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfa88:	00 10 01 34 6c 9f 5d 00 	sub.z vf29z,vf19z,vf29z 	fmand vi01,vi02
  1dfa90:	24 00 01 52 bc 49 ef 01 	mulax.xyzw accxyzw,vf09xyzw,vf15x 	ibne vi01,vi00,0x1dfbb8
  1dfa98:	3c 03 00 80 bd 50 ef 01 	madday.xyzw accxyzw,vf10xyzw,vf15y 	nop
  1dfaa0:	3c 03 00 80 ca 5f ef 01 	maddz.xyzw vf31xyzw,vf11xyzw,vf15z 	nop
  1dfaa8:	3c 03 00 80 28 e7 dd 01 	add.xyz vf28xyz,vf28xyz,vf29xyz 	nop
  1dfab0:	3c 03 00 80 bc 09 ef 01 	mulax.xyzw accxyzw,vf01xyzw,vf15x 	nop
  1dfab8:	3c 03 00 80 bd 10 ef 01 	madday.xyzw accxyzw,vf02xyzw,vf15y 	nop
  1dfac0:	3c 03 00 80 8a 1f ef 01 	maddz.xyzw vf30xyzw,vf03xyzw,vf15z 	nop
  1dfac8:	3c 03 00 80 3d e0 1c 01 	adday.x accx,vf28x,vf28y 	nop
  1dfad0:	3c 03 00 80 0a 9f 1c 01 	maddz.x vf28x,vf19x,vf28z 	nop
  1dfad8:	3c 03 00 80 fd f9 ff 01 	abs.xyzw vf31xyzw,vf31xyzw 	nop
  1dfae0:	3c 03 00 80 fd f1 fe 01 	abs.xyzw vf30xyzw,vf30xyzw 	nop
  1dfae8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfaf0:	00 10 01 34 ec 9f 5f 00 	sub.z vf31z,vf19z,vf31z 	fmand vi01,vi02
  1dfaf8:	17 00 01 52 bc 49 f0 01 	mulax.xyzw accxyzw,vf09xyzw,vf16x 	ibne vi01,vi00,0x1dfbb8
  1dfb00:	3c 03 00 80 bd 50 f0 01 	madday.xyzw accxyzw,vf10xyzw,vf16y 	nop
  1dfb08:	3c 03 00 80 4a 5f f0 01 	maddz.xyzw vf29xyzw,vf11xyzw,vf16z 	nop
  1dfb10:	3c 03 00 80 a8 f7 df 01 	add.xyz vf30xyz,vf30xyz,vf31xyz 	nop
  1dfb18:	3c 03 00 80 bc 09 f0 01 	mulax.xyzw accxyzw,vf01xyzw,vf16x 	nop
  1dfb20:	3c 03 00 80 bd 10 f0 01 	madday.xyzw accxyzw,vf02xyzw,vf16y 	nop
  1dfb28:	3c 03 00 80 0a 1f f0 01 	maddz.xyzw vf28xyzw,vf03xyzw,vf16z 	nop
  1dfb30:	3c 03 00 80 3d f0 1e 01 	adday.x accx,vf30x,vf30y 	nop
  1dfb38:	3c 03 00 80 8a 9f 1e 01 	maddz.x vf30x,vf19x,vf30z 	nop
  1dfb40:	3c 03 00 80 fd e9 fd 01 	abs.xyzw vf29xyzw,vf29xyzw 	nop
  1dfb48:	3c 03 00 80 fd e1 fc 01 	abs.xyzw vf28xyzw,vf28xyzw 	nop
  1dfb50:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfb58:	00 10 01 34 6c 9f 5d 00 	sub.z vf29z,vf19z,vf29z 	fmand vi01,vi02
  1dfb60:	0a 00 01 52 28 e7 dd 01 	add.xyz vf28xyz,vf28xyz,vf29xyz 	ibne vi01,vi00,0x1dfbb8
  1dfb68:	3c 03 00 80 3d e0 1c 01 	adday.x accx,vf28x,vf28y 	nop
  1dfb70:	3c 03 00 80 0a 9f 1c 01 	maddz.x vf28x,vf19x,vf28z 	nop
  1dfb78:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfb80:	00 00 00 00 00 01 62 4a 	*unknown* 	lq. vf00,0(vi00)
  1dfb88:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfb90:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfb98:	00 10 01 34 ff 02 00 00 	nop 	fmand vi01,vi02
  1dfba0:	03 00 01 52 ff 02 00 00 	nop 	ibne vi01,vi00,0x1dfbc0
  1dfba8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfbb0:	01 00 01 10 ff 02 00 40 	nop[e] 	iaddiu vi01,vi00,1
  1dfbb8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfbc0:	00 00 01 10 ff 02 00 40 	nop[e] 	iaddiu vi01,vi00,0
  1dfbc8:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfbd0:	3c 03 00 80 ec ee dc 01 	sub.xyz vf27xyz,vf29xyz,vf28xyz 	nop
  1dfbd8:	3c 03 00 80 28 ed dc 01 	add.xyz vf20xyz,vf29xyz,vf28xyz 	nop
  1dfbe0:	3c 03 00 80 68 ed 9c 01 	add.xy vf21xy,vf29xy,vf28xy 	nop
  1dfbe8:	3c 03 00 80 a8 ed 5c 01 	add.xz vf22xz,vf29xz,vf28xz 	nop
  1dfbf0:	3c db 55 80 e8 ed 1c 01 	add.x vf23x,vf29x,vf28x 	move.z vf21z,vf27z
  1dfbf8:	3c db 96 80 28 ee dc 00 	add.yz vf24yz,vf29yz,vf28yz 	move.y vf22y,vf27y
  1dfc00:	3c db d7 80 68 ee 9c 00 	add.y vf25y,vf29y,vf28y 	move.yz vf23yz,vf27yz
  1dfc08:	3c db 18 81 a8 ee 5c 00 	add.z vf26z,vf29z,vf28z 	move.x vf24x,vf27x
  1dfc10:	3c db 59 81 bc 29 f4 01 	mulax.xyzw accxyzw,vf05xyzw,vf20x 	move.xz vf25xz,vf27xz
  1dfc18:	3c db 9a 81 bd 30 f4 01 	madday.xyzw accxyzw,vf06xyzw,vf20y 	move.xy vf26xy,vf27xy
  1dfc20:	3c 03 00 80 be 38 f4 01 	maddaz.xyzw accxyzw,vf07xyzw,vf20z 	nop
  1dfc28:	3c 03 00 80 0b 45 e0 01 	maddw.xyzw vf20xyzw,vf08xyzw,vf00w 	nop
  1dfc30:	3c 03 00 80 bc 29 f5 01 	mulax.xyzw accxyzw,vf05xyzw,vf21x 	nop
  1dfc38:	3c 03 00 80 bd 30 f5 01 	madday.xyzw accxyzw,vf06xyzw,vf21y 	nop
  1dfc40:	3c 03 00 80 be 38 f5 01 	maddaz.xyzw accxyzw,vf07xyzw,vf21z 	nop
  1dfc48:	3c 03 00 80 4b 45 e0 01 	maddw.xyzw vf21xyzw,vf08xyzw,vf00w 	nop
  1dfc50:	3c 03 00 80 bc 29 f6 01 	mulax.xyzw accxyzw,vf05xyzw,vf22x 	nop
  1dfc58:	3c 03 00 80 bd 30 f6 01 	madday.xyzw accxyzw,vf06xyzw,vf22y 	nop
  1dfc60:	3c 03 00 80 be 38 f6 01 	maddaz.xyzw accxyzw,vf07xyzw,vf22z 	nop
  1dfc68:	3c 03 00 80 af a4 d5 01 	mini.xyz vf18xyz,vf20xyz,vf21xyz 	nop
  1dfc70:	3c 03 00 80 eb a4 d5 01 	max.xyz vf19xyz,vf20xyz,vf21xyz 	nop
  1dfc78:	3c 03 00 80 8b 45 e0 01 	maddw.xyzw vf22xyzw,vf08xyzw,vf00w 	nop
  1dfc80:	3c 03 00 80 bc 29 f7 01 	mulax.xyzw accxyzw,vf05xyzw,vf23x 	nop
  1dfc88:	3c 03 00 80 bd 30 f7 01 	madday.xyzw accxyzw,vf06xyzw,vf23y 	nop
  1dfc90:	3c 03 00 80 be 38 f7 01 	maddaz.xyzw accxyzw,vf07xyzw,vf23z 	nop
  1dfc98:	3c 03 00 80 af 94 d6 01 	mini.xyz vf18xyz,vf18xyz,vf22xyz 	nop
  1dfca0:	3c 03 00 80 eb 9c d6 01 	max.xyz vf19xyz,vf19xyz,vf22xyz 	nop
  1dfca8:	3c 03 00 80 cb 45 e0 01 	maddw.xyzw vf23xyzw,vf08xyzw,vf00w 	nop
  1dfcb0:	3c 03 00 80 bc 29 f8 01 	mulax.xyzw accxyzw,vf05xyzw,vf24x 	nop
  1dfcb8:	3c 03 00 80 bd 30 f8 01 	madday.xyzw accxyzw,vf06xyzw,vf24y 	nop
  1dfcc0:	3c 03 00 80 be 38 f8 01 	maddaz.xyzw accxyzw,vf07xyzw,vf24z 	nop
  1dfcc8:	3c 03 00 80 af 94 d7 01 	mini.xyz vf18xyz,vf18xyz,vf23xyz 	nop
  1dfcd0:	3c 03 00 80 eb 9c d7 01 	max.xyz vf19xyz,vf19xyz,vf23xyz 	nop
  1dfcd8:	3c 03 00 80 0b 46 e0 01 	maddw.xyzw vf24xyzw,vf08xyzw,vf00w 	nop
  1dfce0:	3c 03 00 80 bc 29 f9 01 	mulax.xyzw accxyzw,vf05xyzw,vf25x 	nop
  1dfce8:	3c 03 00 80 bd 30 f9 01 	madday.xyzw accxyzw,vf06xyzw,vf25y 	nop
  1dfcf0:	3c 03 00 80 be 38 f9 01 	maddaz.xyzw accxyzw,vf07xyzw,vf25z 	nop
  1dfcf8:	3c 03 00 80 af 94 d8 01 	mini.xyz vf18xyz,vf18xyz,vf24xyz 	nop
  1dfd00:	3c 03 00 80 eb 9c d8 01 	max.xyz vf19xyz,vf19xyz,vf24xyz 	nop
  1dfd08:	3c 03 00 80 4b 46 e0 01 	maddw.xyzw vf25xyzw,vf08xyzw,vf00w 	nop
  1dfd10:	3c 03 00 80 bc 29 fa 01 	mulax.xyzw accxyzw,vf05xyzw,vf26x 	nop
  1dfd18:	3c 03 00 80 bd 30 fa 01 	madday.xyzw accxyzw,vf06xyzw,vf26y 	nop
  1dfd20:	3c 03 00 80 be 38 fa 01 	maddaz.xyzw accxyzw,vf07xyzw,vf26z 	nop
  1dfd28:	3c 03 00 80 af 94 d9 01 	mini.xyz vf18xyz,vf18xyz,vf25xyz 	nop
  1dfd30:	3c 03 00 80 eb 9c d9 01 	max.xyz vf19xyz,vf19xyz,vf25xyz 	nop
  1dfd38:	3c 03 00 80 8b 46 e0 01 	maddw.xyzw vf26xyzw,vf08xyzw,vf00w 	nop
  1dfd40:	3c 03 00 80 bc 29 fb 01 	mulax.xyzw accxyzw,vf05xyzw,vf27x 	nop
  1dfd48:	3c 03 00 80 bd 30 fb 01 	madday.xyzw accxyzw,vf06xyzw,vf27y 	nop
  1dfd50:	3c 03 00 80 be 38 fb 01 	maddaz.xyzw accxyzw,vf07xyzw,vf27z 	nop
  1dfd58:	3c 03 00 80 af 94 da 01 	mini.xyz vf18xyz,vf18xyz,vf26xyz 	nop
  1dfd60:	3c 03 00 80 eb 9c da 01 	max.xyz vf19xyz,vf19xyz,vf26xyz 	nop
  1dfd68:	3c 03 00 80 cb 46 e0 01 	maddw.xyzw vf27xyzw,vf08xyzw,vf00w 	nop
  1dfd70:	3c 03 00 80 af 94 db 01 	mini.xyz vf18xyz,vf18xyz,vf27xyz 	nop
  1dfd78:	3c 03 00 80 eb 9c db 41 	max[e].xyz vf19xyz,vf19xyz,vf27xyz 	nop
  1dfd80:	3c 03 00 80 ff 02 00 00 	nop 	nop
  1dfd88:	3c 03 00 80 ec aa c4 01 	sub.xyz vf11xyz,vf21xyz,vf04xyz 	nop
  1dfd90:	3c 03 00 80 6c bb c4 01 	sub.xyz vf13xyz,vf23xyz,vf04xyz 	nop
  1dfd98:	3c 03 00 80 ac a2 c4 01 	sub.xyz vf10xyz,vf20xyz,vf04xyz 	nop
  1dfda0:	3c 03 00 80 2c b3 c4 01 	sub.xyz vf12xyz,vf22xyz,vf04xyz 	nop
  1dfda8:	3c 03 00 80 ea 5a ce 01 	mul.xyz vf11xyz,vf11xyz,vf14xyz 	nop
  1dfdb0:	3c 03 00 80 6a 6b ce 01 	mul.xyz vf13xyz,vf13xyz,vf14xyz 	nop
  1dfdb8:	3c 03 00 80 aa 52 ce 01 	mul.xyz vf10xyz,vf10xyz,vf14xyz 	nop
  1dfdc0:	3c 03 00 80 2a 63 ce 01 	mul.xyz vf12xyz,vf12xyz,vf14xyz 	nop
  1dfdc8:	3c 03 00 80 00 5c 4b 00 	addx.z vf16z,vf11z,vf11x 	nop
  1dfdd0:	3c 03 00 80 02 6c 0d 01 	addz.x vf16x,vf13x,vf13z 	nop
  1dfdd8:	3c 03 00 80 c2 53 0a 01 	addz.x vf15x,vf10x,vf10z 	nop
  1dfde0:	3c 03 00 80 c0 63 4c 00 	addx.z vf15z,vf12z,vf12x 	nop
  1dfde8:	3d 83 8f 80 ec ca c4 01 	sub.xyz vf11xyz,vf25xyz,vf04xyz 	mr32.y vf15y,vf16y
  1dfdf0:	3d 83 2f 80 6c db c4 01 	sub.xyz vf13xyz,vf27xyz,vf04xyz 	mr32.w vf15w,vf16w
  1dfdf8:	3c 03 00 80 ac c2 c4 01 	sub.xyz vf10xyz,vf24xyz,vf04xyz 	nop
  1dfe00:	3c 03 00 80 2c d3 c4 01 	sub.xyz vf12xyz,vf26xyz,vf04xyz 	nop
  1dfe08:	3c 03 00 80 ea 5a ce 01 	mul.xyz vf11xyz,vf11xyz,vf14xyz 	nop
  1dfe10:	3c 03 00 80 6a 6b ce 01 	mul.xyz vf13xyz,vf13xyz,vf14xyz 	nop
  1dfe18:	3c 03 00 80 aa 52 ce 01 	mul.xyz vf10xyz,vf10xyz,vf14xyz 	nop
  1dfe20:	3c 03 00 80 2a 63 ce 01 	mul.xyz vf12xyz,vf12xyz,vf14xyz 	nop
  1dfe28:	3c 03 00 80 80 5c 4b 00 	addx.z vf18z,vf11z,vf11x 	nop
  1dfe30:	3c 03 00 80 82 6c 0d 01 	addz.x vf18x,vf13x,vf13z 	nop
  1dfe38:	3c 03 00 80 42 54 0a 01 	addz.x vf17x,vf10x,vf10z 	nop
  1dfe40:	3c 03 00 80 40 64 4c 00 	addx.z vf17z,vf12z,vf12x 	nop
  1dfe48:	3d 93 91 80 ff 02 00 40 	nop[e] 	mr32.y vf17y,vf18y
  1dfe50:	3d 93 31 80 ff 02 00 00 	nop 	mr32.w vf17w,vf18w
  1dfe58:	3c 03 00 80 58 29 d2 01 	mulx.xyz vf05xyz,vf05xyz,vf18x 	nop
  1dfe60:	3c 03 00 80 99 31 d2 01 	muly.xyz vf06xyz,vf06xyz,vf18y 	nop
  1dfe68:	3c 03 00 80 da 39 d2 01 	mulz.xyz vf07xyz,vf07xyz,vf18z 	nop
  1dfe70:	3c 2b 21 81 ff 02 00 00 	nop 	move.xw vf01xw,vf05xw
  1dfe78:	3c 33 a2 80 40 00 86 00 	addx.y vf01y,vf00y,vf06x 	move.yw vf02yw,vf06yw
  1dfe80:	3c 3b 63 80 40 00 47 00 	addx.z vf01z,vf00z,vf07x 	move.zw vf03zw,vf07zw
  1dfe88:	3d 2b 02 81 c2 00 05 01 	addz.x vf03x,vf00x,vf05z 	mr32.x vf02x,vf05x
  1dfe90:	3d 33 83 80 81 00 47 00 	addy.z vf02z,vf00z,vf07y 	mr32.y vf03y,vf06y
Disassembly of section :
