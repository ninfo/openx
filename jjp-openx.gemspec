# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ninfo-openx}
  s.version = "1.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Patterson", "Andy Smith", "TouchLocal Plc", "DoppioJP"]
  s.date = %q{2010-05-19}
  s.description = %q{A Ruby interface to the OpenX XML-RPC API. Used touchlocal 1.1.2 version as base for adding more API calls to OpenX API from http://developer.openx.org/api/ . It also works with v2 of OpenX API, especially that it now can pass localTZ to the OpenX API which will give back the correct statistics for the local time zone.}
  s.email = %q{jacobjp@mac.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "Manifest.txt",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "jjp-openx.gemspec",
     "lib/openx.rb",
     "lib/openx/image.rb",
     "lib/openx/invocation.rb",
     "lib/openx/services.rb",
     "lib/openx/services/advertiser.rb",
     "lib/openx/services/agency.rb",
     "lib/openx/services/banner.rb",
     "lib/openx/services/base.rb",
     "lib/openx/services/campaign.rb",
     "lib/openx/services/publisher.rb",
     "lib/openx/services/session.rb",
     "lib/openx/services/statistics.rb",
     "lib/openx/services/zone.rb",
     "lib/openx/xmlrpc_client.rb",
     "php/openx-2.8.1-keywords.diff",
     "test/assets/300x250.jpg",
     "test/assets/cat.swf",
     "test/helper.rb",
     "test/test_advertiser.rb",
     "test/test_agency.rb",
     "test/test_banner.rb",
     "test/test_base.rb",
     "test/test_campaign.rb",
     "test/test_publisher.rb",
     "test/test_session.rb",
     "test/test_zone.rb"
  ]
  s.homepage = %q{http://github.com/DoppioJP/openx}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A Ruby interface to the OpenX XML-RPC API with more OpenX APIs used}
  s.test_files = [
    "test/helper.rb",
     "test/test_advertiser.rb",
     "test/test_agency.rb",
     "test/test_banner.rb",
     "test/test_base.rb",
     "test/test_campaign.rb",
     "test/test_publisher.rb",
     "test/test_session.rb",
     "test/test_zone.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
