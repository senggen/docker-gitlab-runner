FROM docker

RUN apt-get update -y && \
    apt-get install -y curl && \
    curl -s https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | bash && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y gitlab-ci-multi-runner && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
    
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "gitlab-ci-multi-runner"]
CMD ["run", "--user=root", "--working-directory=/home/gitlab-runner"]
