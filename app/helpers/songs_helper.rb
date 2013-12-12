module SongsHelper
  def show_song_label(song)
    html = <<-HTML
      <strong>
      #{song.title} - by #{song.artist.name if song.artist}
      #{song.artist.record_label if song.artist && song.artist.record_label == "Epic"}
      </strong>
    HTML
    html.html_safe
  end
end
