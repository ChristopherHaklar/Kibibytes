#!/usr/bin/python

#Written by Kyle Drainudel

#Replaces the machines public IP in httpd.conf

#Place in /usr/ubuntu/ and run via cron at boot

import os
import sys
import subprocess
from requests import get

filename = "/etc/apache2/httpd.conf"

def get_public_ip_address():
   try:
      result = subprocess.check_output("curl http://checkip.amazonaws.com",shell=True).decode(sys.stdout.encoding).strip()
      print("\n\nThe Public IP is: " + str(result) + "\n\n")
      return str(result)

   except:
      print("Could not retreive current public IP address!")
      return "Could not retreive current public IP address!"

def get_old_ip():
   try:
      oldIP = subprocess.check_output("grep -E -o -m2 \"([0-9]{1,3}[\.]){3}[0-9]{1,3}\" /etc/apache2/httpd.conf | tail -n1",shell=True).decode(sys.stdout.encoding).strip()
      print("\n\nThe old IP was: " + str(oldIP) + "\n\n")
      return str(oldIP)

   except:
      print("Could not retreive old IP address!")
      return "Could not retreive old IP address!"


pubIP = get_public_ip_address()
oldIP = get_old_ip()

with open(filename) as file:
    newText=file.read().replace(oldIP, pubIP)

with open(filename, "w") as file:
    file.write(newText)

print("\n\nIn theory, the IP address should be replaced in the file.\n")

sys.exit(0)
