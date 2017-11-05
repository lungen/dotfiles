#! /usr/bin/python3.5

from shutil import copy2
from os import path, system, chdir, getcwd


# dst-folder
dst = '/home/alkk/gitDotFiles/'

d = {}
d['vimrc'] = '/home/alkk/.vim/.vimrc'
d['bashrc'] = '/home/alkk/.bashrc'
d['Xmodmap'] = '/home/alkk/.Xmodmap'
d['xinit'] = '/home/alkk/.xinitrc'
#d['atom'] = '/home/alkka/.atom'
d['i3'] = '/home/alkk/.i3/config'

for k, v in d.items():
    if path.isfile(v):
        #copy2(src, dst)
        copy2(v, dst)
        print("[OK]", v, "->", dst)
    else:
        print(" [NOK]", v, ": filepath not found!")

print("\n")
chdir(dst)
print(getcwd())
system('git status')
system('git add --all')
system('git commit -m "update"')
system('git push')
