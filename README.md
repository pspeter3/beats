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

### GET /beats/:id/comment/new?name=:name&body=:body

Adds a new comment with the name and body parameters. It will return {} if the
post suceeded, else it will return a json blob with the errors

### GET /beats/:id/tag/with?tags=:tags

Splits the tags and adds them to the tags array. An example would be 
`GET /beats/1/tag/with?tags=foo%20bar`. The response returns the current list of
tags.

### GET /beats/:id/vote/up

Upvotes the beat and then returns the current vote object

### GET /beats/:id/vote/down

Downvotes the beat and then returns the current vote object

### GET /tags

Returns a tag cloud

### GET /tags/:tag

Returns a list of all the beats tagged with the tag

### GET /search?q=:query

Returns a list of all the beats that have the query text in their summary

## TODO

- Add pagination
- Add sorting
- Add scraper
