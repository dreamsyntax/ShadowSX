#To be inserted at 80206198
;PreventTimerRestartInStory-Pt1.asm

;Replacing Original Code 
;to add new functionality.
Start:
  ;Load value of "Story Mode Flag"
  ;into r16.
  lis r16, 0x8057
  li r17, 0x7777
  addi r17, r17, 0x6180
  or r18, r16, r17
  lhz r16, 0(r18)

  ;If "Story Mode Flag" is false,
  ;Go run that code....
  ;TODO: wtf does that code do.
  cmplwi r16, 0
  bne- End
  lis r18, 0x8033
  ori r18, r18, 0x6FAC
  mtlr r18
  blrl

End:
  li r16, 0x0
  li r17, 0x0
  li r18, 0x0
