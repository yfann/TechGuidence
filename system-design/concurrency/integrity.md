## integrity

+ ways of preserve integrity
    + distributed transaction
    + atomic commit protocol
    + reliable stream processing system

## reliable stream processing system
+ Representing the content of the write operation as a single message, which can easily be written atomically—an approach that fits very well with event sourcing (see “Event Sourcing”)
+ Deriving all other state updates from that single message using deterministic derivation functions, similarly to stored procedures (see “Actual Serial Execution” and “Application code as a derivation function”)
+ Passing a client-generated request ID through all these levels of processing, enabling end-to-end duplicate suppression and idempotence
+ Making messages immutable and allowing derived data to be reprocessed from time to time, which makes it easier to recover from bugs (see “Advantages of immutable events”)