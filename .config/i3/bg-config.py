from gi.repository import Gio, GLib

def _state_changed(action, state):
    print(f'{action} {state}')

settings = Gio.Settings(schema_id="org.gnome.desktop.interface")
settings.connect('changed', _state_changed)
mainloop = GLib.MainLoop()
try:
    mainloop.run()
except KeyboardInterrupt:
    mainloop.quit()

