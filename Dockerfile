# Base image:
FROM golang:1.11
LABEL Mantainer=Creatiweb

# Install golint
ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH
# set CC env var for CLANG
ENV CC clang-6.0
RUN go get -u github.com/golang/lint/golint

# Add apt key for LLVM repository
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

# Add LLVM apt repository
RUN echo "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" | tee -a /etc/apt/sources.list

# Install clang from LLVM repository
RUN apt-get update
RUN apt-get install -y --no-install-recommends clang-6.0
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install dep
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# Set Clang as default CC
ENV set_clang /etc/profile.d/set-clang-cc.sh
RUN echo "export CC=clang-6.0" | tee -a ${set_clang} && chmod a+x ${set_clang}