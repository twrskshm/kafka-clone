#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ $# -lt 1 ];
then
  echo "USAGE: $0 [-daemon] [-name servicename] [-loggc] classname [opts]"
  exit 1
fi

if [ -z "$INCLUDE_TEST_JARS" ];
then
  INCLUDE_TEST_JARS=false
fi

# Exclude jars not necessary for running commands.
should_include_file() {
  regex="(-(test|test-sources|src|scaladoc|javadoc)\.jar|jar.asc|connect-file.*\.jar)$"

  if [ "$INCLUDE_TEST_JARS" = true ];
  then
    return 0
  fi

  file=$1

  if [ -z "$(echo "$file" | grep -E "$regex")" ];
  then
    return 0
  else
    return 1
  fi
}

base_dir="$(dirname "$0")"/..

if [ -z "$SCALA_VERSION" ];
then
  SCALA_VERSION=2.13.12

  if [ -f "$base_dir/gradle.properties" ];
  then
    SCALA_VERSION=$(grep "^scalaVersion=" "$base_dir/gradle.properties" | cut -d= -f 2)
  fi
fi

if [ -z "$SCALA_BINARY_VERSION" ];
then
  SCALA_BINARY_VERSION=$(echo "$SCALA_VERSION" | cut -f 1-2 -d '.')
fi

for dir in "$base_dir"/core/build/dependant-libs-"${SCALA_VERSION}"/*.jar;
do
  CLASSPATH="$CLASSPATH":"$dir"
done

for file in "$base_dir"/core/build/libs/kafka_"${SCALA_BINARY_VERSION}"*.jar;
do
  if should_include_file "$file";
  then
    CLASSPATH="$CLASSPATH":"$file"
  fi
done

exec java -cp "$CLASSPATH" kafka.Kafka "$@"
