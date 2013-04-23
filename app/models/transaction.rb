class Transaction < ActiveRecord::Base
  attr_reader :trans, :configs
  attr_accessible :trans, :configs

  def trans=(ids)
  end

  def configs=(ids)
  end
end
