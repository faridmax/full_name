module FullName
  LOCALES = [:en, :fr]

  def full_name locale = :en
    return full_name unless LOCALES.include? locale

    unless first_name.nil? or first_name.empty?
      unless last_name.nil? or last_name.empty?
        build_with_both locale     
      else
        build_with_firstname      
      end
    else
      unless last_name.nil? or last_name.empty?
        build_with_lastname locale       
      else
        ''     
      end        
    end
  end

  private 
    def build_with_both locale
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

    def build_with_lastname locale
      case locale  
        when :en then
          last_name.capitalize
        when :fr then
          last_name.upcase           
      end
    end

end

