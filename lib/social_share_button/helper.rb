# coding: utf-8
module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", opts = {})
      rel = opts[:rel]
      # custom_class = nil
      html = []
      html << "<div class='social-share-button' data-title='#{title}' data-img='#{opts[:image]}' data-url='#{opts[:url]}'>"

      SocialShareButton.config.allow_sites.each do |name|
        link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")

        custom_class = SocialShareButton.config.custom_class[name] if SocialShareButton.config.custom_class != nil

        html << link_to("","#", :rel => "nofollow #{rel}",
                        "data-site" => name,
                        :class => "social-share-button-#{name} #{custom_class}",
                        :onclick => "return SocialShareButton.share(this);",
                        :title => h(link_title))
      end
      html << "</div>"
      raw html.join("\n")
    end
  end
end
