require 'date'

if RUBY_VERSION >= '1.9'
  class << Date
    AMERICAN_DATE_RE = %r_\A\s*(\d{1,2})\D(\d{1,2})\D(\d{4}|\d{2})_.freeze

    alias _parse_without_american_date _parse

    def _parse(string, comp=true)
      _parse_without_american_date(convert_american_to_iso(string), comp)
    end

    if RUBY_VERSION >= '1.9.3'
      alias parse_without_american_date parse

      def parse(string, comp=true)
        parse_without_american_date(convert_american_to_iso(string), comp)
      end
    end

    private

    def convert_american_to_iso(string)
      string.sub(AMERICAN_DATE_RE){|m| "#$3-#$1-#$2"}
    end
  end

  if RUBY_VERSION >= '1.9.3'
    class << DateTime
      alias parse_without_american_date parse

      def parse(string, comp=true)
        parse_without_american_date(convert_american_to_iso(string), comp)
      end
    end
  end
end
