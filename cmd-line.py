import sys

for (i, value) in enumerate(sys.argv):
  print("arg: %d %s " % (i, value))

# $ python3 cmd-line.py a b c