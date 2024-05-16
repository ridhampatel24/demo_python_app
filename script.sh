#! /bin/bash
cd /home/ubuntu/demo_python_app || exit
pkill -f app.py
cd ~
sudo rm -rf demo_python_app
git clone https://github.com/ridhampatel24/demo_python_app.git
cd /home/ubuntu/demo_python_app
# pip3 install -r requirements.txt
pip3 install -r requirements.txt --break-system-packages
setsid python3 -u app.py &
sleep 5