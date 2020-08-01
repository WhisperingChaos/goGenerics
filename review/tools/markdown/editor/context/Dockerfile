#
# ARG feature allowing tag substitution, in FROM statement, first introduced in Docker 17.05.0.
# Therefore, this Dockerfile will not work with Docker versions prior to it.
#
# Installation of X11 dependencies and vscode copied
# from https://github.com/jessfraz/dockerfiles/tree/master/vscode
#
ARG VER_DEBIAN
FROM debian:${VER_DEBIAN}


# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	--no-install-recommends  \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean


# Install x11 and GTK support for GUI application
RUN apt-get update && apt-get -y install \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
	libcups2 \
	libexpat1 \
	libfontconfig1 \
	libfreetype6 \
	libgtk2.0-0 \
	libpango-1.0-0 \
	libx11-xcb1 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	libcanberra-gtk3-module \
	--no-install-recommends  \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean


# Install git
ARG PKG_NAME_VER_GIT=git
RUN apt-get update && apt-get -y install \
	$PKG_NAME_VER_GIT \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean


# Install vscode
ARG PKG_NAME_VER_VSCODE
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | apt-key add - \
 && echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list \
 && apt-get update && apt-get -y install \
	$PKG_NAME_VER_VSCODE \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean

# Create:
# - A user account to maintain vscode account level settings.  Use a particular
#   project's Workspace settings to define new or overwrite existing account
# - A static mount point "$HOME/src" within the container as an interface
#   to enable access to python source external to this container.
ARG ACCOUNT_VSCODE=user
ENV HOME /home/$ACCOUNT_VSCODE
RUN useradd --create-home --home-dir $HOME $ACCOUNT_VSCODE \
 && mkdir $HOME/src \
 && chown -R $ACCOUNT_VSCODE:$ACCOUNT_VSCODE $HOME

# Install common vscode account settings.
USER root
COPY vscode/usersettings.json $HOME/.config/Code/User/settings.json
RUN chown -R $ACCOUNT_VSCODE:$ACCOUNT_VSCODE $HOME/.config

WORKDIR $HOME

COPY start.sh /usr/local/bin/start.sh
CMD ["start.sh"]




