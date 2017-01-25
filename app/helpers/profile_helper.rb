module ProfileHelper

  def regions
    {
        "North East" => {logo: "map-north-east.png"},
        "Midwest" => {logo: "map-mid-west.png"},
        "South" => {logo: "map-south-west.png"},
        "South East" => {logo: "map-south-east.png"},
        "West" => {logo: "map-west.png"}
    }
  end

  def embed(video_url)
    unless video_url.nil?
      if video_url.include?("youtube")
        youtube_id = video_url.split("=").last
        content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
      elsif video_url.include?("youtu.be")
        youtube_id = video_url.split("/").last
        content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
      elsif video_url.include?("hudl")
        if video_url.include?("embed")
          "<iframe src='//#{video_url}' width='640' height='360' frameborder='0' allowfullscreen></iframe>".html_safe
        else
          if video_url.include?("http")
            video_url = video_url.sub(/^https?\:\/\//,'')
          end
          pieces = video_url.split("/").length
          num_pieces = pieces - 2
          url_parts = video_url.split("/")
          if num_pieces == 3
            new_url = "//www.hudl.com/embed/video/#{url_parts[2]}/#{url_parts[3]}/#{url_parts[4]}"
          elsif num_pieces == 2
            new_url = "//www.hudl.com/embed/video/#{url_parts[2]}/#{url_parts[3]}"
          else
            new_url = "//#{video_url}"
          end
          content_tag(:iframe, nil, src: "#{new_url}")
        end
      end
    end
  end

  def twitter_link(handle)
    "https://www.twitter.com/#{handle}"
  end

  def facebook_link(handle)
    "https://www.facebook.com/#{handle}"
  end

  def instagram_link(handle)
    "https://www.instagram.com/#{handle}"
  end
end