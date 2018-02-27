module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", *args)
      # SEE README.md
      opts = args[0]

      # setup defaults
      opts[:allow_sites] ||= SocialShareButton.config.allow_sites
      opts[:font_awesome] ||= false

      inner_element = opts[:inner_element] || nil
      classes = opts[:classes] || "social-share-button"
      self_styled = opts[:self_styled] || false
      extra_data = {}
      rel = opts[:rel]
      if opts[:font_awesome]
        self_styled = true
      end

      # build html
      html = []
      html << "<div class='social-share-button#{' self-styled' if self_styled}' data-title='#{h title}' data-img='#{opts[:image]}' data-url='#{opts[:url]}' data-desc='#{opts[:desc]}' data-via='#{opts[:via]}'>"

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

        if opts[:font_awesome]
          fa_class = "fa-#{name}"
          fa_class = "fa-envelope" if name == "email"
          fa_class = "fa-google-plus" if  name == "goolge_plus"
          content << "<i class='fa fa-circle fa-stack-2x'></i><i data-target='fa-target-icon' class='fa fa-stack-1x #{fa_class}' /></i>"
        end

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
