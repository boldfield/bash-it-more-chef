default['bash-it']['install']['dir'] = '/etc/bash-it'
default['bash-it']['install']['src']['repository'] = 'https://github.com/boldfield/bash-it'
default['bash-it']['install']['src']['revision'] = 'master'

default['bash-it']['user'] = nil
# Themes worth trying out
#   - brunton
#   - nwinkler
#   - powerline-multiline
#   - rjorgenson
#   - tonka
#   - zork (no clock)
#
default['bash-it']['theme'] = 'nwinkler'
default['bash-it']['git'] = 'git@github.com'
default['bash-it']['irc'] = 'irssi'
default['bash-it']['todo'] = 't'
default['bash-it']['scm_check'] = true

default['bash-it']['plugins'] = [
  'alias-completion',
  'base',
  'dirs',
  'tmux',
  'git',
  'history',
  'latex',
  'osx',
  'todo',
  'rbenv',
]
