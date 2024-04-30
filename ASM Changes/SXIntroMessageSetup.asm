#To be inserted at 80359C94
;SXIntroMessageSetup.asm

;Initialize Intro Message

Start:
  ;Original Code
  stw r0, 0x0014 (sp)
  
  ;Load Intro Message ID (8057D8FC)
  lis r18, 0x8057
  ori r18, r18, 0xD8FC
  lwz r19, 0(r18)
  cmplwi r19, 0x0
  bne- End
  
  ;Initialize to SX intro
  li r19, 44
  sth r19, 0(r18)

  ;Initialize Options References
  lis r16, 0x8057
  addi r18, r16, 0x6972
  lhz r16, 0(r18)
  cmpwi r16, 0 ;0 == JPN Lang
  
  ;8057FB80 is current level keys. Borrowing for lookup table data.
  lis r16, 0x8057
  ori r18, r16, 0xFB80
  beql Set2Offsets
  
  ;Not JPN Offsets
  ;38, 78, B8, F8, 138
  li r17, 10

  li r16, 0x0038
  add r16, r16, r17
  sth r16, 0(r18)

  li r16, 0x0078
  add r16, r16, r17
  sth r16, 2(r18)

  li r16, 0x00b8
  add r16, r16, r17
  sth r16, 4(r18)

  li r16, 0x00f8
  add r16, r16, r17
  sth r16, 6(r18)

  li r16, 0x0138
  add r16, r16, r17
  sth r16, 8(r18)

  ;0062, 00A2, 00E2, 0122, 162
  li r16, 0x0062
  add r16, r16, r17
  sth r16, 10(r18)

  li r16, 0x00A2
  add r16, r16, r17
  sth r16, 12(r18)

  li r16, 0x00E2
  add r16, r16, r17
  sth r16, 14(r18)

  li r16, 0x0122
  add r16, r16, r17
  sth r16, 16(r18)

  li r16, 0x0162
  add r16, r16, r17
  sth r16, 18(r18)

  b InitOptionDefaults

Set2Offsets:
  ;0038, 006A, 00A2, 0000
  li r16, 0x0038
  sth r16, 4(r18)
  li r16, 0x006A
  sth r16, 6(r18)
  li r16, 0x00A2
  sth r16, 8(r18)
  li r16, 0x0000
  sth r16, 10(r18)

InitOptionDefaults:  
  ;Check if Rom Settings are valid
  ;If not, assign default settings.

  ;Set r18 to start of flag data.
  lis r18, 0x8057
  ori r18, r18, 0x7B2C

InitMenuOptions:
  ;8057FB80 is current level keys. Borrowing for lookup table data.
  lis r16, 0x8057
  ori r18, r16, 0xFBA0

  ;Set the values for Page 2 to be "No Change" by default
  ;07, 07, 07, 02
  li r16, 0x0707
  sth r16, 0(r18)
  li r16, 0x0702
  sth r16, 2(r18)

End:
  li r16, 0x0
  li r18, 0x0
  li r19, 0x0
  
