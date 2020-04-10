require File.expand_path("../config/environment", __dir__)
require "rspec/rails"

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
  config.render_views

  config.include ActiveJob::TestHelper, :type => :job
end

require "bundler"
Bundler.require
