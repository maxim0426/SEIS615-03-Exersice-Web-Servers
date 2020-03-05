#!/bin/bash

touch meta-data.txt

curl -w "\n" http://169.254.169.254/latest/meta-data/hostname > meta-data.txt

curl -w "\n" http://169.254.169.254/latest/meta-data/iam-info >> meta-data.txt

curl -w "\n" http://169.254.169.254/latest/meta-data/security-groups >> meta-data.txt
