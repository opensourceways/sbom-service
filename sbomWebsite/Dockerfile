FROM bitnami/git
RUN git clone https://github.com/huanceng/sbom-website.git

FROM node:lts-alpine
WORKDIR /sbom-website
COPY --from=0 /sbom-website /sbom-website

RUN npm config set registry https://registry.npmmirror.com/ \
    && npm install -g @vue/cli \
    && npm install -g http-server \
    && npm install \
    && npm run build-production

EXPOSE 8080

ENTRYPOINT [ "http-server", "dist" ]