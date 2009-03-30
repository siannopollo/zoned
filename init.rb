require 'zoned'
ActionView::Base.send(:include, Zoned)
ActiveRecord::Base.send(:include, Zoned)
