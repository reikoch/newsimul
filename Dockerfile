FROM rocker/r-ver:4.0.2

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libgit2-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libxtst6 \
    libcurl4-openssl-dev \
    unixodbc-dev \
    libv8-dev \
    libxt6 && \
  rm -rf /var/lib/apt/lists/* && \
    install2.r --error Matrix

# COPY MI.RBM_0.0.1.9000.tar.gz /tmp

RUN install2.r --error --skipinstalled \
    dplyr \
    covr \
    tidyr \
    nlme \
    testthat \
    emmeans \
    mvtnorm \
    RcppParallel \
    Rcpp \
    rstan \
    rstantools \
    RcppEigen \
    StanHeaders \
    BH \
    glmmTMB && \
#    install2.r --error --skipinstalled /tmp/MI.RBM_0.0.1.9000.tar.gz && \
  rm -rf /tmp/downloaded_packages && \
  apt-get clean

WORKDIR /
USER 1000

CMD ["R"]


