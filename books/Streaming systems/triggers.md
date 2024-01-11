## triggers
+ 和watermark一起close window

## Repeated update triggers
+ .triggering(Repeatedly(AfterCount(1)))
+ .triggering(Repeatedly(AlignedDelay(TWO_MINUTES)))
+ .triggering(Repeatedly(UnalignedDelay(TWO_MINUTES)))


## Completeness triggers(watermark)
+ .triggering(AfterWatermark())


## Early/On-Time/Late Triggers
+ .triggering(AfterWatermark()
			     .withEarlyFirings(AlignedDelay(ONE_MINUTE))
			     .withLateFirings(AfterCount(1))))
+ combination of update trigger and watermark trigger
+ lateness horizons
    + 需要定义可以接受最迟多久的数据，否则window需要一直更新
    + also established precisely how long the state for windows must be kept around
    + .withAllowedLateness(ONE_MINUTE)


## accumulation
+ discarding
    + .discardingFiredPanes()
    + 只计算当前值
+ accumulating
    + 当前值加上之前的值
+ accumulating and retracting
    + .accumulatingAndRetractingFiredPanes()