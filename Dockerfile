FROM rocker/verse
RUN R -e "install.packages(\"matlab\")"
RUN apt update -y && apt install -y sqlite3 
 
RUN R -e "install.packages('gbm');"
RUN R -e "install.packages('caret');"
RUN R -e "install.packages('e1071');"
RUN R -e "install.packages('leaps');"
RUN R -e "install.packages('MLmetrics');"
RUN R -e "install.packages('glmnet');"
RUN R -e "install.packages('reticulate');"
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y python3-pip

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]

RUN pip3 install jupyter jupyterlab
RUN pip3 install numpy pandas scikit-learn plotnine matplotlib pandasql bokeh pymatch \
scipy statsmodels seaborn beautifulsoup4 openpyxl
RUN apt install -y python3-venv


