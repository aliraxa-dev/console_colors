# lib/generators/colors/install/install_generator.rb
module Colors
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_initializer_file
        copy_file 'console.rb', 'lib/assets/console.rb'
      end

      def add_console_require
        application_rb_path = 'config/application.rb'

        # Read the content of the application.rb file
        application_content = File.read(application_rb_path)

        # Insert require_relative line after 'require "rails/all"'
        updated_content = application_content.gsub(/require "rails\/all"\n/) do |match|
          "#{match}require_relative '../lib/assets/console'\n"
        end

        # Write the updated content back to application.rb file
        File.open(application_rb_path, 'w') { |file| file.write(updated_content) }
      end
    end
  end
end
