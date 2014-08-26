Original xsscrapy code from [DanMcInerney/xsscrapy](https://github.com/DanMcInerney/xsscrapy).

This Docker container uses my [Docker python base image](https://github.com/samling/docker-python-base).

Usage
=====

Clone the repo:

    git clone https://github.com/samling/xsscrapy-docker.git

Move into cloned repository:

    cd xsscrapy-docker

Build the image:

    docker build -t xsscrapy .

Run the image:

    docker run -t xsscrapy url=http://example.com
