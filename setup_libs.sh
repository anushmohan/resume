#!/bin/bash
echo 'Installing jinja2...'
sudo pip install -U jinja2

echo 'Installing pdfkit...'
sudo pip install -U pdfkit

os_type=$(uname -s)
echo 'Installing wkhtmltopdf...'
if [[ -x $(command -v  wkhtmltopdf) ]]; then
  echo 'wkhtmltopdf already exists. skipping installation'
else
  if [[ ${os_type} == "Darwin" ]]; then
    echo 'Downloading wkhtmltopdf...'
    wget http://downloads.sourceforge.net/wkhtmltopdf/wkhtmltox-0.12.2.1_osx-cocoa-x86-64.pkg
    echo 'Installing...'
    sudo installer -pkg ./wkhtmltox-0.12.2.1_osx-cocoa-x86-64.pkg -target /
    echo 'rm wkhtmltox...'
    rm wkhtmltox-0.12.2.1_osx-cocoa-x86-64.pkg
  elif [[ ${os_type} = "Linux" ]]; then
    echo 'downloading wkhtmltopdf...'
    wget http://downloads.sourceforge.net/wkhtmltopdf/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
    'Installing...'
    sudo dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
    sudo apt-get install -f
    echo 'rm wkhtmltox...'
    rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
  fi
fi

