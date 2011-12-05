# Beats

# Introduction

This app is meant to be a JSON API server for the Washington University Police
Beats. The API supports liking, disliking and commenting on individual police
beats scraped from the <http://police.wustl.edu> site. The API is designed to
use only GET requests and provides JSONP support so it can easily be integrated
with <http://www.studlife.com>.

## API Description

### GET /beats

Returns a list of police beats

### GET /beats/:id

Returns an individual beat

### GET /beats/:id/vote/up

Upvotes the beat and then returns the current vote object

### GET /beats/:id/vote/down

Downvotes the beat and then returns the current vote object

### GET /search?q=:query

Returns a list of all the beats that have the query text in their summary

## TODO

- Add pagination
- Add sorting
- Add scraper
