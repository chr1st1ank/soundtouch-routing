"""
Test SoundTouch Websocket connection via proxy on localhost
"""
import time

from libsoundtouch import soundtouch_device

def volume_listener(volume):
    print(volume.actual)

def status_listener(status):
    print(status.track)

def preset_listener(presets):
    for preset in presets:
        print(preset.name)

def zone_status_listener(zone_status):
    if zone_status:
        print(zone_status.master_id)
    else:
        print('no Zone')

device = soundtouch_device('localhost')
device.add_volume_listener(volume_listener)
device.add_status_listener(status_listener)
device.add_presets_listener(preset_listener)
device.add_zone_status_listener(zone_status_listener)

device.start_notification()

time.sleep(20)
