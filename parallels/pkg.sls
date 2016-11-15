brew-installed:  # Also installs xcode command line tools
  cmd.run:
    - name: 'echo 
    - runas: {{ pillar['username'] }}
    - unless:
      - brew --help

system-updated:
  cmd.run:
    - name: softwareupdate -ia --verbose
    - require:
      - cmd: brew-installed

brew-updated:
  cmd.run:
    - name: brew update
    - runas: {{ pillar['username'] }}
    - require:
      - cmd: brew-installed