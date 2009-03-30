module Zoned
  class << self
    attr_accessor :timezone_offset
  end
  
  def zoned(date_or_time)
    date_or_time.utc + timezone_offset
  end
  alias :z :zoned
  
  protected
    def timezone_offset
      tzo = Zoned.timezone_offset
      tzo ||= controller.send(:cookies)['timezone'] if self.respond_to?(:controller)
      tzo.to_i
    end
end
