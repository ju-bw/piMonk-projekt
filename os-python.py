import os
import subprocess

ordnerInhalt = os.system("ls")
print(ordnerInhalt)

ip = subprocess.check_output(['hostname', '-I'])
print(ip)