<div align="center">

# JiraSql

![500l](https://github.com/user-attachments/assets/cc6cdbfe-0d3d-4be8-a77a-09a20b32fbf3)

[![Build Status](https://api.travis-ci.com/ivanperez-keera/Yampa.svg?branch=master)](https://app.travis-ci.com/github/ivanperez-keera/Yampa)
[![Version on Hackage](https://img.shields.io/hackage/v/Yampa.svg)](https://hackage.haskell.org/package/Yampa)

Installation of sql scripts from Jira to Oracle and PostgreSQL databases

[Installation](#installation) •

</div>

## Features

- Installation of sql scripts from Jira to Oracle and PostgreSQL databases.

- Errors search in the logs.

- Upload Jira tickets with sql scripts logs.

- Comment Jira tickets with result.

- Automatic Jira tickets closure.

## Table of Contents

- [Installation](#installation)
  - [Pre-requisites](#pre-requisites)
  - [Native-messaging](#native-messaging)
- [Documentation](#documentation)

# Installation
<sup>[(Back to top)](#table-of-contents)</sup>

## Pre-requisites
<sup>[(Back to top)](#table-of-contents)</sup>

To use JiraSQL, you must have installed the JiraSQL add-on.

## Native-messaging
<sup>[(Back to top)](#table-of-contents)</sup>

Once you have have installed the JiraSQL add-on, download the file [JiraSQL_installer.exe](https://github.com/JiraSQL/JiraSQL/blob/main/JiraSQL_installer.exe)

This will creates :
* 2 keys in the registry for the native messaging communication between the add-on and the executable file (one for Chrome and for Firefox)
* a directory `JiraSQL` in your `Program Files` directory containing :
  * the executable file
  * a manifest file for the Chrome add-on
  * a manifest file for the Firefox add-on
