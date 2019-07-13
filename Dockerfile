FROM vladus2000/arch-base
MAINTAINER vladus2000 <docker@matt.land>

#COPY shiz/ /

RUN \
	/debugthis.sh && \
	pacman -Syyu --noconfirm --needed base-devel git && \
	useradd -G wheel evil && \
	mkdir ~evil && \
	chown evil ~evil && \
	echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
	su - evil -c 'git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm --noprogressbar'

CMD /bin/bash -c /startup.sh
