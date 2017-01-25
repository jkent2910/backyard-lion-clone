class TeamDecorator < Draper::Decorator
  delegate_all

  def sport_pronoun
    if object.sport_gender == "male"
      "Men's"
    elsif object.sport_gender == "female"
      "Women's"
    end
  end
end
