class Transaction < ActiveRecord::Base
  attr_reader :trans, :confs
  attr_accessible :trans, :confs

  def trans=(ids)
  end

  def configs=(ids)
  end
end
