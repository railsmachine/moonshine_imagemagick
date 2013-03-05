module Imagemagick

  # Define options for this plugin via the <tt>configure</tt> method
  # in your application manifest:
  #
  #   configure(:imagemagick => {:foo => true})
  #
  # Then include the plugin and call the recipe(s) you need:
  #
  #  plugin :imagemagick
  #  recipe :imagemagick
  def imagemagick(options = {})
    imagemagick_dev_package = Facter.lsbdistrelease.to_f == 8.10 ? 'libmagick9-dev' : 'libmagickwand-dev'
    ['imagemagick', imagemagick_dev_package].each do |p|
      package p, :ensure => :installed, :before => exec('rails_gems')
    end
  end
  
end
