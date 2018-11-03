# chmod a+x *.py
# python3 ./script.py
# % ju -- https://bw1.eu -- 3-11-18
# update:   
#==================================

# Testprogramm: bringt den Prozessor an seine Grenzen
import time

def factorial(n):
  if n == 0:
    return 1
  else:
    return n * factorial(n-1)

before_time = time.clock()

for i in range(1, 10000):
  factorial(200)

after_time = time.clock()

print(after_time - before_time)