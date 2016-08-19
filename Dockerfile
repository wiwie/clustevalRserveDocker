FROM cannin/rserve
RUN apt-get update && apt-get install -y mpich
RUN R -e 'install.packages(c("cluster","clv","igraph","fields","e1071","fpc","sprint","kohonen","kernlab","lars","MASS","mlbench","Hmisc","proxy","clusterGeneration","tnet"), repos="http://cran.rstudio.com/")'
# dependencies for densitycut
RUN R -e 'install.packages(c("ape","FNN","RcppAnnoy"), repos="http://cran.rstudio.com/")'
# download densitycut source package
ADD https://bitbucket.org/jerry00/densitycut_dev/get/v0.01.tar.gz /
RUN R -e 'install.packages("/v0.01.tar.gz", repos = NULL, type="source")'
