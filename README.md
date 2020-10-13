# muffon-api

[![Build Status](https://travis-ci.org/staniel359/muffon-api.svg?branch=main)](https://travis-ci.org/staniel359/muffon-api)

## Last.fm

### artist.info

    /api/v1/lastfm/artists/:artist
    
### artist.tags
    
    /api/v1/lastfm/artists/:artist/tags
    
### artist.images

    /api/v1/lastfm/artists/:artist/images
    ?page
    
### artist.similar

    /api/v1/lastfm/artists/:artist/similar
    ?limit

### artist.albums
    
    /api/v1/lastfm/artists/:artist/albums
    ?limit,page

### album.info
    
    /api/v1/lastfm/artists/:artist/albums/:album
    
### album.tags

    /api/v1/lastfm/artists/:artist/albums/:album/tags
    
### artist.tracks
    
    /api/v1/lastfm/artists/:artist/tracks
    ?limit,page
    
### track.info
    
    /api/v1/lastfm/artists/:artist/tracks/:track
    
### track.tags
    
    /api/v1/lastfm/artists/:artist/tracks/:track/tags

### track.similar

    /api/v1/lastfm/artists/:artist/tracks/:track/similar
    ?limit
    
### search.artists

    /api/v1/lastfm/search/artists
    ?artist,limit,page
    
### search.albums

    /api/v1/lastfm/search/albums
    ?album,limit,page
    
### search.tracks

    /api/v1/lastfm/search/tracks
    ?album,limit,page
    
### tag.info

    /api/v1/lastfm/tags/:tag
    
### tag.artists

    /api/v1/lastfm/tags/:tag/artists
    ?page
    
### tag.albums

    /api/v1/lastfm/tags/:tag/albums
    ?page
    
### tag.tracks

    /api/v1/lastfm/tags/:tag/tracks
    ?page

### top.artists

    /api/v1/lastfm/top/artists
    ?limit,page

### top.tracks

    /api/v1/lastfm/top/tracks
    ?limit,page

### top.tags

    /api/v1/lastfm/top/tags
    ?limit

## VK

### track.info

    /api/v1/vk/track
    ?query,position

### search.tracks

    /api/v1/vk/search/tracks
    ?query

### search.albums

    /api/v1/vk/search/albums
    ?query

## Bandcamp

### album.info

    /api/v1/bandcamp/album
    ?link,[artist,album]

### search

    /api/v1/bandcamp/search
    ?query,page,limit

# TODO

### local.artists

    TODO

### local.tracks

    TODO

## Questionable

### album.similar

### tag.similar

### top.albums

### local.albums

## Google

### search

    /api/v1/google/search
    ?query

## Soundcloud

    TODO

## YouTube

    TODO
