# STAC ML Cataloging POC (Work in Progress)

## Table of Contents

- [STAC ML Cataloging POC (Work in Progress)](#stac-ml-cataloging-poc-work-in-progress)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Configuration](#configuration)
  - [Contributing](#contributing)
  - [License](#license)
  - [Contact](#contact)

## Introduction

The **STAC ML Cataloging POC** is a proof-of-concept project designed to catalog spatiotemporal machine learning models for Earth Observation (EO) data cubes. It leverages the Machine Learning Model STAC Extension to provide a standardized and efficient way to manage and discover ML models applied to EO data. The codebase is written in R and uses the plumber package to create APIs.

## Features

- **ML Model STAC Extension Integration**: Utilizes the [Machine Learning Model STAC Extension](https://github.com/crim-ca/mlm-extension) for cataloging ML models.
- **Spatiotemporal Support**: Designed to handle EO data cubes with spatiotemporal metadata.
- **R and Plumber**: Implemented in R using the plumber package to create RESTful APIs.
- **OpenSTAC**: Uses [OpenSTAC](https://github.com/Open-Earth-Monitor/openstac) for setting up a STAC API server quickly.
- **Scalability**: Efficiently indexes and retrieves ML models.
- **Extensibility**: Easily extendable to support additional sources and formats.
- **User-Friendly**: Intuitive for managing and querying geospatial ML models.

## Requirements

- R 4.0 or higher
- Dependencies listed in `DESCRIPTION` file

## Installation

To install the STAC ML Cataloging POC, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/PondiB/openearth-ml-server.git
    cd openearth-ml-server
    ```

2. **Install dependencies**:
    ```R
    install.packages(c("plumber", "rstac", "jsonlite"))
    remotes::install_github("Open-Earth-Monitor/openstac")
    ```

## Usage

To use the STAC ML Cataloging POC, follow these steps:

1. **Start the STAC API server**:
    ```R
    library(plumber)
    pr <- plumber::plumb("api.R")
    pr$run(host = "0.0.0.0", port = 8000)
    ```

2. **Access the user interface**:
    Open your web browser and navigate to `http://localhost:8000`.

3. **Interact with the catalog**:
    - Upload and catalog ML models for EO data cubes.
    - Search and filter models using the STAC API.
    - Integrate models into ML workflows.

## Configuration

Configuration settings can be adjusted in the `config.yaml` file. Key settings include:

- **Database settings**: Configure the database connection for storing model metadata.
- **Logging settings**: Adjust logging levels and output formats.
- **API settings**: Customize parameters for the API server.

## Contributing

We welcome contributions to the STAC ML Cataloging POC! To contribute, follow these steps:

1. **Fork the repository** on GitHub.
2. **Clone your forked repository** to your local machine.
    ```bash
    git clone https://github.com/yourusername/openearth-ml-server.git
    ```
3. **Create a new branch** for your feature or bug fix.
    ```bash
    git checkout -b feature-or-bugfix-name
    ```
4. **Make your changes** and commit them with a descriptive message.
    ```bash
    git add .
    git commit -m "Description of your changes"
    ```
5. **Push your changes** to your forked repository.
    ```bash
    git push origin feature-or-bugfix-name
    ```
6. **Open a pull request** on the original repository and describe your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact

For questions or suggestions, feel free to open an issue on GitHub or reach out to the project maintainer:

- **Brian Pondi**
- **Email**: brian.pondi@uni-muenster.de
- **GitHub**: [PondiB](https://github.com/PondiB)

---

Thank you for using the STAC ML Cataloging POC! We hope it helps streamline your geospatial asset management and ML workflows.
