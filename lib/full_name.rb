module FullName
  def full_name locale = :en
    if locale != :en and locale != :fr
      return full_name(:en)
    end

    if first_name and first_name.size > 0
      if last_name and last_name.size > 0
        case locale  
          when :en then
            full_name = [first_name.capitalize, last_name.capitalize].join(' ')
          when :fr then
            full_name = "#{last_name.upcase}, #{first_name.capitalize}"
        end
      
      else
        full_name = first_name.capitalize
      end
    else
      case locale  
        when :en then
          full_name = last_name.capitalize
        when :fr then
          full_name = last_name.upcase           
      end
    end
  end
end

