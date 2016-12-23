class ParsingFilter < ApplicationRecord

  default_scope{ order("parsing_filters.id desc") }

  def is_work_str
    if self.is_work  == 1
      "O"
    else
      "X"
    end
  end

  def keyword_type_str
    ParsingFilter::KEYWORD_TYPE_LIST[self.keyword_type]
  end


  KEYWORD_TYPE_LIST = [
    "태그",
    "유저명"
  ]

end
