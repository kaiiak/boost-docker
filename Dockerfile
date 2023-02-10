# This is a test Dockerfile.

FROM ubuntu:16.04

# Get g++ for compiling, wget to download Boost, git to clone source code repo,
# and make to automate program compilation with Makefile provided
RUN apt-get update \
  && apt-get install -y git \
                        g++ \
                        make \
                        wget

# Download boost, untar, setup install with bootstrap and only do the Program Options library,
# and then install
RUN cd /home && wget http://downloads.sourceforge.net/project/boost/boost/1.53.0/boost_1_53_0.tar.gz \
  && tar xfz boost_1_53_0.tar.gz \
  && rm boost_1_53_0.tar.gz \
  && cd boost_1_53_0 \
  && ./bootstrap.sh --prefix=/usr/local --with-libraries=program_options,regex,date-time,date_time-mt,filesystem-mt,filesystem,program_options-mt,regex-mt,system-mt,system,thread-mt,thread \
  && ./b2 install \
  && cd /home \
  && rm -rf boost_1_53_0

CMD ["bash"]
