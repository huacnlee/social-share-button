module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", *args)
      opts = args[0]
      # SEE README.md

      opts[:allow_sites] ||= SocialShareButton.config.allow_sites

      inner_element = opts[:inner_element] || nil
      classes = opts[:classes] || "social-share-button"


      self_styled = opts[:self_styled] || false
      self_general_styled = opts[:self_general_styled] || false
      extra_data = {}
      rel = opts[:rel]
      html = []
      html << "<div class='social-share-button#{' self-styled' if self_styled}#{' self-general-styled' if self_general_styled }' data-title='#{h title}' data-img='#{opts[:image]}' data-url='#{opts[:url]}' data-desc='#{opts[:desc]}' data-via='#{opts[:via]}'>"

      opts[:allow_sites].each do |name|
        extra_data = opts.select { |k, _| k.to_s.start_with?('data') } if name.eql?('tumblr')
        special_data = opts.select { |k, _| k.to_s.start_with?('data-' + name) }
        
        special_data["data-wechat-footer"] = t "social_share_button.wechat_footer" if name == "wechat"

        link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")

        if !opts[:child_content]
          opts[:child_content] = "" # let CSS do all the work
        end

        content = ""
        if inner_element
          content << "<#{inner_element} class='#{classes}'>"
        end
        content << opts[:child_content].html_safe || ""
        if inner_element
          content << "</#{inner_element}>"
        end
        html << link_to( content.html_safe, "#", { :rel => ["nofollow", rel],
                                   "data-site" => name,
                                   :class => "ssb-icon ssb-#{name}",
                                   :onclick => "return SocialShareButton.share(this);",
                                   :title => h(link_title) }.merge(extra_data).merge(special_data))


      end

      html << "</div>"
      return (raw(html.join("")))
    end
  end
end
