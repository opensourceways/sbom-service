FROM openeuler/openeuler:22.03-lts AS build

RUN yum update -y && yum install -y \
    git \
    java-17-openjdk \
    && rm -rf /var/cache/yum

WORKDIR /opt
RUN git clone --recurse-submodules https://github.com/huanceng/sbom-service.git
WORKDIR /opt/sbom-service
RUN /bin/bash gradlew bootWar

ENTRYPOINT ["/bin/bash", "/opt/sbom-service/docker-entrypoint.sh"]
