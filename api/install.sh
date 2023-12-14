#!/bin/bash

apt-get update -y;
apt-get install git build-essential -y;
mix deps.get
mix ecto.create
mix ecto.migrate