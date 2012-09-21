require 'date'

if RUBY_VERSION >= '1.9'
  class << Date
    DAISY_DATE_RE = %r_\A\s*(\d{1,2})\D(\d{1,2})\D(\d{4}|\d{2})_.freeze

    alias _parse_without_daisy_date _parse

    def _parse(string, comp=true)
      _parse_without_daisy_date(convert_daisy_to_iso(string), comp)
    end

    if RUBY_VERSION >= '1.9.3'
      alias parse_without_daisy_date parse

      def parse(string, comp=true)
        parse_without_daisy_date(convert_daisy_to_iso(string), comp)
      end
    end

    private

    def convert_daisy_to_iso(string)
      string.sub(DAISY_DATE_RE){|m| "#$3-#$1-#$2"}
    end
  end

  if RUBY_VERSION >= '1.9.3'
    class << DateTime
      alias parse_without_daisy_date parse

      def parse(string, comp=true)
        parse_without_daisy_date(convert_daisy_to_iso(string), comp)
      end
    end
  end
end
