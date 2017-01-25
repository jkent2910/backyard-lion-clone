class Endorsement < ActiveRecord::Base
  #TODO This needs something.  I think.

  enum user_type: { athlete: 1, supporter: 2 }
end
