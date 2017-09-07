FROM r-base:3.4.1
RUN R -e 'install.packages(c("Rserve"))'
RUN apt-get update && apt-get install -y mpich
RUN R -e 'install.packages(c("cluster","clv","igraph","fields","e1071","fpc","sprint","kohonen","kernlab","lars","MASS","mlbench","Hmisc","proxy","clusterGeneration","tnet"), repos="http://cran.rstudio.com/")'

# dependencies for densitycut
RUN R -e 'install.packages(c("ape","FNN","RcppAnnoy"), repos="http://cran.rstudio.com/")'
# download densitycut source package
WORKDIR /
RUN wget https://bitbucket.org/jerry00/densitycut_dev/get/v0.01.tar.gz
RUN R -e 'install.packages("/v0.01.tar.gz", repos = NULL, type="source")'

ENV CLUSTEVAL_RSERVE_PORT 6311
EXPOSE ${CLUSTEVAL_RSERVE_PORT}

# add Rserv.conf
ADD Rserv.conf /etc/Rserve.conf

ENTRYPOINT R -e "Rserve::run.Rserve(remote=TRUE, port=${CLUSTEVAL_RSERVE_PORT}, config.file='/etc/Rserve.conf')" 
