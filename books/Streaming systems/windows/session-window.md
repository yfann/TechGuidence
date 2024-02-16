# session window
+ Sessions are a special type of window that captures a period of activity in the data that is terminated by a gap of inactivity
+ They are an example of a data-driven window: the location and sizes of the windows are a direct consequence of the input data themselves, rather than being based on some predefined pattern within time, as are fixed and sliding windows.
+ They are also an example of an unaligned window
+ it’s possible to tag the data within a single session with a common identifier ahead of time (e.g., a video player that emits heartbeat pings with quality-of-service information; for any given viewing, all of the pings can be tagged ahead of time with a single session ID). 

+ window merging

+ window materialized
    + the watermark has passed the end of the first window

    