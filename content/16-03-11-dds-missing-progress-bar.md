+++
Categories = []
Description = ""
Tags = []
date = "2016-03-11T01:58:05Z"
title = "dd's missing progress bar"

+++

I often use `dd` to write OS images to USB drives. Recently, when I was having trouble writing a particularly large image to a particularly slow drive I realised that a progress bar would be a very useful addition. I found one in the fantastically useful `pv`:

```
pv "path/to/image" | sudo dd of="/dev/disk" bs=1M
```
