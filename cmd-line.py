import sys

try:
  for (i, value) in enumerate(sys.argv):
    print("arg: %d %s " % (i, value))
except:
  print("$ python3 cmd-line.py a b c")

