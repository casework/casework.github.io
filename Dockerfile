FROM --platform=linux/amd64 ruby:3.1-bullseye

# Define the working directory
WORKDIR /usr/app/src

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN gem install jekyll bundler &&\
    bundle install

# Expose port 4000 and the 35729 for livereload
EXPOSE 4000
EXPOSE 35729

# Start the application
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--host", "0.0.0.0"]
