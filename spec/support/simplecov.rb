require 'simplecov'

# FIXME: Add coverage criteria after add many tests!
# SimpleCov.minimum_coverage 80

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start 'rails'
