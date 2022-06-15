## suppresses "warning: rb_check_safe_obj will be removed in Ruby 3.0"
## SOURCE: https://dev.to/epigene/resolving-rbchecksafeobj-will-be-removed-in-ruby-30-warning-kie

# Problem on Ruby 2.7
# > BigDecimal(1).to_s("F")
# (pry):1: warning: rb_check_safe_obj will be removed in Ruby 3.0
# This monkeypatch silences it.
# TODO: remove when on Ruby 3+

require "bigdecimal"

module BigDecimalFormatWarningSuppressor
    # NOTE: this API comes from ActiveSupport::NumericWithFormat, the last ancestor prepended to BigDecimal.
    def to_s(format = nil, options = nil)
      original_verbosity = $VERBOSE
      $VERBOSE = nil
      v = super
      $VERBOSE = original_verbosity
      v
    end
  end
  
BigDecimal.prepend(BigDecimalFormatWarningSuppressor)
