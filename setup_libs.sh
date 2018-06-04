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
    brew install Caskroom/cask/wkhtmltopdf
  elif [[ ${os_type} = "Linux" ]]; then
    sudo apt-get install wkhtmltopdf
  fi
fi

