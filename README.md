## Official Repository of the CASE Ontology Website

This repository serves the website for https://caseontology.org.

To report an issue with or make suggestions for the website, please visit the [CASE Community Help Center](https://case.atlassian.net/servicedesk).

If you are interested in contributing to the website and require a local environment for testing modifications, see [CONTRIBUTE.md](https://github.com/casework/casework.github.io/blob/master/CONTRIBUTE.md).

### Local Development

This repository is configured with a Docker Compose file to allow for local development. To run the website locally, you will need to install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).

Once Docker and Docker Compose are installed, you can run the following command to start the website locally:

```bash
docker-compose up -d --build
```

The website will be available at http://localhost:4000 and should automatically reload when changes are made to the source files as it is running in watch mode.

To stop the website, run the following command:

```bash
docker-compose down
```

To troubleshoot the website, you can view the logs with the following command:

```bash
docker logs jekyll
```
