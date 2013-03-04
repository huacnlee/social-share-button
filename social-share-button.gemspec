# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "social_share_button/version"

Gem::Specification.new do |s|
  s.name        = "social-share-button"
  s.version     = SocialShareButton::VERSION
  s.authors     = ["Jason Lee"]
  s.email       = ["huacnlee@gmail.com"]
  s.homepage    = "http://github.com/huacnlee/social-share-button"
  s.summary     = %q{Helper for add social share feature in your Rails app. Twitter, Facebook, Weibo, Douban, QQ, Tumblr ...}
  s.description = %q{Helper for add social share feature in your Rails app. Twitter, Facebook, Weibo, Douban, QQ, Tumblr ...}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.files        = `git ls-files`.split("\n")
  s.add_development_dependency "rails"
  # s.add_runtime_dependency "rest-client"
end
