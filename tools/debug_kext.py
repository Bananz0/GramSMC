import ctypes
import ctypes.util
import sys
import argparse
import time

# Load frameworks
iokit = ctypes.cdll.LoadLibrary(ctypes.util.find_library('IOKit'))
cf = ctypes.cdll.LoadLibrary(ctypes.util.find_library('CoreFoundation'))

# Constants
kIOMasterPortDefault = 0
kIORegistryIterateRecursively = 0x00000001
kIOServicePlane = b"IOService"

kCFAllocatorDefault = None # 0
kCFStringEncodingUTF8 = 0x08000100
kCFNumberSInt32Type = 3

# Types
io_registry_entry_t = ctypes.c_uint
io_iterator_t = ctypes.c_uint
io_service_t = ctypes.c_uint
io_connect_t = ctypes.c_uint
kern_return_t = ctypes.c_int
io_object_t = ctypes.c_uint
io_notification_port_ref_t = ctypes.c_void_p

# IOKit functions setup
IOServiceGetMatchingServices = iokit.IOServiceGetMatchingServices
IOServiceGetMatchingServices.argtypes = [ctypes.c_uint, ctypes.c_void_p, ctypes.POINTER(io_iterator_t)]
IOServiceGetMatchingServices.restype = kern_return_t

IOServiceMatching = iokit.IOServiceMatching
IOServiceMatching.argtypes = [ctypes.c_char_p]
IOServiceMatching.restype = ctypes.c_void_p

IOIteratorNext = iokit.IOIteratorNext
IOIteratorNext.argtypes = [io_iterator_t]
IOIteratorNext.restype = io_service_t

IORegistryEntrySetCFProperties = iokit.IORegistryEntrySetCFProperties
IORegistryEntrySetCFProperties.argtypes = [io_registry_entry_t, ctypes.c_void_p]
IORegistryEntrySetCFProperties.restype = kern_return_t

IOObjectRelease = iokit.IOObjectRelease
IOObjectRelease.argtypes = [ctypes.c_uint]
IOObjectRelease.restype = kern_return_t

# Notification functions
IONotificationPortCreate = iokit.IONotificationPortCreate
IONotificationPortCreate.argtypes = [ctypes.c_uint]
IONotificationPortCreate.restype = io_notification_port_ref_t

IONotificationPortGetRunLoopSource = iokit.IONotificationPortGetRunLoopSource
IONotificationPortGetRunLoopSource.argtypes = [io_notification_port_ref_t]
IONotificationPortGetRunLoopSource.restype = ctypes.c_void_p

IOServiceAddInterestNotification = iokit.IOServiceAddInterestNotification
# Args: port, service, type, callback, refCon, notification_out
IOServiceAddInterestNotification.argtypes = [io_notification_port_ref_t, io_service_t, ctypes.c_char_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(io_object_t)]
IOServiceAddInterestNotification.restype = kern_return_t

# CF functions setup
CFStringCreateWithCString = cf.CFStringCreateWithCString
CFStringCreateWithCString.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_uint32]
CFStringCreateWithCString.restype = ctypes.c_void_p

CFNumberCreate = cf.CFNumberCreate
CFNumberCreate.argtypes = [ctypes.c_void_p, ctypes.c_int, ctypes.c_void_p]
CFNumberCreate.restype = ctypes.c_void_p

CFDictionaryCreate = cf.CFDictionaryCreate
CFDictionaryCreate.argtypes = [ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p), ctypes.POINTER(ctypes.c_void_p), ctypes.c_long, ctypes.c_void_p, ctypes.c_void_p]
CFDictionaryCreate.restype = ctypes.c_void_p

CFRunLoopGetCurrent = cf.CFRunLoopGetCurrent
CFRunLoopGetCurrent.restype = ctypes.c_void_p

CFRunLoopAddSource = cf.CFRunLoopAddSource
CFRunLoopAddSource.argtypes = [ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p]

CFRunLoopRun = cf.CFRunLoopRun

kCFRunLoopDefaultMode = ctypes.c_void_p.in_dll(cf, 'kCFRunLoopDefaultMode')
kIOGeneralInterest = b"IOGeneralInterest"

# Callback type
IOServiceInterestCallback = ctypes.CFUNCTYPE(None, ctypes.c_void_p, io_service_t, ctypes.c_uint, ctypes.c_void_p)

def create_cfstring(s):
    return CFStringCreateWithCString(kCFAllocatorDefault, s.encode('utf-8'), kCFStringEncodingUTF8)

def create_cfnumber(val):
    v = ctypes.c_int(val)
    return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, ctypes.byref(v))

