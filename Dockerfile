FROM java:8-jdk

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y unzip xvfb libxi6 libgconf-2-4

# Install Chrome for Selenium
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb
RUN dpkg -i /chrome.deb || apt-get install -yf
RUN rm /chrome.deb

# Install chromedriver for Selenium
RUN curl https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip -o /home/chromedriver
RUN unzip -u /home/chromedriver -d /usr/bin
RUN rm /home/chromedriver
RUN chown root:root /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver
