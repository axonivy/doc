#!/bin/bash

#set -e

updateReleaseNotes() {

  updatedReleaseNotes="/tmp/newReleaseNotes"
  currentDate=`date +"%Y-%m-%d"`

  cat doc/target/resources/includes/_release-notes.md > $updatedReleaseNotes
  sed -i -e "s/(upcoming)/(${currentDate})/g" $updatedReleaseNotes

  cat doc/source/axonivy/release-notes/_release-notes-static.md >> $updatedReleaseNotes

  cp -v $updatedReleaseNotes doc/source/axonivy/release-notes/_release-notes-static.md
}

updateReleaseNotes
