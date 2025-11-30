"""
Test SoundTouch connection via proxy on localhost
"""
import time

from libsoundtouch import soundtouch_device
from libsoundtouch.utils import Source, Type

device = soundtouch_device('localhost')
device.power_on()

print(device.config.name)
print(device.status())

time.sleep(5)

device.power_off()
