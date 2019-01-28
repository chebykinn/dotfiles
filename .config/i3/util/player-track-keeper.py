#!/usr/bin/env python3

from gi.repository import GLib
import dbus
from dbus.mainloop.glib import DBusGMainLoop
import sys
import time
import json

from xdg.BaseDirectory import (xdg_data_home)

LAST_TRACK_FILE_PATH = "/".join([xdg_data_home, "last-played-track"])
LAST_TRACK_POS_FILE_PATH = "/".join([xdg_data_home, "last-played-track-pos"])

def track_change_handler(player_path=None, data=None, signature=None):
    # print("got signal from {}".format(player_path))
    if not "Metadata" in data: return
    track_meta = data["Metadata"]
    print(json.dumps(track_meta, ensure_ascii=False))
    meta_json = json.dumps(track_meta, ensure_ascii=False)
    arr = json.loads(meta_json)
    for k, v in arr.items():
        print('"{}":"{}"'.format(k, v))
    # for k, v in track_meta.items():
        # print('"{}"::{}'.format(k, v))
    track_id = track_meta["mpris:trackid"]
    # track_name = track_meta["xesam:title"]
    # track_album = track_meta["xesam:album"]
    # track_artist = track_meta["xesam:artist"][0]
    # print("Playing: {} - {} from {}".format(track_artist, track:_name, track_album))
    with open(LAST_TRACK_FILE_PATH, "w") as last_track_file:
        json.dump(track_meta, last_track_file, ensure_ascii=False)
    # with open(LAST_TRACK_FILE_PATH, "w") as last_track_file:
            # print("{}".format(track_id), file=last_track_file)

def seeked_handler(pos):
    data = { "track_position": pos }
    with open(LAST_TRACK_POS_FILE_PATH, "w") as last_track_file:
        json.dump(data, last_track_file, ensure_ascii=False)

def connect_to_player():
    dbus_loop = DBusGMainLoop()
    bus = dbus.SessionBus(mainloop=dbus_loop)

    vlc = bus.get_object(
        "org.mpris.MediaPlayer2.vlc",
        "/org/mpris/MediaPlayer2"
    )
    return vlc

def get_player_interface(player_bus):
    return dbus.Interface(player_bus, dbus_interface="org.mpris.MediaPlayer2.Player")

def get_track_list_interface(player_bus):
    return dbus.Interface(player_bus, dbus_interface="org.mpris.MediaPlayer2.TrackList")

def start_listen_track_change(player_bus):
    player_bus.connect_to_signal("PropertiesChanged", track_change_handler)
    player_iface = get_player_interface(player_bus)
    player_iface.connect_to_signal("Seeked", seeked_handler)

    loop = GLib.MainLoop()
    loop.run()

def get_track_list(player_bus):
    prop_iface = dbus.Interface(player_bus, "org.freedesktop.DBus.Properties")
    return prop_iface.Get("org.mpris.MediaPlayer2.TrackList", 'Tracks')

def restore_track(player_bus):
    player_iface = get_player_interface(player_bus)
    tracks_iface = get_track_list_interface(player_bus)
    last_track = {}
    last_track_pos = 0
    try:
        with open(LAST_TRACK_FILE_PATH, 'r') as last_track_file:
            last_track = json.load(last_track_file)
    except FileNotFoundError:
        pass
    try:
        with open(LAST_TRACK_POS_FILE_PATH, 'r') as last_track_pos_file:
            tmp_data = json.load(last_track_pos_file)
            if "track_position" in tmp_data:
                last_track_pos = int(tmp_data["track_position"])
    except FileNotFoundError:
        pass
    if not last_track: return
    # TODO: check all metadata
    time.sleep(0.5)
    player_iface.Next()
    for i in range(5):
        tracks_iface.GoTo(last_track["mpris:trackid"])
    time.sleep(0.5)
    player_iface.Seek(last_track_pos)
    player_iface.Play()

def main():
    player = connect_to_player()
    cmd = sys.argv[1] if len(sys.argv) > 1 else "listen"

    if cmd == "listen":
        start_listen_track_change(player)

    if cmd == "restore-track":
        restore_track(player)

if __name__ == "__main__":
    main()
