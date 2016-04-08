# Use Docker Python application base image
FROM samling/docker-python-base

# Add pyapp
ADD pyapp/ /app

# Set permissions
RUN chown -R root /app

# Fix for cryptography library installation via pip
ENV LD_LIBRARY_PATH $HOME/anaconda/lib

#get apt packages 
RUN apt-get update

# Install missing dependencies prior to installing requirements.txt
RUN apt-get install -y libffi-dev libxml2-dev libxslt1-dev

# Install requirements via pip
RUN pip install -r /app/requirements.txt

# Set correct workdir so that scrapy finds the crawl command
WORKDIR /app

# Set entrypoint to reduce complexity of docker run command
ENTRYPOINT ["/usr/local/bin/scrapy", "crawl", "xsscrapy", "-a"]
