module Zoned
  class << self
    attr_accessor :timezone_offset
  end
  
  def zoned(date_or_time)
    return date_or_time unless timezone_offset
    date_or_time.utc + timezone_offset
  end
  alias :z :zoned
  
  protected
    def timezone_offset
      tzo = Zoned.timezone_offset
      tzo ||= controller.send(:cookies)['timezone'].to_i if self.respond_to?(:controller)
      tzo
    end
end
