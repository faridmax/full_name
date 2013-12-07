# FullName add a full_name method based on full_name and first_name
module FullName
  LOCALES = [:en, :fr]

  def full_name(locale = :en)
    return full_name unless LOCALES.include? locale

    if first_name.nil? && first_name.empty?
      if last_name.nil? && last_name.empty?
        ''
      else
        build_with_lastname locale
      end
    else
      if last_name.nil? && last_name.empty?
        build_with_firstname
      else
        build_with_both locale
      end
    end
  end

  private

    def build_with_both(locale)
      case locale
      when :en then
        [first_name.capitalize, last_name.capitalize].join(' ')
      when :fr then
        "#{last_name.upcase}, #{first_name.capitalize}"
      end
    end

    def build_with_firstname
      first_name.capitalize
    end

    def build_with_lastname(locale)
      case locale
      when :en then
        last_name.capitalize
      when :fr then
        last_name.upcase
      end
    end
end
