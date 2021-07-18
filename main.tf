terraform {
  required_providers {
    spotify = {
      version = "~> 0.1.5"
      source  = "conradludgate/spotify"
    }
  }
}

variable "spotify_api_key" {
  type = string
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Summer Playlist"
  description = "This playlist was created by Terraform"
  public      = false

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
    data.spotify_search_track.by_artist.tracks[3].id,
    data.spotify_search_track.by_artist.tracks[4].id
  ]
}

data "spotify_search_track" "by_artist" {
  #artists = ["Trent Reznor and Atticus Ross"]
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
  artists = ["Ramin Djawadi"]
    album = "Westworld Season 3"
}

#data "spotify_search_track" "by_artist" {
#  artists = ["Trent Reznor and Atticus Ross"]
#}

output "tracks" {
  value = data.spotify_search_track.by_artist.tracks
}
