local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -show drun -display-drun -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'env alacritty',
    rofi = rofi_command,
    lock = 'betterlockscreen -l',
    quake = 'alacritty',
    screenshot = '~/.config/awesome/configuration/utils/screenshot -m',
    region_screenshot = '~/.config/awesome/configuration/utils/screenshot -r',
    delayed_screenshot = '~/.config/awesome/configuration/utils/screenshot --delayed -r',

    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'env waterfox',
    editor = 'gvim', -- gui text editor
    social = 'env telegram-desktop',
    game = rofi_command,
    files = 'thunar',
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the autostart script
    -- '~/.config/awesome/configuration/autostart', -- Spawn "dirty" apps that can linger between sessions
    'compton',
    'nitrogen --restore',
    'xfce4-power-manager', -- Power manager
    'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
    'scream-start', -- scream audio sink
    'numlockx on', -- enable numlock
    'blueman-tray', -- bluetooth tray
  }
}
