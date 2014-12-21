#!/usr/bin/env python
# -*- coding: utf-8 -*-

import getpass
import os
from mako.template import Template
from envsetup.configs import CONFIG_TEMPLATES


print ("Please enter information in order to generate the configurations for "
       "your personal seettings")

real_name = raw_input("Real name:")
gmail_username = raw_input("Gmail username:")
gmail_password = getpass.getpass("Gmail password:")
github_user = raw_input("Github username:")
home_dir = os.getenv("HOME")

if "@" in gmail_username:
    gmail_email = gmail_username
    gmail_username = gmail_username.split("@")[0]
else:
    gmail_email = "%s@gmail.com" % gmail_username

if not os.path.exists("configs"):
    os.mkdir("configs")

for template_path in CONFIG_TEMPLATES:
    full_path = os.path.abspath("templates/%s" % template_path)
    print "Generating configuration for %s" % template_path
    with open(full_path) as fp:
        template = Template(fp.read().decode("utf-8"))
        config_data = template.render(real_name=real_name,
                                      gmail_user=gmail_username,
                                      gmail_pass=gmail_password,
                                      gmail_email=gmail_email,
                                      github_user=github_user,
                                      home_dir=home_dir)

    full_config_path = os.path.abspath("configs/%s" % template_path)
    with open(full_config_path, 'w') as fp:
        fp.write(config_data.encode("utf-8"))

print "Finished generating configuration files"
