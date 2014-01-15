FROM alexismp/debian-openjdk
MAINTAINER Alexis MP "alexis.mp@gmail.com"

# download and install OpenCV dependencies
ADD http://commondatastorage.googleapis.com/alexismp-docker-opencv-demo%2Fopencv-2.4.7.tar.gz /opt/opencv-2.4.7.tar.gz
RUN tar -xvf /opt/opencv-2.4.7.tar.gz -C /opt/
RUN rm /opt/opencv-2.4.7.tar.gz

ADD http://commondatastorage.googleapis.com/alexismp-docker-opencv-demo%2FfaceDetect.tar.gz /home/faceDetect.tar.gz
RUN tar -xvf /home/faceDetect.tar.gz -C /home/
RUN rm /home/faceDetect.tar.gz

# Update list of packages and install Ant
RUN apt-get update
RUN apt-get install -y --force-yes ant

ENV LD_LIBRARY_PATH /opt/opencv-2.4.7/build/lib/ 

# run default detect face job
CMD ["cd", "/home/faceDetect"]
CMD ["ant", "build"]