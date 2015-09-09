FROM cannin/rserve
RUN apt-get install -y mpich
RUN R -e 'install.packages(c("cluster","clv","igraph","fields","e1071","fpc","sprint","kohonen","kernlab","lars","MASS","mlbench","Hmisc","proxy"), repos="http://cran.rstudio.com/")'
