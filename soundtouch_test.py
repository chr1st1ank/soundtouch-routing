from libsoundtouch import soundtouch_device
from libsoundtouch.utils import Source, Type

device = soundtouch_device('192.168.5.203')
# device.power_on()
device.power_off()

# Config object
print(device.config.name)

# Status object
# device.status() will do an HTTP request.
# Try to cache this value if needed.
status = device.status()
print(status)
