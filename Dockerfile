FROM archlinux/base:latest

RUN pacman -Syu base-devel sudo git --noconfirm
RUN pacman -Scc
RUN useradd -m -r -s /sbin/nologin yay 
RUN passwd -d yay
RUN echo 'yay ALL=(ALL) ALL' > /etc/sudoers.d/yay

WORKDIR /src
RUN git clone https://aur.archlinux.org/yay.git
RUN chown -R yay:yay /src/yay
WORKDIR /src/yay
RUN sudo -u yay makepkg -srci --noconfirm

WORKDIR /
RUN rm -rf /src /home/yay/.cache
