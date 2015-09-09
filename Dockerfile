FROM cannin/rserve

RUN R -e 'install.packages(c("cluster","clv","stats","igraph","fields","e1071","fpc","sprint","kohonen","kernlab","lars","MASS","mlbench","Rserve"), repos="http://cran.rstudio.com/")'
