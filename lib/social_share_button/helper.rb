# coding: utf-8
module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", opts = {})
      extra_data = {}
      rel = opts[:rel]
      html = []
      html << "<div class='social-share-button' data-title='#{h title}' data-img='#{opts[:image]}'"
      html << "data-url='#{opts[:url]}' data-desc='#{opts[:desc]}' data-popup='#{opts[:popup]}' data-via='#{opts[:via]}'>"

      SocialShareButton.config.allow_sites.each do |name|
        extra_data = opts.select { |k, _| k.to_s.start_with?('data') } if name.eql?('tumblr')
        special_data = opts.select { |k, _| k.to_s.start_with?('data-' + name) }

        link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")
        html << link_to("","#", {:rel => ["nofollow", rel],
                                  "data-site" => name,
                                  :class => "social-share-button-#{name}",
                                  :onclick => "return SocialShareButton.share(this);",
                                  :title => h(link_title)}.merge(extra_data).merge(special_data))
      end
      html << "</div>"
      raw html.join("\n")
    end
  end
end
