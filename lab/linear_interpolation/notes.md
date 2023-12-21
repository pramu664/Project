Normalization 

- You have range of value.
- You pick a value from that range.
- Then you want to find a new value for that value in within 0 and 1.

normal = (value - min) / (max - min)


Linear interpolation

- You have range of values.
- You also got a normalized value.
- You want to get a value from the range of values that points to normalized value.

lerp = (max - min) . norm + min
