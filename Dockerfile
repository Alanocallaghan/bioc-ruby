FROM bioconductor/bioconductor_docker:latest

LABEL name="bioc-ruby" \
      version="0.0.1" \
      url="https://github.com/Alanocallaghan/bocker" \
      maintainer="alan.ocallaghan@outlook.com" \
      description="Docker image containing Bioc and ruby" \
      license="GPL-3"

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    apt-utils \
    libssh2-1-dev \
    texlive \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-science \
    texi2html \
    texinfo \
    python3 \
    ruby ruby-dev ruby-bundler build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("BiocManager")'

RUN Rscript -e 'BiocManager::install()'

RUN gem install bundler
