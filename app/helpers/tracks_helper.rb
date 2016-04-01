module TracksHelper
   def ugly_lyrics(lyrics)
      lyrics_array = lyrics.split(" ")
      html = "<pre>"
      until lyrics_array.length < 6
         html += "&#9835; #{h(lyrics_array.shift(4).join(" "))}</br>"
      end
      html += "&#9835; #{h(lyrics_array.shift(lyrics_array.length).join(" "))}"
      html += "<pre>"
      html.html_safe
   end
end
