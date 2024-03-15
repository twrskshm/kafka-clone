# Kafka Clone Project

This project is a clone of Kafka, a distributed event streaming platform that provides high-throughput, fault-tolerant publish and subscribe pipelines.

## Project Structure

The project directory consists of the following files and folders:

- **`.gitignore`**: This file contains patterns of file names and directories that Git should ignore. Files that match these patterns are not added to version control. This typically includes build artifacts, temporary files, and sensitive information.

- **`build.gradle`**: The build configuration file for Gradle, the build automation tool used for this project. This file contains the project's dependencies, plugins, and other build-related configurations.

- **`gradle/`**: This directory contains the Gradle wrapper scripts and properties. The Gradle wrapper allows anyone to execute the build with the correct version of Gradle without requiring an installation of Gradle beforehand.

- **`gradlew`**: The Gradle Wrapper Unix script. This script can be used instead of the installed version of Gradle to ensure that the build is executed with the correct version of Gradle.

- **`gradlew.bat`**: The Gradle Wrapper Batch script for Windows. Similar to `gradlew`, but for use on Windows operating systems.

- **`settings.gradle`**: This file includes configurations that are global to the project. It typically contains project-wide Gradle settings, such as the project's name and the inclusion of subprojects.

### Getting Started

To get started with this project, clone the repository to your local machine and ensure you have Java installed, as it is required to run Gradle commands. Use the Gradle Wrapper scripts (`gradlew` or `gradlew.bat`) to build the project and manage dependencies.

```shell
# Clone the repository.
git clone https://github.com/twrskshm/kafka-clone.git

# Navigate to the project directory.
cd kafka-clone

# Build the project (Unix/Linux/Mac).
./gradlew build

# Build the project (Windows).
gradlew.bat build
