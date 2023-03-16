FROM node:18-alpine as builder

RUN apk add yarn g++ make cmake python3 git --no-cache

# Set the working directory
WORKDIR /wiki

# Clone the repo and checkout the 'vega' branch
RUN git clone -b vega --depth 1 https://github.com/requarks/wiki.git .
RUN cp dev/build/config.yml config.yml

# Install dependencies and build assets for the server and client
RUN yarn cache clean
RUN yarn install --frozen-lockfile --non-interactive --prod && \
    yarn add @tiptap/suggestion @tiptap/core@^2.0.0-beta.209 @tiptap/pm \
    graphql@^15.0.0 subscriptions-transport-ws@^0.9.0 caniuse-lite@^1.0.30000697 pug@^2.0.0
RUN yarn legacy:build
RUN cd ux && yarn && yarn build && cd ..


FROM node:18-alpine

RUN apk add bash curl git openssh gnupg sqlite --no-cache && \
    mkdir -p /wiki && \
    mkdir -p /logs && \
    mkdir -p /wiki/data/content && \
    chown -R node:node /wiki /logs

WORKDIR /wiki

# Copy the required files from the builder stage
COPY --chown=node:node --from=builder /wiki .

USER node

VOLUME ["/wiki/data/content"]

# Expose the default Wiki.js port
EXPOSE 3000
EXPOSE 3443

# Start the server
CMD ["node", "server"]