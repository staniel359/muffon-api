# muffon-api

[![Build Status](https://travis-ci.org/staniel359/muffon-api.svg?branch=main)](https://travis-ci.org/staniel359/muffon-api)

### artist.info

    /api/v1/artists/:artist
    
### artist.tags
    
    /api/v1/artists/:artist/tags
    
### artist.images

    /api/v1/artists/:artist/images
    ?page
    
### artist.similar

    /api/v1/artists/:artist/similar
    ?limit

### artist.albums
    
    /api/v1/artists/:artist/albums
    ?limit,page

### album.info
    
    /api/v1/artists/:artist/albums/:album
    
### album.tags

    /api/v1/artists/:artist/albums/:album/tags
    
### artist.tracks
    
    /api/v1/artists/:artist/tracks
    ?limit,page
    
### track.info
    
    /api/v1/artists/:artist/tracks/:track
    
### track.tags
    
    /api/v1/artists/:artist/tracks/:track/tags

### track.similar

    /api/v1/artists/:artist/tracks/:track/similar
    ?limit
    
### search.artists

    /api/v1/search/artists
    ?artist,limit,page
    
### search.albums

    /api/v1/search/albums
    ?album,limit,page
    
### search.tracks

    /api/v1/search/tracks
    ?album,limit,page
    
### tag.info

    /api/v1/tags/:tag
    
### tag.artists

    /api/v1/tags/:tag/artists
    ?page
    
### tag.albums

    /api/v1/tags/:tag/albums
    ?page
    
### tag.tracks

    /api/v1/tags/:tag/tracks
    ?page

## TODO

### album.similar


### tag.similar


### top.artists

### top.albums

### top.tracks

### top.tags


### local.artists

### local.albums

### local.tracks
