## triggers
+ 和watermark一起close window

## Repeated update triggers
+ .triggering(Repeatedly(AfterCount(1)))
+ .triggering(Repeatedly(AlignedDelay(TWO_MINUTES)))
+ .triggering(Repeatedly(UnalignedDelay(TWO_MINUTES)))
## Completeness triggers