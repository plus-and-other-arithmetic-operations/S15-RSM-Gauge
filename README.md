# S15-RSM-Gauge

Commission for skyline's personal S15 mod.

https://github.com/plus-and-other-arithmetic-operations/S15-RSM-Gauge/assets/88043761/5bd11af8-3ebd-40d1-bd7c-14e1a8af50ef

Some features:
- Boot-up animation
- RPM Gauge
- Speed meter
- Battery voltage meter

## Setup

Install the required fonts

Add the script entry into the car's ext_config

```ini
[SCRIPTABLE_DISPLAY_...]
ACTIVE= 1
MESHES = GEO_INT_RSM_SCREEN
RESOLUTION = 1024,512
DISPLAY_POS = 0,15
DISPLAY_SIZE = 1024,512
SKIP_FRAMES = 10
SCRIPT = RSM.lua
```
