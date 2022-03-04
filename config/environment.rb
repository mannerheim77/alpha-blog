# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# This disables the "fields with errors" option that Rails applies to field validation errors
# It removes the div with class that gets wrapped around your field
ActionView::Base.field_error_proc = proc do |html_tag, instance|
  html_tag.html_safe
end
