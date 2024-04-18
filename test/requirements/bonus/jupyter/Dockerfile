FROM debian:bookworm

RUN apt-get update -y && apt-get install -y python3 python3-pip

RUN pip3 install jupyter notebook

WORKDIR /home/jupyter

# Set the user environment (optional)
RUN echo "jupyter ALL=(ALL) NOPASSWD: /usr/local/sbin/jupyter" >> /etc/sudoers

CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0", "--port=8888"]


