FROM alexismp/debian-openjdk
MAINTAINER Alexis MP "alexis.mp@gmail.com"

# download and install OpenCV dependencies
ADD http://commondatastorage.googleapis.com/alexismp-docker-opencv-demo%2Fopencv-2.4.7.tar.gz /opt/opencv-2.4.7.tar.gz
RUN tar -xf /opt/opencv-2.4.7.tar.gz -C /opt/
RUN rm /opt/opencv-2.4.7.tar.gz

ADD http://commondatastorage.googleapis.com/alexismp-docker-opencv-demo%2FfaceDetect.tar.gz /home/faceDetect.tar.gz
RUN tar -xf /home/faceDetect.tar.gz -C /home/
RUN rm /home/faceDetect.tar.gz

# Add testing source, update and install more recent libc6 version required by OpenCV
RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -t testing install -y --force-yes libc6-dev

# Update list of packages and install Ant
RUN apt-get install -y --force-yes ant

ENV LD_LIBRARY_PATH /opt/opencv-2.4.7/build/lib/ 

# run default detect face job
CMD ["cd", "/home/faceDetect"]
CMD ["ant", "build"]