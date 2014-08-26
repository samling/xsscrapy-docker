# Use Docker Python application base image
FROM samling/pythonbase

# Add pyapp
ADD pyapp/ /app

# Set permissions
RUN chown -R root /app

# Fix for cryptography library installation via pip
ENV LD_LIBRARY_PATH $HOME/anaconda/lib

#RUN apt-get install -y libffi-dev python-dev
RUN apt-get install -y libffi-dev libxml2-dev libxslt1-dev python-dev

# Install requirements via pip
RUN pip install -r /app/requirements.txt

# Set workdir
WORKDIR /app

# Set entrypoint to script
ENTRYPOINT ["/usr/local/bin/scrapy", "crawl", "xsscrapy", "-a"]
