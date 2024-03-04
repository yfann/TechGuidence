# exactly once
+ 发生错误时->重试->会导致dupicates
    + solution:
        + every message sent is tagged with a unique identifier

+ checkpointing
    + Each output from a transform is checkpointed, together with its unique ID, to stable storage before being delivered to the next stage
    + Any retries in the shuffle delivery simply replay the output that has been checkpointed—the user’s nondeterministic code is not run again on retry. 

+ graph optimization
    + fusion
        + fusion reduces the entire graph down to a few physical steps, greatly reducing the amount of data transfer needed (and saving on state usage, as well).

+ bloom filters(布隆过滤器)
    + If the filter returns false, this record is not a duplicate and the worker can skip the more expensive lookup from stable storage. It needs to do that second lookup only if the Bloom filter returns true, but as long as the filter’s false-positive rate is low, that step is rarely needed.

+ garbage collection
    + increasing sequence number
        + earlier sequence number could be garbage collected
    + timestamp
        + Dataflow calculates a garbage-collection watermark based on these system timestamps 

+ deterministic source
    + example
        + file source
    +  the service can automatically generate unique IDs for each record

+ nondeterministic source
    + example
        + pub sub
    + Dataflow needs assistance for detecting duplicates because there is no way for the service to deterministically assign record IDs that will be stable upon retry.
        +  If a source provides unique IDs per record and notifies Dataflow that it requires deduplication,12 records with the same ID will be filtered out.