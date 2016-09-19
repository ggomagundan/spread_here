require File.dirname(__FILE__) + '/../../config/environment.rb'

namespace :websta do
  task :api  => :environment do


    if ParseConfig.where(content_type: 1).first.updated_at >= Time.now - 1.days
      cookie = ParseConfig.where(content_type: 1).first.cookie
      open_doc = open("https://websta.me/api/tags/%ED%94%8C%EB%A6%AC%EB%A7%88%EC%BC%93/", "Cookie" => cookie.to_s).read
      doc = Nokogiri::HTML(open_doc)
      body = JSON.parse(doc.css("body").text)
      data = body["data"]
      data.each do |d|
        id = d["id"]
        if Parsing.where(content_id: id).blank?
          tags  = d["tags"]
          image = d["images"]["standard_resolution"]
          image = d["images"]["low_resolution"] if image.blank?
          image_url = image["url"]
          link = d["link"]
          if d["caption"].present?
            text = d["caption"]["text"]
            user= d["caption"]["from"]
            username= user["username"] if user.present?
          end

          Parsing.new( content_type: 1, content_id: id, tags: tags.join(", "), image_url: image_url, content: text, link: link, user_name: username).save

        end
      end
    end

  end
end

