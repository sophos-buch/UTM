#!/bin/bash

# Piepton ausschalten
sed -i -e 's/\(.*07"\)/# \1/' /etc/init.d/beeps
sed -i -e 's/\(.*07"\)/# \1/' /etc/init.d/halt
