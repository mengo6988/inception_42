FROM debian:bookworm

RUN apt update -y && apt upgrade -y
# RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
RUN apt install -y python3 
RUN apt install -y python3-pip 
RUN apt install -y python3.11-venv

# Set the user environment 
# RUN python3 -m venv my_env
#
# RUN source /home/jupyter/my_env/bin/activate
# RUN pip3 install jupyter notebook
# RUN pip3 install flask

# WORKDIR /home/jupyter

# RUN echo "jupyter ALL=(ALL) NOPASSWD: /usr/local/sbin/jupyter" >> /etc/sudoers

# CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0", "--port=8888"]

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]


