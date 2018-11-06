#  pip3 install bottle
from bottle import route, template, run
from datetime import datetime

@route('/')
def index(name='time'):
  dt = datetime.now()
  #time = "{:%Y-%m-%d %H:%M:%S}".format(dt) # 2018-11-06 17:33:43
  #time = "{:%Y-%b-%d}".format(dt) # 2018-Nov-03
  #time = "{:%d-%m-%Y}".format(dt) # 03-11-2018
  #time = "{:%H:%M}".format(dt)    # 16:54
  time = "{:%d-%b-%y}".format(dt) # 03-Nov-18
  return template('<b>Pi date is: {{t}}</b>', t=time)

# ipconfig
#run(host='192.168.178.59', port=80)
run() # http://127.0.0.1:8080

