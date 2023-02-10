# This is a test Dockerfile.

FROM ubuntu:15.10

# Get g++ for compiling, wget to download Boost, git to clone source code repo,
# and make to automate program compilation with Makefile provided
RUN apt-get update \
  && apt-get install -y git \
                        g++ \
                        make \
                        wget

# Download boost, untar, setup install with bootstrap and only do the Program Options library,
# and then install
COPY boost_1_53_0.tar.gz /home
RUN cd /home \
  && tar xfz boost_1_53_0.tar.gz \
  && rm boost_1_53_0.tar.gz \
  && cd boost_1_53_0 \
  && ./bootstrap.sh --prefix=/usr/local --with-libraries=program_options \
  && ./b2 install \
  && cd /home \
  && rm -rf boost_1_53_0

CMD ["bash"]
