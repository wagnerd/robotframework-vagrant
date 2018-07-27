echo "########################"
echo "# PIP Install robotframework-selenium2library"
echo "########################"
pip install --upgrade robotframework-selenium2library

echo "########################"
echo "# Download and install geckodrier for selenium library"
echo "########################"
cd /home/vagrant/Downloads/ 

wget https://github.com/mozilla/geckodriver/releases/download/v0.21.0/geckodriver-v0.21.0-linux64.tar.gz

tar -xvzf geckodriver-v0.21.0-linux64.tar.gz

sudo cp geckodriver /usr/bin/