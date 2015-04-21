#!/bin/bash
echo 'Installing jinja2...'
sudo pip install -U jinja2 

echo 'Installing pdfkit...'
sudo pip install -U pdfkit

echo 'Installing wkhtmltopdf...'
# See http://stackoverflow.com/a/22592801 
if [ $(dpkg-query -W -f='${Status}' 'wkhtml*' 2>/dev/null | grep -c "ok installed") -eq 1 ];
then
  echo 'wkhtmltopdf already exists. skipping installation'
else
  echo 'downloading wkhtmltopdf...'
  wget http://downloads.sourceforge.net/wkhtmltopdf/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
  'Installing...'
  sudo dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
  sudo apt-get install -f
  echo 'rm wkhtmltox...'
  rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
fi

