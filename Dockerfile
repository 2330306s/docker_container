FROM python:3.6.9-slim

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

# Install Ubuntu dependencies
# libopencv-dev = opencv dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        tesseract-ocr \
        libgl1-mesa-glx \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install pytesseract
RUN pip3 install opencv-python
RUN pip3 install numpy
RUN pip3 install matplotlib
RUN pip3 install pytube
RUN pip3 install youtube_transcript_api
RUN pip3 install tqdm
RUN pip3 install textblob
RUN pip3 install fuzzysearch
RUN pip3 install diff_match_patch
RUN pip3 install scipy
RUN pip3 install scikit-learn
RUN pip3 install google-cloud-vision
RUN pip3 install imutils
RUN pip3 install pandas
RUN pip3 install requests
RUN pip3 install pybase64
RUN pip3 install ipython
RUN ldconfig


# Upgrade PIP
RUN pip3 install pip pipenv --upgrade

# Project installs
RUN pipenv install --skip-lock --system --dev


CMD ["./scripts/entrypoint.sh"]