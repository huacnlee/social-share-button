module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", opts = {})
      opts[:allow_sites] ||= SocialShareButton.config.allow_sites

      extra_data = {}
      rel = opts[:rel]
      html = []
      html << "<div class='social-share-button' data-title='#{h title}' data-img='#{opts[:image]}'"
      html << "data-url='#{opts[:url]}' data-desc='#{opts[:desc]}' data-via='#{opts[:via]}'>"

      opts[:allow_sites].each do |name|
        extra_data = opts.select { |k, _| k.to_s.start_with?('data') } if name.eql?('tumblr')
        special_data = opts.select { |k, _| k.to_s.start_with?('data-' + name) }
        
        special_data["data-wechat-footer"] = t "social_share_button.wechat_footer" if name == "wechat"

        link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")
        link_attributes = {
          :rel => ["nofollow", rel],
          "data-site" => name,
          :class => "ssb-icon ssb-#{name}",
          :title => h(link_title)
        }.merge(extra_data).merge(special_data)
        if name == 'copy'
          link_attributes['data-clipboard-text'] = opts[:url] || request.original_url
        else
          link_attributes[:onclick] = "return SocialShareButton.share(this);"
        end
        html << link_to("", "javascript:void(0)", link_attributes)
        
        if name == 'copy'
          html << content_tag(:div, class: 'copy-success') do
            t('social_share_button.copy_success')
          end
        end
        
      end
      html << "</div>"
      raw html.join("\n")
    end
  end
end
