High Voltage
============

Rails engine for static pages.

... but be careful. [Danger!](http://www.youtube.com/watch?v=HD5tnb2RBYg)

Static pages?
-------------

Yeah, like "About us", "Directions", marketing pages, etc.

Installation
------------

    script/plugin install git://github.com/bumi/high_voltage.git

Usage
-----

Write your static pages and put them in the RAILS_ROOT/app/views/pages directory.

    mkdir app/views/pages
    touch app/views/pages/about.html.erb

After putting something interesting there, you can link to it from anywhere in your app with:

    link_to "About", page_path("about")

Bam.

Override
--------

Most common reasons to override? Authentication, layouts.

Create a PagesController of your own:

    script/generate controller pages

Then modify it to subclass from High Voltage, adding whatever you need:

    class PagesController < HighVoltage::PagesController
      before_filter :authenticate
      layout "danger"
    end

Don't forget to add the new route:

    map.resources :pages,
      :controller => 'pages',
      :only       => [:show]


Store Content in your database
-------

This plugin comes with a simple ActiveRecord model to store content for your static pages in the database. - just a simple model not more! (no admin interface etc.)

First create your migration:

    script/generate high_voltage

Edit the generated migration file if you need other columns than "title", "body" and "permalink".

Now create your pages using the HighVoltage::Page model:

    HighVoltage::Page.create(:title => "Hello world", :body => "Danger! Danger!")

When you now visit /pages/hello-world the plugin will search in the databese for your page using the permalink and render the show tempalte.

*Note:*
You can overwrite the HighVoltage::Page model if you need to. 
To customize the template just add a "show" template to your app/views/pages folder.


Testing
-------

Just a suggestion, but you can test your pages using Shoulda pretty easily:

    class PagesControllerTest < ActionController::TestCase
      tests PagesController

      %w(earn_money screencast about contact).each do |page|
        context "on GET to /pages/#{page}" do
          setup { get :show, :id => page }

          should_respond_with :success
          should_render_template page
        end
      end
    end

Enjoy!

Copyright (c) 2009 Thoughtbot, released under the MIT license

