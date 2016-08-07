FROM cannin/rserve
RUN apt-get update && apt-get install -y mpich
RUN R -e 'install.packages(c("cluster","clv","igraph","fields","e1071","fpc","sprint","kohonen","kernlab","lars","MASS","mlbench","Hmisc","proxy","clusterGeneration","tnet","densitycut"), repos="http://cran.rstudio.com/")'
