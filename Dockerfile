FROM fpco/stack-build:lts-11.15 as dependencies
RUN mkdir /opt/build
WORKDIR /opt/build

# Docker build should not use cached layer if any of these is modified
COPY stack.yaml package.yaml stack.yaml.lock /opt/build/
RUN stack build --system-ghc --dependencies-only -j4

# -------------------------------------------------------------------------------------------
FROM fpco/stack-build:lts-11.15 as build

# Copy compiled dependencies from previous stage
COPY --from=dependencies /root/.stack /root/.stack
COPY . /opt/build/

WORKDIR /opt/build
RUN stack install --system-ghc --copy-bins --local-bin-path ./bin

# -------------------------------------------------------------------------------------------
# Base image for stack build so compiled artifact from previous
# stage should run
FROM ubuntu:18.04 as app
RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY --from=build /opt/build/bin .
CMD ["/opt/app/ci-demo"]