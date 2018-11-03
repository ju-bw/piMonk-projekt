# piMonk-projekt

% pi

## github

~~~
  # win10
  C:\projekte\raspi\projekt

  # raspi
  /home/pi/raspi/projekt
~~~

~~~
  # Projekt Start
  echo "# " >> README.md
  git init
  git add README.md
  git commit -m "projekt start"
  git log --oneline
  git log --graph --oneline --decorate --pretty=format:"%ad; %h; %s" --no-merges --date=short > log.txt
  git log --oneline --decorate --pretty=format:"%ad;%h;%s" --no-merges --date=short > log.csv 
~~~

~~~
  # SSH
  git remote add origin git@github.com:ju-bw/piMonk-projekt.git
  git push -u origin master

~~~

~~~
  # HTTPS
  git remote add origin https://github.com/ju-bw/piMonk-projekt.git
  git push -u origin master
~~~


~~~
  # Projekt bearbeiten
  git status
  git add .
  git commit -am"kommentar"
  git pull
  git push
  git log --oneline
~~~

**Download** 

~~~
  git clone https://github.com/ju-bw/piMonk-projekt.git .
~~~
