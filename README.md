# Beats

# Introduction

This app is meant to be a JSON API server for the Washington University Police
Beats. The API supports liking, disliking and commenting on individual police
beats scraped from the <http://police.wustl.edu> site. The API is designed to
use only GET requests and provides JSONP support so it can easily be integrated
with <http://www.studlife.com>.

## API Description

### Beats

#### Index - GET /beats

Returns a list of beats. In order to paginate, add a GET parameter page

- id
- crime
- summary
- timestamp
- location

#### Show - GET /beats/:id

- id
- crime
- summary
- timestamp
- location
- disposition
- value
- tags