def set_property(key, value):
    matching = IOServiceMatching(b"GramSMC")
    if not matching: print("Error: Failed to create matching dictionary"); return

    iterator = io_iterator_t()
    ret = IOServiceGetMatchingServices(kIOMasterPortDefault, matching, ctypes.byref(iterator))
    if ret != 0: print(f"Error: IOServiceGetMatchingServices failed: 0x{ret:x}"); return

    service = IOIteratorNext(iterator)
    if not service: print("Error: GramSMC service not found!"); IOObjectRelease(iterator); return

    print(f"Found GramSMC service: {service}")

    cf_key = create_cfstring(key)
    cf_value = create_cfnumber(value)
    
    keys_arr = (ctypes.c_void_p * 1)(cf_key)
    values_arr = (ctypes.c_void_p * 1)(cf_value)
    cf_dict = CFDictionaryCreate(kCFAllocatorDefault, keys_arr, values_arr, 1, None, None)

    print(f"Setting {key} = {value}...")
    ret = IORegistryEntrySetCFProperties(service, cf_dict)
    
    if ret == 0: print("Success: Property set.")
    else: print(f"Error: Failed (0x{ret:x}). Try running with sudo.")

    IOObjectRelease(service)
    IOObjectRelease(iterator)

@IOServiceInterestCallback
def notification_callback(refCon, service, messageType, messageArgument):
    # messageArgument is void*, cast to int
    arg_val = 0
    if messageArgument:
        arg_val = ctypes.cast(messageArgument, ctypes.c_void_p).value
        # If it's effectively an int32, handle signedness or just raw hex
        if arg_val is None: arg_val = 0
    
    # GramSMC Event Mappings
    # GramSMC Event Mappings
    EVENT_NAMES = {
        0x10: "Brightness Down",
        0x11: "Brightness Up",
        0x5E: "Sleep",
        0x30: "Volume Up / Settings (F1) / Legacy Backlight?",
        0x31: "Volume Down",
        0x32: "Mute",
        0x37: "Display Mode (F4)",
        0x6B: "Touchpad Toggle (Fn+F5?)",
        0x7D: "Airplane Mode (Fn+F6)",
        0xC0: "Keyboard Backlight: Off",
        0xC1: "Keyboard Backlight: Low",
        0xC2: "Keyboard Backlight: High",
        0xC4: "Keyboard Backlight Up",
        0xC5: "Keyboard Backlight Down",
        0xE4: "Fn Key Event / Touchpad Toggle (Legacy)",
        0xF9: "Reader Mode Toggle (F9)",
        0x40: "Media: Previous Track",
        0x41: "Media: Next Track",
        0x45: "Media: Play/Pause",
        0x5C: "Media: Play/Pause",
        0x8A: "Media: Previous Track",
        0x82: "Media: Next Track",
        0x61: "Video Mirror",
        0x70: "Settings (F1)",
        0x74: "Keyboard Backlight Toggle (F5?)",
        0x72: "Webcam / Fn Key (0x72)",
        0x69: "Fn Key (0x69)",
        0x6A: "Fn Key (0x6A)",
        0x7B: "Fn Key (0x7B)",
        0x7C: "Fn Key (0x7C)",
        0x52: "Volume Down (Legacy 0x52)",
        0x53: "Volume Up (Legacy 0x53)"
    }

    eventName = EVENT_NAMES.get(messageType, "Unknown Event")
    
    # Check for brightness ranges if unknown
    if eventName == "Unknown Event":
        if 0x20 <= messageType <= 0x2F:
             eventName = f"Brightness Down Level {messageType - 0x20}"
        elif 0x12 <= messageType <= 0x1F: 
             eventName = "Brightness Event (Range)"
    
    print(f"Received Notification! Code: 0x{messageType:X} | Map: {eventName}")

def listen_events():
    matching = IOServiceMatching(b"GramSMC")
    if not matching: print("Error: Failed to create matching dictionary"); return

    iterator = io_iterator_t()
    ret = IOServiceGetMatchingServices(kIOMasterPortDefault, matching, ctypes.byref(iterator))
    if ret != 0: print(f"Error: IOServiceGetMatchingServices failed: 0x{ret:x}"); return
    
    service = IOIteratorNext(iterator)
    if not service: print("Error: GramSMC service not found!"); return

    print(f"Listening for events on service: {service}")

    notify_port = IONotificationPortCreate(kIOMasterPortDefault)
    run_loop_source = IONotificationPortGetRunLoopSource(notify_port)
    CFRunLoopAddSource(CFRunLoopGetCurrent(), run_loop_source, kCFRunLoopDefaultMode)
    
    notification_object = io_object_t()
    
    # We register for "General Interest" which catches most "message()" calls from Kext
    ret = IOServiceAddInterestNotification(
        notify_port,
        service,
        kIOGeneralInterest,
        notification_callback,
        None,
        ctypes.byref(notification_object)
    )
    
    if ret != 0:
        print(f"Error registering for notifications: 0x{ret:x}")
        return
        
    print("Press Ctrl+C to stop...")
    CFRunLoopRun()

    IOObjectRelease(service)
    IOObjectRelease(iterator)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="GramSMC Debug Tool")
    parser.add_argument("key", nargs="?", help="Property Key (e.g. FanMode)")
    parser.add_argument("value", nargs="?", type=int, help="Property Value (e.g. 1)")
    parser.add_argument("--listen", action="store_true", help="Listen for Kext events")

    args = parser.parse_args()

    if args.listen:
        listen_events()
    elif args.key and args.value is not None:
        set_property(args.key, args.value)
    else:
        parser.print_help()
