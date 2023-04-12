FROM node:lts AS builder

COPY . /apphttps://github.com/Lewis-Liu/magic-copy/blob/main/Dockerfile


WORKDIR /app

RUN npm ci
RUN npm run build

RUN ./buildcrx.sh -d dist

FROM scratch

COPY --from=builder /app/output/dist.crx /dist.crx
