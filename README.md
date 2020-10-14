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
    ?query,limit,page
    
### search.albums

    /api/v1/lastfm/search/albums
    ?query,limit,page
    
### search.tracks

    /api/v1/lastfm/search/tracks
    ?query,limit,page
    
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

### album.links

    /api/v1/bandcamp/album/links
    ?[artist,album]

### search

    /api/v1/bandcamp/search
    ?query,page,limit

## Google

### search

    /api/v1/google/search
    ?query,limit,page

## Bing

### search

    /api/v1/bing/search
    ?query,limit,page

## YouTube

### search

    /api/v1/youtube/search
    ?query,limit,next_page

# TODO

## Last.fm

### local.artists

    TODO

### local.tracks

    TODO

## Questionable

### album.similar

### tag.similar

### top.albums

### local.albums

## Soundcloud

    TODO

## MusicBrainz

    TODO

## Discogs

    TODO

## Rate Your Music

    TODO
