FROM cannin/rserve

RUN R -e 'install.packages(c("cluster","clv","igraph","fields","e1071","fpc","sprint","kohonen","kernlab","lars","MASS","mlbench"), repos="http://cran.rstudio.com/")'