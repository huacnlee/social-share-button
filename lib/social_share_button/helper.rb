# coding: utf-8
module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", opts = {})
      extra_data = {}
      rel = opts[:rel]
      html = []
      if SocialShareButton.config.allow_sites.include? 'add_this'
        raise 'Add this profile id is required' if SocialShareButton.config.add_this_profile_id.blank?
        html << javascript_include_tag("http://s7.addthis.com/js/300/addthis_widget.js#pubid=#{SocialShareButton.config.add_this_profile_id}")
      end
      html << "<div class='social-share-button' data-title='#{h title}' data-img='#{opts[:image]}' data-url='#{opts[:url]}'>"
      
      SocialShareButton.config.allow_sites.each do |name|
        unless name == 'add_this'
          extra_data = opts.select { |k, _| k.to_s.start_with?('data') } if name.eql?('tumblr')

          link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")
          html << link_to("","#", {:rel => ["nofollow", rel],
                                    "data-site" => name,
                                    :class => "social-share-button-#{name}",
                                    :onclick => "return SocialShareButton.share(this);",
                                    :title => h(link_title)}.merge(extra_data))
        else
          html << link_to("<span></span>".html_safe,"#", {:rel => ["nofollow", rel],
                                                          'addthis:url'=>opts[:url],
                                                          'class'=>"addthis_button_compact social-share-button-#{name}",
                                                          'addthis:title'=>title}.merge(extra_data))
        end
      end
      html << "</div>"
      raw html.join("\n")
    end
  end
end
